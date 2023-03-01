FROM ubuntu:20.04
LABEL maintainer="t"

# Install required packages
RUN apt-get update && \
    apt-get install -y sl && \
    apt-get install -y cowsay && \
    apt-get install -y fortune && \
    apt-get install -y oneko && \
    apt-get install -y lolcat && \
    apt-get install -y figlet && \
    apt-get install -y toilet && \
    apt-get install -y bb && \
    apt-get install -y boxes

# インストールに時間がかかりすぎるためコメントアウト
# RUN apt-get install -y cmatrix


# Set working directory
WORKDIR /usr/src/app

# Copy some text files for fun
COPY command.txt /usr/src/app/

# Set some environment variables
ENV TERM=xterm-256color \
    PATH="/usr/games:${PATH}"
