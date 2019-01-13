#!/bin/bash 

echo 'Starting.'

echo 'Updating packages.'
apt-get update

echo 'Upgrading packages.'
apt-get upgrade -y

echo 'Dist-upgrading packages.'
apt-get dist-upgrade -y

echo 'Autoremoving packages.'
apt autoremove -y

echo 'Done.'
