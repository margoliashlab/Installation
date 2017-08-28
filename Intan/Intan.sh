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

sudo apt-get install qt5-default libxrandr-dev
sudo apt-get install build-essential
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5

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
mkdir RHD2000interface_source_code_v1_5_2
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

sudo apt-get update
