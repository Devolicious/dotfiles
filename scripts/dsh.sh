#!/bin/bash
# easily "docker exec" into a running Docker container
# latest version: https://gist.github.com/ljm42/2b3bfd8ff886015bbce8

# for unRAID, place this script on your flash drive as /boot/custom/docker-shell
# then add this to your go script (without the leading pound sign):
# cp /boot/custom/docker-shell /usr/local/bin

CONTAINERS=`docker ps | awk 'NR==1 {offset=index($0,"NAMES")};NR>1{print substr($0,offset)}' | sort -f | tr "\n" " "`

echo
echo "Choose a Docker container:"
i=1
for container in $CONTAINERS
do
 echo "$((i++)) : $container"
done

read MYCHOICE
CHOSEN=`echo $CONTAINERS | cut -d' ' -f$MYCHOICE 2>/dev/null`

if [ "$CHOSEN" = "" ]; then
  echo Invalid option
  exit
fi

# Copy the local ssh config
docker exec --user root $CHOSEN mkdir -p /etc/ssh
docker cp ~/.ssh/config $CHOSEN:/etc/ssh/ssh_config
docker exec --user root $CHOSEN sed -i "/^Include/d" /etc/ssh/ssh_config

# try running bash, if exit code 126 then try running sh
for SHELL in bash sh
do
  clear
  echo " "
  echo -e " Logged into $CHOSEN with $SHELL"
  echo  " "
  tput sgr0
  docker exec -it $CHOSEN $SHELL
  if [ $? -ne 126 ]; then
    break
  fi
done