#!/bin/bash

# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Backup the original sudo configuration file
cp /etc/pam.d/sudo /etc/pam.d/sudo.backup

# Configure sudo to use fingerprint biometrics
echo "auth       sufficient     pam_tid.so" > /etc/pam.d/sudo

echo "Fingerprint authentication enabled for sudo"
