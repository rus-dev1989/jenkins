#!/bin/bash
docker build -t  jenkins-solovei .
#docker rm -f jenkins-solovei
docker run -d --name jenkins-solovei -p 8080:8080 -v $(pwd)/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins-solovei

