#!/bin/bash

test_KOBman_init(){

#This Function Serves the purpose of  Initialising all the variables to be handled.

echo "Inside test_KOBman_init..."
echo "======KOBman Testing for Installation Command======"
check=$false    #check variable used for checking whether .kobman directory is present or not.

}
__KOBman_install()
{
  #This function installs the .kobman directory in your home directory.
        echo "=========================Installing KOBMAN ======================"
        curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
        source "/$KOBMAN_DIR/bin/kobman-init.sh"
        echo "=========================Install Completed ======================"
        cd ~/
}

test_KOBman_execute(){

echo "Inside test_KOBman_execute...."
#Checking whether .kobman exists or not..

if ls -a| grep .kobman;
then
        echo "====Removing and Reinstalling KOBman====="
        sudo rm -rv .kobman
        __KOBman_install
else
        echo "=====Installing KOBman====="
        __KOBman_install
fi
   
}

cd ~/

test_KOBman_verify(){

echo "Inside test_KOBman_verify..."
echo "Verifying KOBman..."
if [ -d "/home/user/.kobman" ];
then
        check=$true
        echo "KOBman is Installed Successfully..."
else
        echo "Try Installing KOBman again..." 
fi
}

test_KOBman_cleanup(){

       #This function servers the purpose of Removing the files after the test...
        echo "Inside test_KOBman_cleanup"
        echo "Cleaning up KOBman.."
}

test_KOBman_init
test_KOBman_execute
test_KOBman_verify
test_KOBman_cleanup


                    
