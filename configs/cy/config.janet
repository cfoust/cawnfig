(key/bind :root [prefix "p"] (fn [&] (replay/open (pane/current) :copy true)))

(key/action
  action/cy-presentation
  "Open the .borg file for the cy presentation."
  (pane/attach (replay/open-file
                 :root
                 "/Users/cfoust/.local/share/cy/2024.09.25.20.28.27.3-%Users%cfoust%Developer%cfoust%zapiski.borg")))

(key/action
  caleb/test
  "this is a test"
  (msg/toast :info "asd"))

(param/set :root :default-frame "big-hex")
(key/bind :root [prefix "a" ";"] action/set-pane-colors)
(key/bind :root ["alt+o"] caleb/test)
