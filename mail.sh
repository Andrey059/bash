#!/bin/bash
if
find / -name dzotus.sh -exec {} \; > otc.txt &&
mailx root@localhost < otc.txt &&
rm otc.txt access.log

then
exit 0
else 
echo "file not found"
fi

