
Open a text editor and create a new file and name it sudo-fingerprint.sh.

Add the following lines to the file:

bash

#!/bin/bash

Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

---------------------------------------------------------------

Backup the original sudo configuration file

cp /etc/pam.d/sudo /etc/pam.d/sudo.backup

---------------------------------------------------------------

Configure sudo to use fingerprint biometrics
echo "auth       sufficient     pam_tid.so" > /etc/pam.d/sudo

---------------------------------------------------------------

Save the file and exit the text editor.

---------------------------------------------------------------

Open a terminal and navigate to the directory where you saved the script.

---------------------------------------------------------------

Make the script executable by running the following command:

bash

chmod +x sudo-fingerprint.sh

---------------------------------------------------------------

Run the script with root privileges using the following command:

bash

sudo ./sudo-fingerprint.sh

---------------------------------------------------------------

Enter your password when prompted.

---------------------------------------------------------------

The script should back up the original sudo configuration file and then modify it to enable fingerprint biometrics for sudo. After running the script, you should be able to use your fingerprint to use sudo commands in the terminal on macOS.


#Disclaimer
Modifying system configuration files should be done with caution although we all know it's more fun to just go for it. Make sure you understand the changes being made and have a backup of important files before using this script. Be safe and have fun!
