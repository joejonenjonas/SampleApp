pwd
cd /var/jenkins_home/workspace/BuildAppJob
pwd
if curl http://localhost:8989 | grep gateway
then 
  exit 0
else 
  exit 1
fi
