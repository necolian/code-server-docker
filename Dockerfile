FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

# Install vim
RUN apt-get update && apt-get install -y vim


WORKDIR /workspace
ADD requirements.txt /workspace

# install git
RUN apt-get update &&  apt-get install -y git

# install python modules
RUN pip install -r requirements.txt

# install hydra
RUN pip install hydra-core --upgrade

# 日本語化
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
  --install-extension ms-python.python \
  --install-extension ms-ceintl.vscode-language-pack-ja
