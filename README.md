Make sure to give read, write and execute permissions to every script you want run from the terminal

                    sudo chmod 777 Install.sh

# Installation
This repository includes instructions for installation of lab programs: Intan, open-ephys, jack, jill, arf, yass, panoptisong and others with bash script or manually by following documentation.

Script creates a new folder named "Lab-Softwares" in /home/{user-directory}/. All the softwares get installed in Lab-Softwares in  /home/{user-directory}/Lab-Softwares 

Script has some specific versions of library packages and modules for current version of lab-softwares. However they can be easily modified by searching for package-name in the script and modifying them.

e.g. 
If  new version of Intan GUI arrives and there is a need to install the latest version:
1. Goto the line fetching Intan GUI from their website
2. Change the version number.
3. Make sure you update changes at all occurrence of version number.
4. Save script and run it.


(Make sure you double check the version number and download package with the website itself)

Demo: Lets us say we get version 2_0_0 for new Intan GUI
1. In the current version of script, go to line 80 and change from

          wget http://intantech.com/files/RHD2000interface_source_code_v1_5_2.zip
  to

          wget http://intantech.com/files/RHD2000interface_source_code_v2_0_0.zip

2. Make same changes at line number 94, 95, 96, 98, 105
3. Save script and run it from command line.


# Add path in system PATH.
To run open-ephys and Intan RHD2000interface directly from terminal, 

      sudo gedit /etc/environment

1. Add your "path to directory" containing RHD2000interface executable 
  
  e.g:
  /home/{user-name}/Lab-Softwares/RHD2000interface_v1.5.2/source

 PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/snap/bin:/home/spock/Lab-Softwares/RHD2000interface_v1.5.2/source"

2. For open-ephys:

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/snap/bin:/home/spock/Lab-Softwares/RHD2000interface_v1.5.2/source:/home/spock/Lab-Softwares/plugin-GUI/Builds/Linux/build”


To effect changes, run . /etc/environment. 
Since this file is just a simple script it will run and assign the new path to the PATH environment variable.

      . /etc/environment


3. Restart


( Please update any changes made to the script in "Manual-Install" document specific to each software as well as the "Install" bash script)
