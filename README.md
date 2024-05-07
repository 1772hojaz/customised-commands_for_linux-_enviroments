To make the custom command globally accessible on Linux you can add it to your system's Path environment variable. This variable is a list of directories that the shell searches for executable files when you type a command. By adding your script's directory to PATH, you can run the script from anywhere in the shell, without having to specify its full path.


Here are the steps on how to add your script to PATH:



1. Open your .bashrc file in a text editor. The .bashrc file is located in your home directory.


2. Add the following line to the .bashrc file:


Bash


#export PATH=$PATH:/customised-commands_for_linux_enviroments


3. Save the .bashrc file.


4. Reload your .bashrc file by typing the following command:


Bash
#source ~/.bashrc
