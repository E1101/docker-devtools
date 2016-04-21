#!/bin/bash

## Set defaults for environmental variables in case they are undefined
USER=${USER:=root}
USERID=${USERID:=1000}

echo "creating new $USER with UID $USERID"
useradd -u $USERID --group sudo,root $USER

## Add a password to unlock user
echo "$USER:$USER" | chpasswd

# Add User To sudoers
adduser $USER sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo "$USER added to sudoers"

cdir=$(pwd)

if [ "$(whoami)" != $USER ] 
then
   echo "Change User To $USER"
   extra="$@"
   # su - $USER -s/bin/bash -c "cd $cdir; $extra"
   "$@"
   chown -R $USER:$USER $cdir
else
   exec "$@"
fi

