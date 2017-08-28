#make a nw directory
cd /home/$USER
sudo mkdir Lab-Softwares
sudo chmod -R 777 /home/$USER/Lab-Softwares
cd /home/$USER/Lab-Softwares

sudo git clone https://github.com/dmeliza/yass.git
cd yass
sudo chmod -R 777 /home/$USER/Lab-Softwares/yass
sudo make
sudo make install
cd ..