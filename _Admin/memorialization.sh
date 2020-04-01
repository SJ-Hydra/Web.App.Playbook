#!/bin/bash
## Memorialization Version 1.0

echo "This tool is used to compile information needed for engagement memorialization. If your client asks you for scans, then you'll have them."
echo "Use: ./memorialization.sh <file containing list of IPs, one IP or range, per line."

sed -n '2p' ./script.sh
read $ip

nmap -Pn $ip > $ip_commontcp_nmap.txt;
echo "Common TCP Port Scan Running. . ."
sleep 2m;
nmap -Pn -p- $ip > $ip_fulltcp_nmap.txt;
echo "Full TCP Port Scan Running. . ."
sleep 2m;
nmap -Pn -sU $ip > $ip_commonUDP_nmap.txt
echo "Common UDP Port Scan Running. . ."

