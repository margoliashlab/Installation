#!/bin/bash
echo ""
echo "===================="
echo "Welcome to Margoliash's lab"
echo "===================="
echo ""

echo "Please make sure to update any changes in documentation and bash script"

sudo apt-get install git
sudo apt-get install scons libboost-all-dev libsndfile1-dev libsamplerate0-dev hdf5-helpers hdf5-tools libhdf5-dev libzmq-dev python-dev libxft-dev
sudo apt-get install qt5-default libxrandr-dev
sudo apt-get install build-essential
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5

cd /home/$USER
sudo mkdir Lab-Softwares
sudo chmod -R 777 /home/$USER/Lab-Softwares
cd Lab-Softwares

#installing JACK 
sudo apt-get install jackd1 libjack-dev qjackctl

#hdf5
wget https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.1.tar
tar -xvf hdf5-1.10.1.tar
cd hdf5-1.10.1
./configure --prefix=/usr/local/hdf5 --enable-cxx
sudo make
sudo make check
sudo make install
sudo make check-install
export CPLUS_INCLUDE_PATH=/usr/local/hdf5/include
export LIBRARY_PATH=/usr/local/hdf5/lib
export LD_LIBRARY_PATH=/usr/local/hdf5/lib
cd ..

#Arf

git clone https://github.com/dmeliza/arf.git
cd arf
sudo chmod -R 777 /home/$USER/Lab-Softwares/arf
sudo make install
cd ..

#Jill modules
git clone https://github.com/dmeliza/jill.git
cd jill
sudo chmod -R 777 /home/$USER/Lab-Softwares/jill
scons -Q modules
sudo scons -Q install
cd ..
# The default install location is /usr/local/bin


#mplayer and mencoder
sudo apt-get install mplayer mencoder


#Yass
sudo git clone https://github.com/dmeliza/yass.git
cd yass
sudo chmod -R 777 /home/$USER/Lab-Softwares/yass
sudo make
sudo make install
cd ..


# panoptisong
git clone https://github.com/kylerbrown/panoptisong.git
sudo apt-get -y install python-pip
pip install --upgrade pip
pip install urwid




# Intan 
cd /home/$USER/Lab-Softwares
wget http://intantech.com/files/RHD2000interface_source_code_v1_5_2.zip

if [ "$?" = "0" ]; then
        echo "Download successful"
else
      color() {
          printf '\033[%sm%s\033[m\n' "$@"
      
      }
  string="download failed. Please verify download link"
  color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi

# Intan USB drivers
wget http://intantech.com/files/Intan_controller_USB_drivers.zip
if [ "$?" = "0" ]; then
        echo "USB drivers download successful"
else
      color() {
          printf '\033[%sm%s\033[m\n' "$@"
      
      }
  string="USB drivers download failed. Please verify download link"
  color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi
#USB drivers copy

unzip Intan_controller_USB_drivers.zip -d USB\ interface\ drivers
sudo chmod -R 777 /home/$USER/Lab-Softwares/USB\ interface\ drivers
cd /home/$USER/Lab-Softwares/USB\ interface\ drivers/USB\ interface\ drivers/Linux
sudo cp -a 60-opalkelly.rules /etc/udev/rules.d/
cd /home/$USER/Lab-Softwares

# Intan unzip
sudo mkdir RHD2000interface_source_code_v1_5_2
unzip RHD2000interface_source_code_v1_5_2.zip -d RHD2000interface_source_code_v1_5_2


sudo chmod -R 777 /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2
cd RHD2000interface_source_code_v1_5_2/Opal\ Kelly\ library\ files/Linux\ 64-bit/
sudo cp -a libokFrontPanel.so /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2/source

cd ../../source
echo "unix:LIBS += -L./ -l okFrontPanel -ldl" >> RHD2000interface.pro
cd ..


sudo cp -a main.bit /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2/source
cd source
sudo qmake *.pro
sed -i -e '44iCXXFLAGS += -std=c++11\' Makefile
sudo make
echo ""
echo "===================="
echo "Intan RHD2000interface installed successfully"
echo "===================="
echo "Execute following lines to run Intan RHD2000interface"
echo ""
echo "./RHD2000interface "





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

sudo apt-get update
echo ""
echo "===================="
echo "Open-ephys installed successfully"
echo "===================="
echo "Following lines will execute open-ephys"
echo "cd build/"
echo "./open-ephys.so (or try) ./open-ephys "
#######