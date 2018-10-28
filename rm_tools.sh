function rm_hacktool {
  docker rm -f "dsp_hacktool_$1"
}
rm_hacktool netcat
rm_hacktool scapy
rm_hacktool wireshark
rm_hacktool masscan
rm_hacktool nmap
rm_hacktool python
rm_hacktool sqlmap
rm_hacktool nikto
rm_hacktool arachni
rm_hacktool firefox

