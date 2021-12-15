#!/bin/bash
pwd
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

# Copy the website directories and sample_app.py to the temporary directory.
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

#Tijdelijk een dockerfile aanmaken en in deze container python installeren en onze app draaien.
echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
#toevoegen nodige website onderdelen.
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
#open poort 8989 
echo "EXPOSE 8989" >> tempdir/Dockerfile
#cmd command om python script uit te voeren
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 8989:8989 --name samplerunning sampleapp
docker ps -a 
