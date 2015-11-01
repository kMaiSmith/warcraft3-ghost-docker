FROM ubuntu
MAINTAINER Kyle Smith <kmaismith@gmail.com>

RUN apt-get update
RUN apt-get install --yes --force-yes \
                    gcc g++ dpkg-dev libc6-dev make libgmp3-dev libbz2-dev libmysql++-dev wget unzip \
                    libboost-dev libboost-system-dev libboost-date-time-dev libboost-thread-dev libboost-filesystem-dev
WORKDIR /root

RUN wget http://ghostplusplus.googlecode.com/files/ghostplusplus_17.1.zip -O ghost++.zip && \
    unzip ghost++.zip

COPY bin/buildGHost.sh /root/buildGHost.sh
RUN /root/buildGHost.sh

WORKDIR /root/ghost
RUN mkdir /opt/ghost++; \
    cp -R maps/ mapcfgs/ replays/ savegames/ ghost/ghost++ default.cfg gameloaded.txt gameover.txt ipblacklist.txt ip-to-country.csv /opt/ghost++/

EXPOSE 6112 6113 6114
CMD /opt/ghost++/ghost++
