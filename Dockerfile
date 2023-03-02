FROM ubuntu:20.04
LABEL maintainer="t"

# Install required packages
# RUN apt-get update && \
#     apt-get install -y sl && \
#     apt-get install -y cowsay && \
#     apt-get install -y fortune && \
#     apt-get install -y oneko && \
#     apt-get install -y lolcat && \
#     apt-get install -y figlet && \
#     apt-get install -y toilet && \
#     apt-get install -y bb && \
#     apt-get install -y boxes && \

RUN apt-get update && echo 'cmatrix cmatrix/question select false\n\
cmatrix cmatrix/install-setuid select true\n\
cmatrix cmatrix/terminal-frames select false\n\
cmatrix cmatrix/disable-setuid select false\n\
cmatrix cmatrix/use-suid select true\n\
' | DEBIAN_FRONTEND=noninteractive apt-get install -y cmatrix && \
apt-get install -y sl cowsay fortune oneko lolcat figlet toilet bb boxes telnet

# Set working directory
WORKDIR /usr/src/app

# Copy some text files for fun
COPY command.txt /usr/src/app/
COPY snow.sh /usr/src/app/

# Set some environment variables
ENV TERM=xterm-256color \
    PATH="/usr/games:${PATH}"

# Set alias for convenience
RUN echo "alias c='cowsay'" >> /root/.bashrc && \
    echo "alias f='fortune'" >> /root/.bashrc && \
    echo "alias o='oneko -fg black -bg white -tora'" >> /root/.bashrc && \
    echo "alias l='lolcat'" >> /root/.bashrc && \
    echo "alias t='toilet -f mono12 -F metal'" >> /root/.bashrc && \
    echo "alias bx='boxes -d parchment'" >> /root/.bashrc && \
    echo "alias moo='fortune | cowsay | lolcat'" >> /root/.bashrc && \
    echo "alias starwars='telnet towel.blinkenlights.nl'" >> /root/.bashrc && \
    echo "alias snow='/bin/bash snow.sh'" >> /root/.bashrc