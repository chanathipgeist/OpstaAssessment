while IFS= read -r line; do
    ip=$(echo "$line" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
    timestamp=$(echo "$line" | grep -oE "\[.*\]" | tr -d '[]')
    method=$(echo "$line" | grep -oP '\"[A-Z]+')
    path=$(echo "$line" | grep -oP '\" [^ ]+' | tr -d '\"')
    http_version=$(echo "$line" | grep -oP '\"[^ ]+\" [0-9]+' | awk '{print $1}' | tr -d '\"')
    return_code=$(echo "$line" | grep -oP '\" [0-9]+' | awk '{print $2}')
    body_byte=$(echo "$line" | grep -oP '[0-9]+ \"' | tr -d ' "')
    http_referer=$(echo "$line" | grep -oP '\"[^"]+\" \"[^"]+' | awk '{print $2}' | tr -d '\"')
    http_user_agent=$(echo "$line" | grep -oP '\"[^"]+\" \"[^"]+' | awk '{print $3}' | tr -d '\"')

    json_data="{\"timestamp\":\"$timestamp\",\"ip\":\"$ip\",\"method\":\"$method\",\"path\":\"$path\",\"http_version\":\"$http_version\",\"return_code\":$return_code,\"body_byte\":$body_byte,\"http_referer\":\"$http_referer\",\"http_user_agent\":\"$http_user_agent\"}"
    echo "$json_data" >> output.json
done < exam.log
