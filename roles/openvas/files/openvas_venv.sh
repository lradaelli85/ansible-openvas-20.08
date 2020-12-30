#!/bin/bash
source /opt/gvm/bin/ospd-scanner/bin/activate
#mkdir /opt/gvm/var/run/ospd/
cd /opt/gvm/src/ospd 
pip3 install .
cd /opt/gvm/src/ospd-openvas
pip3 install . 

