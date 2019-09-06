FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

LABEL maintainer="Heath Robertson <CodeHappens@ToiletHill.io>"
LABEL description="A Docker Image for a Development environment."

RUN apt-get update && apt-get install -y \
    software-properties-common \
    libreadline7-dbg

RUN add-apt-repository ppa:neovim-ppa/stable

RUN apt-get update && apt-get install -y \
    sudo \
    readline-common \
    python-pip \
    python-dev \
    build-essential \
    python3.6 \
    python3.6-dev \
    python3-pip \
    python3.6-venv \
    libgtk2.0-dev \
    libsm6 \
    libxext6 \
    vim \
    neovim \
    python-neovim \
    python3-neovim \
    git \
    fonts-powerline \
    ruby-full \
    graphviz \
    haskell-platform \
    curl 

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    apt-get -y dist-upgrade

# update pip
RUN python2.7 -m pip install pip --upgrade && \
    python2.7 -m pip install wheel && \
    python3.6 -m pip install pip --upgrade && \
    python3.6 -m pip install wheel

RUN pip2 install --upgrade --no-cache-dir \
    powerline-status \
    powerline-gitstatus \
    powerline-shell \
    prompt-toolkit

RUN pip install --upgrade --no-cache-dir numpy

# This works also: pip --no-cache-dir install numpy scipy matplotlib ipython jupyter pandas sympy nose
COPY requirements.txt ./requirements.txt
RUN pip3 install --upgrade --no-cache-dir -r requirements.txt

ARG USER=genericuser
ARG USER_ID=1000
ARG USER_GID=1000

RUN groupadd -f --gid $USER_GID $USER
RUN useradd --uid $USER_ID --gid $USER_GID --create-home --shell /bin/bash $USER

USER $USER:$USER_GID
ENV HOME /home/$USER

WORKDIR $HOME

COPY bashrc $HOME/.bashrc
RUN mkdir -p $HOME/.local/share/nvim/plugged/ && mkdir -p $HOME/.config/nvim/
COPY init.vim $HOME/.config/nvim/init.vim
RUN curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa
RUN curl -fLo $HOME/.config/fontconfig/conf.d --create-dirs https://raw.githubusercontent.com/powerline/fonts/master/fontconfig/50-enable-terminess-powerline.conf 
COPY powerline-shell.json $HOME/.powerline-shell.json

VOLUME ["$HOME/codehappens"]
WORKDIR $HOME/codehappens
EXPOSE 8080

# RESOURCES
# https://docs.google.com/document/d/1UlgJYoMNQvkE_TWeEbu4CYZrKd_NQWbDWroVqm_nwkg/edit?usp=sharing
