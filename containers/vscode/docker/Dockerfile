FROM docker.io/nvidia/cuda:11.6.2-base-ubuntu20.04

ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=$GITHUB_TOKEN

ENV TZ=Europe/Vilnius
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository -y ppa:deadsnakes/ppa
RUN apt update && apt install -y \
	curl \
	git \
	gcc \
	python3.10 \
	python3.10-dev \
	python3.10-venv

RUN mkdir /root/.virtualenvs && mkdir /root/.requirements

COPY requirements /root/.requirements/kaggle-fp-ell
RUN python3.10 -m venv /root/.virtualenvs/kaggle-fp-ell
RUN PATH="/root/.virtualenvs/kaggle-fp-ell/bin:$PATH" pip install -r /root/.requirements/kaggle-fp-ell/vendor.txt
ARG CACHEBUST=1
RUN PATH="/root/.virtualenvs/kaggle-fp-ell/bin:$PATH" pip install -U -r /root/.requirements/kaggle-fp-ell/private.txt

# Install starship shell
RUN curl -sS https://starship.rs/install.sh > install_starship.sh && \
    chmod +x install_starship.sh && \
    ./install_starship.sh --yes \
    && echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

RUN git config --global user.name "andrei-papou" && \
	git config --global user.email "andrei.v.papou@gmail.com"
