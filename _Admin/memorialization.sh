#!/bin/bash
## Memorialization Tool Version 0.1
## Author: SJ-Hydra

# Colors
GREY='\033[0;34m'
RED='\033[0;31m' 
NC='\033[0m' #No Color

# Introduction
sed -n '2p' ./memorialization.sh
sed -n '3p' ./memorialization.sh

echo -e "${GREY}This tool is used to compile information needed for engagement memorialization.${NC}"
echo -e "${GREY}If your client asks you for scans, then you'll have them.\n${NC}"
echo -e "${GREY}Use: ./memorialization.sh <IPs>${NC}\n"

## Option Parser

# Sudo Checker, sudo permission needed for following scans to complete. 
if ! [ $(id -u) = 0 ]; then
   echo -e "${RED}              . . . ."
   echo -e "${RED}              The script needs to be run as root. Rerun this script, with sudo. " >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi


# Commands to Run and Memorialize - Ports
echo "Common TCP Port Scan Running. . ."
nmap -Pn $1 > $1'_commonTCP_nmap.txt'

echo "Full TCP Port Scan Running. . . This may take a while, grab a coffee."
nmap -Pn -p- -sV -O $1 > $1'_fullTCP_nmap.txt'

#echo "Common UDP Port Scan Running. . . Hopefully this doesnt take as long as the last scan."
#sudo nmap -Pn -sU $1> $1'_commonUDP_nmap.txt'


# Commands to Run and Memorialize - Web Services
if cat $1_commonTCP_nmap.txt |
	grep -qFe "80/tcp   open"
then
   echo "Running Nikto Scan on http (Port 80) service. . ."
   nikto -h http://$1/ > $1_http_nikto.txt
elif cat $1_commonTCP_nmap.txt | 
	grep -qFe "443/tcp   open"
   echo "Running Nikto Scan on https (Port 443) service. . ."
   nikto -h http://$1/ > $1_http_nikto.txt
else
   echo "Web services not detected within the environment. Nikto is not running."
fi 




# Commands to zip directory


echo "Port scans and web service scans are now zipped into the directory. You should retain Burp logs and your Bash command logs upon the completion of the engagement."
