FROM debian:8.6
MAINTAINER StudioEtrange <nomorgan@gmail.com>


# DEBIAN packages : SICKRAGE dependencies install ----------
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						gccxml \
						autoconf \
						libdb5.3-dev \
						gdb \
						libtool \
						libreadline-dev  \
						libdb-dev \
						libssl-dev \
						libboost-dev \
						openjdk-7-jre \
						openjdk-7-jre-headless \
						libmysqlclient-dev \
						git \
						wget \
						unzip \
						libboost-dev \
						mysql-server-core-5.5 \
						mysql-server-5.5 \
						libdb5.3 \
						build-essential gcc-multilib g++-multilib autotools-dev automake \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget http://www.lua.org/ftp/lua-5.3.3.tar.gz \
	&& tar xzf lua-5.3.3.tar.gz \
	&& cd lua-5.3.3 \
	&& make linux install 


RUN wget https://codeload.github.com/TheAnswer/PublicEngine/zip/master -O "/opt/PublicEngine.zip" --no-check-certificate \
	&& unzip -a -o /opt/PublicEngine.zip \
	&& mv PublicEngine-master PublicEngine

RUN wget https://codeload.github.com/TheAnswer/Core3/zip/unstable -O "/opt/Core3.zip" --no-check-certificate \
	&& unzip -a -o /opt/Core3.zip \
	&& mv Core3-unstable Core3

RUN cd /opt/PublicEngine/MMOEngine \
	&& make \
	&& chmod +x bin/idlc \
	&& cp bin/idlc /usr/local/bin/idlc

ENV CLASSPATH /opt/PublicEngine/MMOEngine/bin/idlc.jar

#WORKDIR /opt
RUN cd /opt/Core3 \
	&& ln -s ../PublicEngine/MMOEngine MMOEngine

#WORKDIR /opt
RUN cd /opt/Core3/MMOCoreORB \
	&& make config \
	&& make build
