#!/bin/bash
RESTORE_RFKILL_LINE="systemd.restore_state=0 rfkill.default_state=1"
CMDLINE="/boot/cmdline.txt"
if grep -qs "$RESTORE_RFKILL_LINE" "$CMDLINE"; then
    echo "rfkill restore already setup"
else
    sudo sed -i "1 s/$/ $RESTORE_RFKILL_LINE/" "$CMDLINE"
    echo "rfkill restore on startup ready"
fi
