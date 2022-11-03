#!/bin/bash

CONFIG=/etc/vsftpd.conf
USERLIST=/etc/vsftpd.userlist

# Create empty dir to use it as secure_chroot_dir
mkdir -p /var/run/vsftpd/empty

# Backup config file
cp $CONFIG $CONFIG.back

# Create new user
adduser $FTP_USER --disabled-password

# Set a password for new user
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# Create directory to share files via ftp-server
mkdir /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

# Remove write permissions
chmod a-w /home/$FTP_USER

# Add user to FTP userlist
echo $FTP_USER | tee -a $USERLIST


# Configure FTP access
sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g" $CONFIG
sed -i "s|#write_enable=YES|write_enable=YES|g" $CONFIG

echo "userlist_enable=YES" >> $CONFIG
echo "userlist_file=$USERLIST" >> $CONFIG
echo "userlist_deny=NO" >> $CONFIG

exec "$@"
