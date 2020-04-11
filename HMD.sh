#!/bin/bash
#
# RAGHU VARMA Build Script 
# Coded by RV 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

clear

cred=/root
path=/root/tool
rawpath=/root/raw
password=$(cat $cred/cred** | grep sf | cut -d "=" -f 2)


D1()
{
    ./setup.sh
    mkdir out
    cd DRG
    ./DRG.sh
    cd ..
    sf=https://sourceforge.net/projects/hmd-vendors/files/DRG/
    ./Patcher/patcher.sh -v $path/out/2019-12.zip $path/out/2020-01.zip $path/out/2020-02.zip $path/out/2020-03_1.zip
    cd out
    mkdir vendor
    mount -o rw,noatime vendor.img vendor
    cp -r vendor/build.prop $path/out
    umount vendor
    rm -r vendor
    code=`cat build.prop | grep ro.build.software.version | cut -d "=" -f 2`
    product=`cat build.prop | grep ro.product.vendor.name | cut -d "=" -f 2`
    zip -r $product-$code.zip **.img
    sshpass -p $password rsync -avP -e ssh $product-$code.zip raghuvarma331@frs.sourceforge.net:/home/frs/project/hmd-vendors/DRG
    cd $path
    rm -r out
}

B1()
{
    ./setup.sh
    mkdir out
    cd B2N
    ./B2N.sh
    cd ..
    sf=https://sourceforge.net/projects/hmd-vendors/files/B2N/
    ./Patcher/patcher.sh -v $path/out/2019-12.zip $path/out/2020-01.zip $path/out/2020-02.zip $path/out/2020-03_1.zip
    cd out
    mkdir vendor
    mount -o rw,noatime vendor.img vendor
    cp -r vendor/build.prop $path/out
    umount vendor
    rm -r vendor
    code=`cat build.prop | grep ro.build.software.version | cut -d "=" -f 2`
    product=`cat build.prop | grep ro.product.vendor.name | cut -d "=" -f 2`
    zip -r $product-$code.zip **.img
    sshpass -p $password rsync -avP -e ssh $product-$code.zip raghuvarma331@frs.sourceforge.net:/home/frs/project/hmd-vendors/B2N
    cd $path
    rm -r out
}

C1()
{
    ./setup.sh
    mkdir out
    cd CTL
    ./CTL.sh
    cd ..
    sf=https://sourceforge.net/projects/hmd-vendors/files/CTL/
    ./Patcher/patcher.sh -v $path/out/2019-11.zip $path/out/2019-12.zip $path/out/2020-01.zip $path/out/2020-02.zip $path/out/2020-03_1.zip
    cd out
    mkdir vendor
    mount -o rw,noatime vendor.img vendor
    cp -r vendor/build.prop $path/out
    umount vendor
    rm -r vendor
    code=`cat build.prop | grep ro.build.software.version | cut -d "=" -f 2`
    product=`cat build.prop | grep ro.product.vendor.name | cut -d "=" -f 2`
    zip -r $product-$code.zip **.img
    sshpass -p $password rsync -avP -e ssh $product-$code.zip raghuvarma331@frs.sourceforge.net:/home/frs/project/hmd-vendors/CTL
    cd $path
    rm -r out
}

P1()
{
    ./setup.sh
    mkdir out
    cd PL2
    ./PL2.sh
    cd ..
    sf=https://sourceforge.net/projects/hmd-vendors/files/PL2/
    ./Patcher/patcher.sh -v $path/out/2019-12.zip $path/out/2020-01.zip $path/out/2020-02.zip $path/out/2020-03_1.zip
    cd out
    mkdir vendor
    mount -o rw,noatime vendor.img vendor
    cp -r vendor/build.prop $path/out
    umount vendor
    rm -r vendor
    code=`cat build.prop | grep ro.build.software.version | cut -d "=" -f 2`
    product=`cat build.prop | grep ro.product.vendor.name | cut -d "=" -f 2`
    zip -r $product-$code.zip **.img
    sshpass -p $password rsync -avP -e ssh $product-$code.zip raghuvarma331@frs.sourceforge.net:/home/frs/project/hmd-vendors/PL2
    cd $path
    rm -r out
}


# Main Menu
clear
echo "-------------------------------------------------"
echo "A simple tool to make home brew stock vendor.zip "
echo "          Coded By Raghu Varma.G                 "
echo "-------------------------------------------------"
PS3='Please select your option (1-5): '
menuvar=("DRG" "B2N" "CTL" "PL2" "ALL" "Exit")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
        "DRG")
            clear
            echo "----------------------------------------------"           
            echo "Please be patient..."
            # DRG
            echo "----------------------------------------------"
            echo "Posting in channel..."
            echo " "
            D1
            echo "----------------------------------------------"
            echo "Posting in Channel finished."
            echo " "
            echo "----------------------------------------------"
            echo "Press any key for end the script."
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;	
        "B2N")
            clear
            echo "----------------------------------------------"           
            echo "Please be patient..."
            # B2N
            echo "----------------------------------------------"
            echo "Posting in channel..."
            echo " "
            B1
	    echo " "	    
            echo "----------------------------------------------"
            echo "Posting in Channel finished."
            echo " "
            echo "----------------------------------------------"
            echo "Press any key for end the script."
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;	
        "CTL")
            clear
            echo "----------------------------------------------"           
            echo "Please be patient..."
            # CTL
            echo "----------------------------------------------"
            echo "Posting in channel..."
            echo " "
            C1
	    echo " "	    
            echo "----------------------------------------------"
            echo "Posting in Channel finished."
            echo " "
            echo "----------------------------------------------"
            echo "Press any key for end the script."
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;
        "PL2")
            clear
            echo "----------------------------------------------"           
            echo "Please be patient..."
            # PL2
            echo "----------------------------------------------"
            echo "Posting in channel..."
            echo " "
            P1
	    echo " "	    
            echo "----------------------------------------------"
            echo "Posting in Channel finished."
            echo " "
            echo "----------------------------------------------"
            echo "Press any key for end the script."
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;	
        "ALL")
            clear
            echo "----------------------------------------------"           
            echo "Please be patient..."
            # ALL
            echo "----------------------------------------------"
            echo "Posting in channel..."
            echo " "
            D1
            B1
            C1
            P1
	    echo " "	    
            echo "----------------------------------------------"
            echo "Posting in Channel finished."
            echo " "
            echo "----------------------------------------------"
            echo "Press any key for end the script."
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;		    
        "Exit")
            break
            ;;
        *) echo Invalid option.;;
    esac
done   
