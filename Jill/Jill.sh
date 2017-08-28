#!/bin/bash
echo ""
echo "===================="
echo "Welcome to Margoliash's lab"
echo "===================="
echo ""

echo "Please make sure to update any changes in documentation and bash script"

#make a new directory
cd /home/$USER
sudo mkdir Lab-Softwares
sudo chmod -R 777 /home/$USER/Lab-Softwares


#install JACK
sudo apt-get install jackd1 libjack-dev qjackctl

sudo apt-get install git
sudo apt-get install scons libboost-all-dev libsndfile1-dev libsamplerate0-dev hdf5-helpers hdf5-tools libhdf5-dev libzmq-dev python-dev libxft-dev
sudo apt-get install qt5-default libxrandr-dev
sudo apt-get install build-essential
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5

cd /home/$USER/Lab-Softwares

#Jill modules
git clone https://github.com/dmeliza/jill.git
cd jill
sudo chmod -R 777 /home/$USER/Lab-Softwares/jill
scons -Q modules
sudo scons -Q install
cd ..
# The default install location is /usr/local/bin