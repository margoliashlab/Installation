Assuming you have arf, hdf5 and jack already installed.

# JILL prerequisites: Install HDF5 library

    sudo apt-get install scons libboost-all-dev libsndfile1-dev libsamplerate0-dev
    hdf5-helpers hdf5-tools libhdf5-dev libzmq-dev python-dev libxft-dev libxrandr-dev


Visit https://support.hdfgroup.org/HDF5/release/obtainsrc.html to grab the source code for HDF5 in tar.  

Download the source code,
Unzip the source code,
In the source code directory, run configure by typing the following:
     
     ./configure --prefix=/usr/local/hdf5 --enable-cxx
Run 'make' to compile the code and then 'make check' to check for errors.

Run 'sudo make install' and 'sudo make check-install' to install.
The check process might take time for its execution.

You'll need to provide the location of the libraries you've just installed by setting the following environment variables before attempting to build Jill

    export CPLUS_INCLUDE_PATH=/usr/local/hdf5/include
    export LIBRARY_PATH=/usr/local/hdf5/lib
    export LD_LIBRARY_PATH=/usr/local/hdf5/lib

# Install ARF:
Goto your software installation desired folder
e.g.  cd Software

     git clone https://github.com/dmeliza/arf.git
     cd arf
     sudo make install	
# JILL modules
    git clone https://github.com/dmeliza/jill.git
    cd jill
    scons -Q modules
# To install modules in a system location, use the following command:
    sudo scons -Q install

The default install location is /usr/local/bin
 
