#!/bin/bash

#variables
SCRIPT_DIR="$(dirname "$0")"
DMG_PATH="Sonicwall_VD.dmg"
DMG_NAME="Sonicwall_VD"
APP_NAME="SonicWall Mobile Connect.app"

#mounting the V-Drive
hdiutil attach "$SCRIPT_DIR/$DMG_PATH"


#transfer files over to applications folder
mv "/Volumes/$DMG_NAME/$APP_NAME" "/Applications"


#unmount the V-Drive
hdiutil detach "/Volumes/$DMG_NAME"