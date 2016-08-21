#!/bin/bash

groupadd ${SMB_GROUP}

useradd ${SMB_USER} -M

chpasswd <<< ${SMB_USER}:${SMB_PASS}

chown ${SMB_USER}:${SMB_GROUP} /home/photos

sed -i -e "s/SMB_USER/${SMB_USER}/g" /etc/samba/smb.conf

(echo ${SMB_PASS}; echo ${SMB_PASS}) | smbpasswd -a ${SMB_USER}

service smbd restart && /bin/bash
