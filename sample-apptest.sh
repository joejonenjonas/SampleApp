pwd
if curl http://172.17.0.1:8989 | grep gateway
#if curl http://ip6-localhost:8989 | grep gateway
then 
  exit 0
else 
  exit 1
fi
