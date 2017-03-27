#!/bin/bash

# expects HOST and PORT variables from environment variables

set -- "${1:-$(</dev/stdin)}" "${@:2}"

nc -z ${HOST} ${PORT}

isPortExist=$(echo $?)

if [ ${isPortExist} -ne 0 ];
then
        RED='\033[0;31m'
        NC='\033[0m'

        printf "${RED}current port ${PORT} does not exist${NC}\n"
        exit
fi

headerAccept='Accept: application/json'
headerContentType='Content-type: application/json'

words=(${1})
echo "Number of words: " ${#words[@]}

function buildImage {
    word=$1

        `curl -X PUT -H "${headerAccept}" -H "${headerContentType}" -s -d '{"text":"'${word}'", "ignoreCache":false}' 'http:
}

START=$(date +%s);
echo "benchmark started at:" `date`

for word in "${words[@]}"
    do :

    buildImage ${word} &
done
wait

END=$(date +%s);
duration=$(echo $((END-START)) | awk '{printf "%d:%02d:%02d", $1/3600, ($1/60)%60, $1%60}')

echo "benchmark stopped at:" `date`

GREEN='\033[0;32m'
NC='\033[0m'
printf "benchmark duration:  ${GREEN}${duration}${NC}\n"
