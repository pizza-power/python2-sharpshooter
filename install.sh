#!/bin/bash
#
# This is a basic script to use to get everything setup to run
# sharpshooter on (more) modern Linux installs that don't have 
# python2.7 installed even though it is supposed to run on python 3 
# also
#
# Follow the instructions for installing Sharpshooter
# as found here: https://github.com/mdsecactivebreach/SharpShooter
# 
# Author: pizzapower
#
# See the following link for more info on Sharpshooter usage
# https://www.mdsec.co.uk/2018/03/payload-generation-using-sharpshooter/
#

if [ "$EUID" -ne 0 ]
    then echo "Run as root!"
    exit
fi

# clone sharpshooter from github
git clone https://github.com/mdsecactivebreach/SharpShooter.git

add-apt-repository universe && apt update

apt install git curl

# install python2.7 and pip2
apt install python2.7 -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
chmod +x ./get-pip.py
sudo python2.7 ./get-pip.py

# install correct jsmin
wget https://files.pythonhosted.org/packages/17/73/615d1267a82ed26cd7c124108c3c61169d8e40c36d393883eaee3a561852/jsmin-2.2.2.tar.gz
tar xzf jsmin-2.2.2.tar.gz
python2.7 ./jsmin-2.2.2/setup.py install
