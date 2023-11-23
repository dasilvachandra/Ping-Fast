#!/bin/bash
s=$1;
A="$(cut -d'.' -f1 <<<"$s")"
B="$(cut -d'.' -f2 <<<"$s")"
C="$(cut -d'.' -f3 <<<"$s")"
D="$(cut -d'.' -f4 <<<"$s")"
t=$2
to=${t:=1}

while [ $D -le $to ]; 
do 
	ip="$A.$B.$C.$D";
	ping -c 1 $ip -w 1 &>/dev/null; 
	if [ $? -eq 0 ]; then 
		status="active";
		echo "Ping $ip $status";
	else 
		status="Unreachable"; 
	fi
	
	D=$(( $D + 1 )); 
done

#by Chandra Da Silva