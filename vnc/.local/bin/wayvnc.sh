#!/usr/bin/env bash

PORT=5900

# Check if wayvnc process is running
if ! pgrep -x "wayvnc" > /dev/null; then
    echo "wayvnc is not running. Starting start sway and wayvnc..."
    export WLR_BACKENDS=headless
    export WAYLAND_DISPLAY=wayland-1
    sway &
    sleep 4
    WAYLAND_DISPLAY=wayland-1 wayvnc localhost $PORT &
else
    echo "wayvnc is already running."
fi
echo "Use SSH tunnel: ssh -L $PORT:localhost:$PORT $USER@$HOSTNAME"
