
logs_folder="./logs"
backup_path="./backup-log"

mkdir -p "$backup_path"

find "$logs_folder" -type f -exec mv {} "$logs_folder" \;

find "$logs_folder" -type f -size +0c -exec mv {} "$backup_path" \;

echo "ย้ายไฟล์ log เสร็จสิ้นเรียบร้อย."

