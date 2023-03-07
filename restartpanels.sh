#!/usr/bin/env bash

defaultpanel="$HOME/.config/herbstluftwm/panel.sh"

[ -x "$defaultpanel" ] || defaultpanel=/etc/xdg/herbstluftwm/panel.sh

panelcmd="${1:-$defaultpanel}"

herbstclient emit_hook quit_panel

for i in $(herbstclient list_monitors | cut -d':' -f1) ; do
    "$panelcmd" "$i" &
done
