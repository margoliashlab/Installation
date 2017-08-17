For Intan RHD2000Interface on Ubuntu (14 & 16)

# Install  qt5:
    sudo apt-get install qt5-default
Note: In new versions of Ubuntu>16, qt5-default comes pre-installed

# Install build-essential
    sudo apt-get install build-essential

Note: In new versions of Ubuntu>16, build-essential comes pre-installed


# Additional packages to resolve some dependencies with Ubuntu.

    sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5 


# Copy the libokFrontPanel.so from linux64 folder into the source folder.

    cd RHD2000interface_source_code_v1_5_2/Opal\ Kelly\ library\ files/Linux\ 64-bit/

    sudo cp -a libokFrontPanel.so /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2/source
  
    cd ../../source


# Add the following line to the RHD2000interface.pro file: 
	unix:LIBS += -L./ -l okFrontPanel -ldl 

# Copy main.bit from ../RHD2000interface_source_code_v1_5_2/  to ../RHD2000interface_source_code_v1_5_2/source/
       sudo cp -a /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2/main.bit /home/$USER/Lab-Softwares/RHD2000interface_source_code_v1_5_2/source

# In terminal, navigate to source folder in RHD2000interface_v1.5.2 and run qmake *.pro

       cd RHD2000interface_source_code_v1_5_2/source/
       qmake *.pro 
This generates a makefile in the source folder

# Add the following line in makefile generated after running qmake *.pro(previous step)
	
Open Makefile with gedit 
Add following line in Makefile just at line number 44.
	
	CXXFLAGS += -std=c++11  
# Run make
      make
Now we have an executable file by the name of RHD2000interface in source folder. Double click and run the executable.
