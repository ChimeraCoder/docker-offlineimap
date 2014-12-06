#! /bin/sh

sed -i "s/remoteuser = YOUR_EMAIL_ADDRESS@gmail.com/remoteuser = $EMAIL/" /home/offlineimap/.offlineimaprc
sed -i "s/remotepass = YOUR_PASSWORD_HERE/remotepass = $PASSWORD/" /home/offlineimap/.offlineimaprc

exec offlineimap -c /home/offlineimap/.offlineimaprc
