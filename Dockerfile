FROM jenkins/jenkins:lts

USER root

RUN curl -sSL https://get.docker.com/ | sh && \

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list 

RUN apt-get update && apt install -y mc vim curl zip build-essential libssl-dev libffi-dev python python-dev python-pip && pip install --upgrade cffi && pip install ansible netaddr

RUN curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN cd /opt && git clone https://github.com/kubernetes-incubator/kubespray.git

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
