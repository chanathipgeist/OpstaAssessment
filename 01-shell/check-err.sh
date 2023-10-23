#!/bin/bash

# กำหนดที่อยู่ของไฟล์ log
logs_folder="./logs"

for logfile in "$logs_folder"/*.log; do
    if grep -q "Error" "$logfile"; then
        echo "Error found in file: $logfile"
        echo "Error details:"
        grep "Error" "$logfile"
        echo "-----------------------"
    fi
done

echo "ตรวจสอบไฟล์สำเร็จ."
