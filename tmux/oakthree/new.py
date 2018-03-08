"""
Create a new oakthree project, also creating any sessions necessary.
"""

import libtmux, os
from oakthree import *

server  = libtmux.Server()
wrapper = ServerWrapper(server)

ot = wrapper.ensure_session(OAKTHREE_SESSION_NAME)

session = wrapper.get_session()
window  = session.attached_window

# The current working directory of this pane.
path = wrapper.display_message('#{pane_current_path}')
basename = os.path.basename(path)

editor_name = basename + OAKTHREE_EDITOR_SUFFIX
shell_name  = basename + OAKTHREE_SHELL_SUFFIX

# Kill any windows that already exist there with these names
remove_window(ot, editor_name)
remove_window(ot, shell_name)

# Move this window to the ot session and use it as a shell there
window.move_window(session=OAKTHREE_SESSION_NAME)
window.rename_window(shell_name)

ot.new_window(start_directory=path,
              attach=True,
              window_name=editor_name,
              window_shell="$EDITOR")

window.select_window()
server.switch_client(OAKTHREE_SESSION_NAME)
