#!/bin/bash                                                                                                           
                                                                                                                      
# expects HOST and PORT variables from environment variables                                                          
set -- "${1:-$(</dev/stdin)}" "${@:2}"                                                                                
                                                                                                                      
headerAccept='Accept: application/json'                                                                               
headerContentType='Content-type: application/json'                                                                    

words=(${1})                                                                                                          
echo "Number of words: " ${#words[@]}
                                                                                                                      
function buildImage {                                                                                                 
    word=$1                                                                                                           
                                                                                                                      
        `curl -X PUT -H "${headerAccept}" -H "${headerContentType}" -s -d '{"text":"'${word}'", "ignoreCache":false}' 'http://'${HOST}':'${PORT}'/to-image' &>/dev/null`                          
}                                                                                                                     
                                                                                                                      
START=$(date +%s);                                                          
echo "benchmark started at:"                                                                                          
echo ${START} | awk '{printf "%02d:%02d", ($1/60)%60, $1%60}'                                                         
echo ""                                                                                                               
                                                                                                                      
for word in "${words[@]}"                                                                                             
    do :                                                                                                              
                                                                                                                      
    buildImage ${word} &                                                                                              
done                                                                                                                  
wait                                                                                                                  
                                                                                                                      
END=$(date +%s);                                                                                                      
echo "benchmark stopped at: "                                                                                         
echo ${END} | awk '{printf "%02d:%02d", ($1/60)%60, $1%60}'                                                           
echo ""                                                                                                               
echo "benchmark duration: "                                                                                           
echo $((END-START)) | awk '{printf "%d:%02d:%02d", $1/3600, ($1/60)%60, $1%60}'                                       
echo ""
