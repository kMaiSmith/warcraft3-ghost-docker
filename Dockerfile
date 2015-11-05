FROM ubuntu
MAINTAINER Kyle Smith <kmaismith@gmail.com>

RUN apt-get update
RUN apt-get install --yes --force-yes \
                    bzip2 tar build-essential g++ libmysql++-dev wget unzip libbz2-dev \
                    libgmp3-dev git libboost-all-dev
WORKDIR /root

RUN wget https://github.com/OHSystem/OHSystem/archive/master.zip -O master.zip && \
    unzip master.zip

COPY bin/buildGHost.sh /root/buildGHost.sh
RUN /root/buildGHost.sh

WORKDIR /root/OHSystem-master/ghost
RUN mkdir /opt/ghost++; \
    cp -R src/ghost++ config/* /opt/ghost++/
COPY config/* /opt/ghosts++/

EXPOSE 6112 6113 6114
CMD /opt/ghost++/ghost++
