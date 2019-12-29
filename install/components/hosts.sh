#!/bin/bash

installer "Making internet suck less"

running "Make backup of hosts file"
CURRENT_DATE=$(date '+%HH%MM-%dD%mM%Y')
sudo cp /etc/hosts /etc/hosts.$CURRENT_DATE.backup
dim "   Backup created at /etc/hosts.$CURRENT_DATE.backup"

running "Downloading new hosts file"
curl -s https://someonewhocares.org/hosts/hosts > $PATH_INSTALL/hosts

running "Install new hosts file"
sudo cp $PATH_INSTALL/hosts /etc/hosts

running "Remove temp hosts file"
rm $PATH_INSTALL/hosts
