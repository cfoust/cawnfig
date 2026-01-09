(key/bind :root [prefix "p"] (fn [&] (replay/open (pane/current) :copy true)))

(key/action
  action/margins-100
  "Set margins size to 100 columns."
  (def layout (layout/get))
  (def path (layout/attach-path layout))
  (def margins-path (layout/find-last layout path |(layout/type? :margins $)))
  (layout/set (if (not (nil? margins-path))
                (do
                  (def {:node node} (layout/path layout margins-path))
                  (layout/assoc
                    layout
                    margins-path
                    {:type :margins :node node :cols 100 :rows 60}))
                {:type :margins :node layout :cols 100 :rows 60})))

(key/bind :root [prefix "!"] action/margins-100)

(param/set :root :default-frame "big-hex")

(defn create-project
  "Create a new project."
  [path]
  (def projects (group/mkdir :root "/projects"))
  (def project (group/new projects :name (path/base path)))
  (def editor
    (cmd/new project
             :path path
             :name "editor"
             :restart true
             :command (os/getenv "EDITOR" "vim")))
  (def shell
    (cmd/new project
             :path path
             :name "shell"
             :restart true))
  (param/set :persist
             (keyword "project-" (string/slice (path/base path) 0 1))
             path)
  (pane/attach editor))

(defn get-project
  "Given a prefix, get the NodeID of the editor node for a project with that prefix or nil if none exists."
  [prefix]
  (as?-> (group/mkdir :root "/projects") _
         (group/children _)
         (find |(string/has-prefix? prefix (tree/name $)) _)
         (group/children _)
         # First child is the editor
         (_ 0)))

(defn is-dir
  [path]
  (= :directory (os/stat path :mode)))

(defn get-git-repos
  [path]
  (as?-> path _
         (os/dir _)
         (map |(path/join @[path $]) _)
         (filter |(is-dir (path/join @[$ ".git"])) _)))

(def project-dirs @["/Users/caleb/Developer/cfoust"])

(defn open-project [prefix]
  (def lowered (string/ascii-lower prefix))

  # Check whether a project is already open
  (def existing (get-project lowered))
  (when existing
    (pane/attach existing)
    (break))

  # Or whether we have a key in the persistent store
  (def persisted (param/get
                   (keyword "project-" lowered)
                   :target
                   :persist))
  (when persisted
    (create-project persisted)
    (break))

  # Otherwise look through paths
  (def path (as?-> (map get-git-repos project-dirs) _
                   (flatten _)
                   (map |[(path/base $) $] _)
                   (find |(string/has-prefix? lowered ($ 0)) _)
                   (_ 1)))
  (when path
    (create-project path)))


(key/bind :root [prefix "n"]
          (fn [] (create-project (cmd/path (pane/current)))))

(key/bind :root [prefix [:re "[ABD-OR-Z]"]] open-project)

# Claude Code pane tracking
(defn claude/get-panes
  ```Get all cy panes running Claude Code with their statuses.

  Returns an array of structs with the following keys:
    :id     - NodeID of the pane
    :path   - Full path of the pane in the tree (e.g. "/project/pane-1")
    :name   - Name of the pane node
    :status - Claude status: "working", "idle", or "permission"
  ```
  []
  (def all-panes (group/leaves :root))

  (def claude-panes
    (seq [pane-id :in all-panes
          :let [status (try
                         (param/get :claude-status :target pane-id)
                         ([_] nil))]
          :when status]
      {:id pane-id
       :path (tree/path pane-id)
       :name (tree/name pane-id)
       :status status}))

  claude-panes)

(defn claude/get-by-status
  ```Get all Claude Code panes filtered by status.

  Args:
    status - One of "working", "idle", or "permission"

  Returns an array of pane structs matching the status.
  ```
  [status]
  (def all-claude (claude/get-panes))
  (filter |(= ($ :status) status) all-claude))

(defn claude/attach-next
  ```Attach to the next Claude Code pane (cycle through them).

  If any pane needs permission, jump to it immediately.
  Otherwise, cycles through Claude panes, skipping the current one if it's a Claude pane.
  If no Claude panes exist, does nothing.
  ```
  []
  (def panes (claude/get-panes))

  (if (empty? panes)
    (msg/toast :warn "No Claude Code panes found")
    (do
      # Check if any pane needs permission
      (def permission-pane (find |(= ($ :status) "permission") panes))

      (if permission-pane
        # Jump directly to permission pane
        (pane/attach (permission-pane :id))
        # Otherwise, cycle through panes
        (do
          (def current (pane/current))
          (def current-is-claude
            (try
              (param/get :claude-status :target current)
              ([_] nil)))

          (if current-is-claude
            (do
              (def current-idx
                (find-index |(= ($ :id) current) panes))
              (def next-idx
                (if current-idx
                  (% (+ current-idx 1) (length panes))
                  0))
              (pane/attach ((panes next-idx) :id)))
            (pane/attach ((panes 0) :id))))))))

(defn claude/attach-by-status
  ```Attach to the first Claude Code pane with the given status.

  Args:
    status - One of "working", "idle", or "permission"

  If no pane with that status exists, shows a warning toast.
  ```
  [status]
  (def panes (claude/get-by-status status))

  (if (empty? panes)
    (msg/toast :warn (string/format "No Claude Code panes with status: %s" status))
    (pane/attach ((panes 0) :id))))

(defn claude/find-pane
  ```Open a fuzzy finder to select and attach to a Claude Code pane.

  Shows a table with the pane path and status, with live pane previews.
  ```
  []
  (def panes (claude/get-panes))

  (if (empty? panes)
    (msg/toast :warn "No Claude Code panes found")
    (do
      # Format each pane as a table row
      (def items
        (map
          (fn [pane]
            # Style status with red background if idle, otherwise no styling
            (def styled-status
              (if (= (pane :status) "idle")
                (style/text (pane :status) :bg "1")
                (pane :status)))

            # Return [columns, preview, value]
            [[(pane :path) styled-status]
             {:type :node :id (pane :id)}
             (pane :id)])
          panes))

      # Show the fuzzy finder with headers
      (as?-> items _
             (input/find _
                         :headers ["path" "status"]
                         :prompt "vibe mode")
             (pane/attach _)))))

(key/action
  action/find-claude-pane
  "Find and attach to a Claude Code pane"
  (claude/find-pane))

(key/action
  action/next-claude-pane
  "Cycle to the next Claude Code pane"
  (claude/attach-next))

(key/action
  action/goto-claude-permission
  "Attach to a Claude Code pane waiting for permission"
  (claude/attach-by-status "permission"))

(key/bind :root [prefix "C"] action/find-claude-pane)
(key/bind :root [prefix "c"] action/next-claude-pane)
