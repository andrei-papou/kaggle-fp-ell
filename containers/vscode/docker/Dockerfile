FROM docker.io/nvidia/cuda:11.6.2-base-ubuntu20.04

ARG GITHUB_TOKEN
ENV GITHUB_TOKEN="$GITHUB_TOKEN"

ARG WANDB_TOKEN=""
ENV WANDB_TOKEN="$WANDB_TOKEN"

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

RUN mkdir /root/.requirements/kaggle-fp-ell
RUN python3.10 -m venv /root/.virtualenvs/kaggle-fp-ell
# Cache torch installation separately as it is a ~2GB download.
COPY requirements/torch.vendor.txt /root/.requirements/kaggle-fp-ell/torch.vendor.txt
RUN PATH="/root/.virtualenvs/kaggle-fp-ell/bin:$PATH" pip install -r /root/.requirements/kaggle-fp-ell/torch.vendor.txt
COPY requirements/vendor.txt /root/.requirements/kaggle-fp-ell/vendor.txt
RUN PATH="/root/.virtualenvs/kaggle-fp-ell/bin:$PATH" pip install -r /root/.requirements/kaggle-fp-ell/vendor.txt
ARG CACHEBUST=1
# Always reinstall github dependencies as there is no way to track version change.
COPY requirements/github.txt /root/.requirements/kaggle-fp-ell/github.txt
RUN PATH="/root/.virtualenvs/kaggle-fp-ell/bin:$PATH" pip install -U -r /root/.requirements/kaggle-fp-ell/github.txt

# Install starship shell
RUN curl -sS https://starship.rs/install.sh > install_starship.sh && \
    chmod +x install_starship.sh && \
    ./install_starship.sh --yes \
    && echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

RUN git config --global user.name "andrei-papou" && \
	git config --global user.email "andrei.v.papou@gmail.com"
