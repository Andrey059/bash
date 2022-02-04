#!/bin/bash
echo "Временной диапазон":
cat access.log | awk '{print $4}' | head -n 1 &&  date | awk '{print $2,$3,$4,$6}' &&


echo "20 клиентских URL запрашиваемых с этого сервера"
cat access.log | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 20 > 1.1.txt && cat 1.1.txt 


echo "20 клиентских IP"
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 20 > 2.2.txt && tail -n 20 2.2.txt 

echo "Все коды состояния HTTP и их количество"
cat access.log | awk '{print $9}'| grep -v "-" | sort | uniq -c | sort -rn > 3.3.txt && cat 3.3.txt 
echo "Все коды состояний"
cat access.log | awk '{print $9}' | grep ^4 > 4.4.txt && cat access.log | awk '{print $9}'  | grep ^5 >> 4.4.txt && cat 4.4.txt | uniq -d -c | sort -rn > 4.5.txt && cat 4.5.txt 
echo "all"
rm -f 1.1.txt 2.2.txt 3.3.txt 4.4.txt 4.5.txt
