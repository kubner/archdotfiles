#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [-x "$f" ] && . "$f"
    done
    unset f
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --experimental-backends &
dbus-run-session bspwm
