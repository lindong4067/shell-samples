#!/bin/sh

info100=`cat consul.txt | awk '$9>=100.000{print $9, $10, $19}'`
echo "$info100" >> /root/esa/info100.txt
echo "Count times of CPU is above 100% :" >> /root/esa/info.txt
echo "$info100" | wc -l >> /root/esa/info.txt

info200=`cat consul.txt | awk '$9>=200.000{print $9, $10, $19}'`
echo "$info200" >> /root/esa/info200.txt
echo "Count times of CPU is above 200% :" >> /root/esa/info.txt
echo "$info200" | wc -l >> /root/esa/info.txt


info300=`cat consul.txt | awk '$9>=300.000{print $9, $10, $19}'`
echo "$info300" >> /root/esa/info300.txt
echo "Count times of CPU is above 300% :" >> /root/esa/info.txt
echo "$info300" | wc -l >> /root/esa/info.txt


info400=`cat consul.txt | awk '$9>=400.000{print $9, $10, $19}'`
echo "$info400" >> /root/esa/info400.txt
echo "Count times of CPU is above 400% :" >> /root/esa/info.txt
echo "$info400" | wc -l >> /root/esa/info.txt


info500=`cat consul.txt | awk '$9>=500.000{print $9, $10, $19}'`
echo "$info500" >> /root/esa/info500.txt
echo "Count times of CPU is above 500% :" >> /root/esa/info.txt
echo "$info500" | wc -l >> /root/esa/info.txt

