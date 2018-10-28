FLAGS=""
function run_hacktool {
  docker ps | grep -q "dsp_hacktool_$1"
  if [ $? -eq 0 ];
  then
    echo "$1 already exists";
  else
    docker run -v ~/hacktool_share:/root/shared -it $FLAGS -d --cap-add=NET_ADMIN --name "dsp_hacktool_$1" $2
  fi
  FLAGS=""
}
run_hacktool netcat nsunina/alpine_netcat:v1.1
run_hacktool scapy nsunina/alpine_scapy:v1.0

#docker run -p 14500:14500 --restart unless-stopped --name wireshark --cap-add NET_ADMIN -e XPRA_PW=wireshark ffeldhaus/wireshark
#FLAGS="-p 14500:14500 --restart unless-stopped -e XPRA_PW=wireshark"
#run_hacktool wireshark ffeldhaus/wireshark
#echo "Browser link:  https://localhost:14500/?username=wireshark=password=wireshark"
#run_hacktool masscan dordoka/masscan
#run_hacktool nmap dockersecplayground/nmap
#run_hacktool python dockersecplayground/python
#run_hacktool sqlmap dockersecplayground/sqlmap
#run_hacktool nikto dockersecplayground/nikto
#FLAGS="-p 9292:9292 "
#run_hacktool arachni ahannigan/docker-arachni "bin/arachni_web -o 0.0.0.0"
FLAGS="-p 5800:5800 -v $(pwd)/profile:/config/profile --shm-size 2g"
run_hacktool firefox jlesage/firefox
