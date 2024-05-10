#!/bin/bash

# Variables
APP_FILE="SonicWall Mobile Connect.app"
APP_NAME="SonicWall Mobile Connect"
TMP_DIR="$HOME/Downloads/TMP_SW"
GIT_URL="https://github.com/GregBlickley/SonicWallMobileConnectDeployment/archive/main.zip"
REPO_NAME="SonicWallMobileConnectDeployment"
REPO_LOC="SonicWallMobileConnectDeployment-main"

# check to see if app is installed already
if ls /Applications | grep -qi "$APP_NAME"; then
    
    # if it is exit 0
    #echo "$APP_NAME is installed."
    exit 0

    # else
    else
        #echo "$APP_NAME is not installed."


        # Create the destination folder if it doesn't exist
        mkdir -p "$TMP_DIR"

        # Download the ZIP archive using curl
        curl -sSL "$GIT_URL" -o "$TMP_DIR/SonicWallMobileConnectDeployment-main.zip"

        # Check if the download was successful
        if [ $? -eq 0 ]; then
            #echo "Repository ZIP archive downloaded successfully"
        else
            #echo "Failed to download repository ZIP archive"
            exit 1
        fi

        # Unzip the repository's ZIP archive
        unzip -q "$TMP_DIR/SonicWallMobileConnectDeployment-main.zip" -d "$TMP_DIR"

        # Check if the unzip was successful
        if [ $? -eq 0 ]; then
            #echo "Repository ZIP archive extracted successfully to $TMP_DIR"
        else
            #echo "Failed to extract repository ZIP archive"
            exit 1
        fi

        # Clean up the ZIP archive
        rm "$TMP_DIR/SonicWallMobileConnectDeployment-main.zip"

        #echo "Repository downloaded and extracted successfully"



        # run the install.sh file downloaded from GitHub
        source "$TMP_DIR/$REPO_LOC/installer.sh"

        # remove the directory that was downloaded from GitHub for clean-up
        if [ -d "$TMP_DIR" ]; then
            rm -r "$TMP_DIR"
            #echo "File clean-up complete"
        else
            #echo "Files were already removed."
        fi

        # verify that the application was added to the Applications folder
        if ls /Applications | grep -qi "$APP_NAME"; then
            #echo "$APP_NAME was successfully installed"
            exit 0
        else
            #echo "$APP_NAME failed to install."
            exit 1
        fi
fi