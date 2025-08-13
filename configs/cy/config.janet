(key/bind :root [prefix "p"] (fn [&] (replay/open (pane/current) :copy true)))

(key/action
  action/cy-presentation
  "Open the .borg file for the cy presentation."
  (pane/attach (replay/open-file
                 :root
                 "/Users/caleb/.local/share/cy/2025.04.02.14.02.09.3-%Users%caleb%Developer%swarm%legion.borg")))

(param/set :root :default-frame "tiles")
(key/bind :root [prefix "a" ";"] action/set-pane-colors)

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
