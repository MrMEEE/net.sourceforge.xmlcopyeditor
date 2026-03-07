#!/bin/sh
# Set GTK theme to use Adwaita icons
export GTK_THEME=Adwaita
export XDG_DATA_DIRS="/app/share:${XDG_DATA_DIRS}"
exec /app/bin/xmlcopyeditor "$@"
