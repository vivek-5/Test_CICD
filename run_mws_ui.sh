#/bin/bash

curdir=`pwd`
mws_server="maintensrvr"


# create network bridge
docker network rm ecp_net
docker network create --driver=bridge --subnet="172.10.0.0/24" ecp_net

cd $curdir

echo "Run mws server"
docker rm $mws_server
docker run -d -p 80:80 -it --name $mws_server --network ecp_net --ip 172.10.0.2 -v ecplog:/var/log/ecplog $mws_server 
sleep 1

echo " ALL COMMANDS Finished"