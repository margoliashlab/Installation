#!/bin/bash
echo ""
echo "===================="
echo "Welcome to Margoliash's lab"
echo "===================="
echo ""

echo "Please make sure to update any changes in documentation and bash script"


sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
sudo apt-get update

sudo apt-get install build-essential
sudo apt-get install scons libboost-all-dev libsndfile1-dev libsamplerate0-dev hdf5-helpers hdf5-tools libhdf5-dev libzmq-dev python-dev libxft-dev
sudo apt-get install qtdeclarative5-dev libxrandr-dev
sudo apt-get install qt5-default
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5

#make a new directory
cd /home/$USER
sudo mkdir Lab-Softwares
sudo chmod -R 777 /home/$USER/Lab-Softwares

#Open_ephys
cd /home/$USER/Lab-Softwares
sudo add-apt-repository ppa:chris-lea/zeromq
sudo apt-get update
sudo apt-get install libzmq5-dbg libzmq3-dev libzmq5

if [ "$?" = "0" ]; then
        echo "packages exist and installed."
else
      color() {
      		printf '\033[%sm%s\033[m\n' "$@"
      # usage color "31;5" "string"
      # 0 default
      # 5 blink, 1 strong, 4 underlined
      # fg: 31 red,  32 green, 33 yellow, 34 blue, 35 purple, 36 cyan, 37 white
      # bg: 40 black, 41 red, 44 blue, 45 purple
      }
	string="failed: package does not exists. Please look for updated packages."
	color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi


git clone https://github.com/open-ephys/plugin-GUI.git
sudo chmod -R 777 plugin-GUI
cd plugin-GUI
cd Resources/Scripts
sudo ./install_linux_dependencies.sh
sudo cp 40-open-ephys.rules /etc/udev/rules.d
sudo service udev restart
cd ../../Builds/Linux
make -j4
if [ "$?" = "0" ]; then
        echo "make build successful"
else
      color() {
      		printf '\033[%sm%s\033[m\n' "$@"
     
      }
	string="make failed"
	color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi

make -j4 -f Makefile.plugins

if [ "$?" = "0" ]; then
        echo "makefile build successful"
else
      color() {
      		printf '\033[%sm%s\033[m\n' "$@"
     
      }
	string="makefile.plugins failed"
	color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi


echo ""
echo "===================="
echo "Open-ephys installed successfully"
echo "===================="
echo "Following lines will execute open-ephys"
echo "cd build/"
echo "./open-ephys.so (or try) ./open-ephys "
#######
