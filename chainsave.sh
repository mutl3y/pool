#!/usr/bin/env bash
clear
row=4
col=1
countdown() {
        msg="Waiting ${1}..."
#        clear
        tput cup $row $col
        echo -n "$msg"
        l=${#msg}
        l=$(( l+$col ))
        for i in {30..1}
        do
                tput cup $row $l
                echo -n "$i"
                sleep 1
        done
}

while true
do
  clear
  docker ps |grep electroneumd | awk '{print $1}' | xargs -I [ docker exec  [ /opt/electroneum-pool/electroneumd save
  date
  countdown "to next blockchain save"
done
