FROM ubuntu:16.04
MAINTAINER Masood Alam <masood.alam@vectracom.com>



#RUN apt-get update && \
#apt-get install -y --no-install-recommends locales && \
#locale-gen en_US.UTF-8 && \
#apt-get dist-upgrade -y && \
#apt-get --purge remove openjdk* && \
#echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 #select true" | debconf-set-selections && \
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
#apt-get update && \
#apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
#apt-get clean all


# Add some aliases
#RUN echo "alias ll='ls -al --color'" > /etc/profile.d/aliases.sh

#RUN apt-get -qq install -y lksctp-tools netcat && apt-get -qq autoclean

RUN apt-get update && \
apt-get install -y --no-install-recommends software-properties-common locales && \
locale-gen en_US.UTF-8 && \
apt-get update && \
apt-get dist-upgrade -y && \
apt-get --purge remove openjdk*

RUN add-apt-repository ppa:openjdk-r/ppa && \
apt-get update

RUN apt-get install -y openjdk-7-jdk

RUN apt-get install -y unzip

ADD jboss-5.1.0.GA-smsc.zip /opt
RUN unzip /opt/jboss-5.1.0.GA-smsc.zip -d /opt && rm /opt/jboss-5.1.0.GA-smsc.zip
ADD data/*.xml /opt/jboss-5.1.0.GA/server/default/data/
#ADD sctp-api-1.7.0-SNAPSHOT.jar /opt/jboss-5.1.0.GA/server/default/deploy/restcomm-smsc-server/lib
#ADD sctp-impl-1.7.0-SNAPSHOT.jar /opt/jboss-5.1.0.GA/server/default/deploy/restcomm-smsc-server/lib
CMD ["/opt/jboss-5.1.0.GA/bin/run.sh", "-b", "0.0.0.0"]
