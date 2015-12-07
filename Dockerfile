FROM ubuntu:15.04
MAINTAINER Daniel Dent (https://www.danieldent.com/)

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ADD http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc /tmp/erlang_solutions.asc
ADD https://deb.nodesource.com/gpgkey/nodesource.gpg.key /tmp/nodesource.gpg.key
WORKDIR /tmp
RUN apt-get update -q && \
    apt-get install -y locales apt-transport-https && \
    locale-gen "en_US.UTF-8" && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    apt-key add erlang_solutions.asc && \
    apt-key add nodesource.gpg.key && \
    echo "86232086a4dec44a5a505544d30822987a23a892db418f9e8e17dfff21eb0c23 erlang_solutions.asc" | sha256sum -c && \
    echo "773b328f7b1d6db58a8c6a7fc89e2ed58ac5e06c3ab148411cf8272be7b1c472 nodesource.gpg.key" | sha256sum -c && \
    echo "deb http://apt.dockerproject.org/repo ubuntu-vivid main" > /etc/apt/sources.list.d/docker.list && \
    echo 'deb http://deb.nodesource.com/node_0.12 vivid main' > /etc/apt/sources.list.d/nodesource.list && \
    echo "deb http://packages.erlang-solutions.com/ubuntu vivid contrib" > /etc/apt/sources.list.d/erlang-solutions.list && \
    apt-get update -q && \
    apt-get dist-upgrade -y && \
    apt-get install -y build-essential wget curl git erlang-base=1:18.1 erlang-dev=1:18.1 erlang-eunit=1:18.1 erlang-xmerl=1:18.1 elixir=1.1.1-2 nodejs=0.12.9-1nodesource1~vivid1 docker-engine=1.9.1-0~vivid python-pip inotify-tools postgresql-client jed nano mtr-tiny lsof rsync rdate dnsutils dstat ifstat bwm-ng mosh telnet sysstat && \
    pip install docker-compose && \
    mix local.hex --force && \
    mix local.rebar --force
    apt-get clean -y
