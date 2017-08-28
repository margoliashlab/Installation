# Installation of the Open Ephys GUI on a 64-bit machine


# Install the ZeroMQ library.

1. First, add the PPA to the package manager’s sources list:

        sudo add-apt-repository ppa:chris-lea/zeromq
2. Now update the package list information

        sudo apt-get update
3. Install the libraries

        sudo apt-get install libzmq5-dbg libzmq3-dev libzmq5

# Install HDF5 library

In order to compile the KWIKFormat plugin, you need to have the HDF5 library installed. HDF5 is a file format that's optimized for scientific data sets. It is extremely powerful, and offers many advantages over traditional binary formats. The GUI now allows users to save data in the Kwik format, which is based on HDF5.

The plugin requires you to use version 1.8.12, or higher, of HDF5. 

        sudo apt-get install libhdf5-serial-dev


# Install the Open Ephys GUI from source

        git clone https://github.com/open-ephys/plugin-GUI.git
        cd plugin-GUI

# Run the dependency installation script 
in the GUI/Resources/Scripts folder:

        cd Resources/Scripts
        sudo ./install_linux_dependencies.sh

# Copy the device interface rules file 
(in the same directory as above) to the system’s udev (not dev) folder and refresh the udev service:
       
        sudo cp 40-open-ephys.rules /etc/udev/rules.d
        sudo service udev restart


# Build the Open Ephys GUI
cd to GUI/Builds/Linux
  
        make -j4
        make -j4 -f Makefile.plugins


The installation should go smoothly if you’ve followed the above instructions. The binary to run the GUI is called ‘open-ephys’ and resides in GUI/Builds/Linux/build.

If the above steps are successful, there will be a compiled binary at Builds/Linux/build/open-ephys.
Note: this file may incorrectly be named 'open-ephys.so'; if so, it's best to rename it to 'open-ephys'.

# Running open-ephys GUI:

        cd build/
        ./open-ephys.so 

if you renamed the file to open-ephys then

        ./open-ephys
