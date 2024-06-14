#!/bin/bash

INSTALL_DIR="/usr/local/bin"

SCRIPT_NAME="brofetch.sh"
TARGET_NAME="brofetch"

echo "Copying $SCRIPT_NAME -> $INSTALL_DIR/$TARGET_NAME"
sudo cp $SCRIPT_NAME $INSTALL_DIR/$TARGET_NAME

echo "Permission to work is granted: $INSTALL_DIR/$TARGET_NAME"
sudo chmod +x $INSTALL_DIR/$TARGET_NAME

echo "Installation is complete. Now you can use the 'brofetch' command, mate. :)"
