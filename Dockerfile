FROM ubuntu:17.10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    libreadline6 \
    libreadline6-dev

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
    vim \
    neovim \
    python-neovim \
    python3-neovim \
    git \
    fonts-powerline \
    ruby-full \
    redis-tools \
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

RUN pip2 install --upgrade \
    powerline-status \
    powerline-gitstatus \
    powerline-shell \
    prompt-toolkit

# This works also: pip --no-cache-dir install numpy scipy matplotlib ipython jupyter pandas sympy nose
COPY requirements.txt ./requirements.txt
RUN pip3 install --upgrade -r requirements.txt

# Install Haskell Tool Stack
RUN curl -sSL https://get.haskellstack.org/ | sh 

# Set up my user
RUN useradd -r codehappens --create-home --shell /bin/bash 

WORKDIR /home/codehappens
ENV HOME /home/codehappens

VOLUME ["/home/codehappens/development"]

RUN echo 'codehappens:newpassword' | chpasswd && adduser codehappens sudo 

USER codehappens

COPY .bashrc $HOME/.bashrc

run mkdir -p $HOME/.local/share/nvim/plugged/
run mkdir -p $HOME/.config/nvim/
COPY init.vim $HOME/.config/nvim/init.vim
RUN curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa
RUN curl -fLo $HOME/.config/fontconfig/conf.d --create-dirs https://raw.githubusercontent.com/powerline/fonts/master/fontconfig/50-enable-terminess-powerline.conf 
COPY .powerline-shell.json $HOME/.powerline-shell.json

EXPOSE 8080

# RESOURCES
# https://docs.google.com/document/d/1UlgJYoMNQvkE_TWeEbu4CYZrKd_NQWbDWroVqm_nwkg/edit?usp=sharing
