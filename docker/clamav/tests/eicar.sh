#!/bin/sh
cd /tmp/
wget http://www.eicar.org/download/eicar.com.txt
wget http://www.eicar.org/download/eicarcom2.zip
clamscan eicar.com.txt
clamscan eicarcom2.zip

