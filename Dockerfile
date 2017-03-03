FROM ubuntu:12.04

ENV DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository universe
RUN apt-get update -y && apt-get install -y vim xterm pulseaudio curl libgconf2-4 libnss3-1d libxss1 wget xdg-utils libpango1.0-0 fonts-liberation

# Goto https://www.nomachine.com/download/download&id=10 and change for the latest NOMACHINE_PACKAGE_NAME and MD5 shown in that link to get the latest version.
ENV NOMACHINE_PACKAGE_NAME nomachine_5.2.11_1_amd64.deb
ENV NOMACHINE_MD5 d697e5a565507d522380c94d2f295d07

# Install xfce4 desktop
RUN apt-get update -y && \
    apt-get install -y xfce4

# Install nomachine, change password and username to whatever you want here
RUN curl -fSL "http://download.nomachine.com/download/5.2/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb \
&& groupadd -r nomachine -g 433 \
&& useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine \
&& mkdir /home/nomachine \
&& chown -R nomachine:nomachine /home/nomachine \
&& echo 'nomachine:nomachine' | chpasswd

ADD nxserver.sh /

ENTRYPOINT ["/nxserver.sh"]
