FROM studioetrange/docker-debian:wheezy
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
						libboost \
						openjdk-7-jre \
						openjdk-7-jre-headless \
						libmysqlclient-dev \
						git \
						libboost-dev \
						mysql-server-core-5.5 \
						mysql-server-5.5 \
						libdb5.3 \
	&& rm -rf /var/lib/apt/lists/*



RUN wget http://www.lua.org/ftp/lua-5.3.3.tar.gz
	&& tar xzf lua-5.3.3.tar.gz
	&& cd lua-5.3.3
	&& make linux install