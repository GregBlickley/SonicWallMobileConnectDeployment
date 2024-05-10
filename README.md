Overview:
  
    This repository is used to install SonicWall Mobile Connect on MacOS devices, with a pre-configured VPN.

Files:
  
    Sonicwall_VD.dmg - This file is a virtual disk that contain the data and application for SonicWall Mobile Connect. It's contents will get moved into the application folder during installation

    installer.sh - This file is executed and simply mounts the .dmg file and moves the application over to the "/Applications" directory for installation. It then unmounts the drive.

    GitHub_Installer.sh - This is the file that gets added into Intune to be executed. It downloads the Git Repo's files and then executes the installer.sh file. Once the installer.sh is ran the script performs a file clean-up to remove the files from the Git Repo leaving behind just the application. 
