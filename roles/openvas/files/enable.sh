#!/bin/bash

/usr/sbin/iptables -F

/usr/sbin/iptables -P FORWARD DROP
/usr/sbin/iptables -P INPUT DROP
/usr/sbin/iptables -P OUTPUT ACCEPT

/usr/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
/usr/sbin/iptables -A INPUT -s 192.168.0.0/16 -m multiport -p tcp --dports 22,443 -m state --state NEW -j ACCEPT
/usr/sbin/iptables -A INPUT -s 172.16.0.0/12 -m multiport -p tcp --dports 22,443 -m state --state NEW -j ACCEPT
/usr/sbin/iptables -A INPUT -s 10.0.0.0/8 -m multiport -p tcp --dports 22,443 -m state --state NEW -j ACCEPT
/usr/sbin/iptables -A INPUT -p icmp -j ACCEPT