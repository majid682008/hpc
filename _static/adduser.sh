#!/bin/bash

first_group=$1
second_group=$2
first_name=$3
last_name=$4
username=$5
password=`</dev/urandom tr -dc 'A-Za-z0-9!%()+,-./:;<=>?@[\]_{}~' | head -c 10`

first_groups="dr-bayegan dr-saberi dr-smvaez dr-zadeh dr-koohian dr-sabooni dr-abdi dr-deldar dr-miri dr-modarres dr-shafiei grant dr-sarreshtedari dr-sarkar dr-sepehri dr-fshojaie dr-moshfegh dr-nouri"
if [[ ! $first_groups =~ $first_group ]]
then
    echo ""
    echo "Error : First_group '$first_group' does not exist!"
    echo ""
    exit 0
fi

second_groups="bcs-students msc-students phd-students postdoc"
if [[ ! $second_groups =~ $second_group ]]
then
    echo ""
    echo "Error : Second_group '$second_group' does not exist!"
    echo ""
    exit 0
fi

echo ""
echo "Please confirm your entrys:"
echo ""
echo "First_name   = $first_name"
echo "Last_name    = $last_name"
echo "First_group  = $first_group"
echo "Second_group = $second_group"
echo "Username     = $username"
echo "Password     = $password"
echo ""
read -p "Do you confirm? [y/n]: " confirm

if [[ $confirm != 'y' ]]
then
    echo ""
    echo "Exit!"
    echo ""
    exit 0
fi

useradd -g $first_group -G $second_group -c "$first_name $last_name" $username

echo $addcommand
$addcommand
passwd $username
#$password
#$password
su $username
rocks sync users

echo ""
echo ""
echo "Please copy this line to put into ARMPY package!"
echo ""
echo "$first_name    $last_name        $username        1        50000    18    1       0     0"
echo ""

read -p "Press Enter to Continue ..." continue
vi /export/home/Addition/Softwares/ARMPY/src/userid

echo "Please copy this value to put into Quota package!"
echo ""
echo "10485760"
echo ""

read -p "Press Enter to Continue ..." continue
edquota -u $username

#clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "Please copy these line email to user."
echo ""
echo ""
echo "Registration for HPC"
echo ""
echo "==================================================================="
echo "Salam,"
echo "Your account has been created."
echo ""
echo "Username: $username"
echo "Password: $password"
echo "IP: 172.16.187.30"
echo ""
echo "** After the first login, please change your password. **"
echo ""
echo "For find more information, please visit our website:"
echo "http://physics.ut.ac.ir/news-and-events/important-events/119-hpc."
echo ""
echo "Best regards,"
echo "HPC Administration (ut.phys.hpc@gmail.com)"
echo "==================================================================="
echo ""

echo ""
echo "END!"
echo ""
