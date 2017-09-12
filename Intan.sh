#!/bin/bash
cd /home/$USER
sudo mkdir Lab-Softwares
sudo chmod -R 777 /home/$USER/Lab-Softwares
cd /home/$USER/Lab-Softwares


sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
sudo apt-get update


sudo apt-get install git
sudo apt-get install build-essential 
sudo apt-get install libfontconfig1
sudo apt-get install scons libboost-all-dev python-dev
sudo apt-get install qtdeclarative5-dev libxrandr-dev

sudo apt-get install qt5-default
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5




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
cd /home/$USER/Lab-Softwares/

# Intan unzip
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
sed -i -e '40iCXXFLAGS += -std=c++11\' Makefile
sudo make -j4


if [ "$?" = "0" ]; then
        echo "install successful"
	echo ""
	echo "===================="
	echo "Intan RHD2000interface installed successfully"
	echo "===================="
else
      color() {
          printf '\033[%sm%s\033[m\n' "$@"
      
      }
  string="Installation failed."
  color '31;1' "$string" >&2

    exit $EXIT_CODE
  
fi
