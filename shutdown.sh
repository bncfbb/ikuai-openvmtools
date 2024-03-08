#!/bin/bash
ikuai_ip=$(ip route show default | awk '{print $3}')
cookie_name='/tmp/ikuai_cookie.txt'
trap 'rm -f /tmp/ikuai_cookie.txt' 0
useragent="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.60"
contenttype="Content-Type: application/json;charset=UTF-8"
ikuai_passwd=`echo -n "${PASSWORD}" | md5sum |awk -F " " '{print $1}'`
ikuai_pass=`echo 'salt_11'${PASSWORD} | base64`
resp=`curl -k -s \
-H '$useragent' \
-H '$contenttype' \
-d '{"username":"'"$USERNAME"'","passwd":"'"$ikuai_passwd"'","pass":"'"$ikuai_pass"'","remember_password":null}' \
-c "$cookie_name" \
http://$ikuai_ip:$PORT/Action/login`

loginfo(){
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1"
}

msg=$(echo $resp | jq -r '.ErrMsg')
if [[ $msg == 'Success' ]]; then
    loginfo "ikuai ${ikuai_ip} login success."
else
    loginfo "ikuai ${ikuai_ip} login failed. ErrMsg->${msg}"
fi

resp1=`curl -k -s \
-H '$useragent' \
-H '$contenttype' \
-d '{"func_name":"reboots","action":"shutdown"}' \
-b "$cookie_name" \
http://$ikuai_ip:$PORT/Action/call`
msg1=$(echo $resp1 | jq -r '.ErrMsg')
if [[ $msg1 == 'Success' ]]; then
    loginfo "ikuai ${ikuai_ip} shutdown success."
else
    loginfo "ikuai ${ikuai_ip} shutdown failed. ErrMsg->${msg1}"
fi
