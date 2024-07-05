FROM nvidia/cuda:12.0.1-cudnn8-runtime-ubuntu18.04
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="cuda" veriosn="12.0.1-cudnn8-runtime-ubuntu18.04" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y tzdata wget \
    && rm -rf /var/lib/apt/lists/*

ENV ANACONDA_VERSION 4.12.0

RUN set -eux; \
    wget "https://repo.anaconda.com/miniconda/Miniconda3-py38_${ANACONDA_VERSION}-Linux-x86_64.sh" --no-check-certificate \
    && bash "Miniconda3-py38_${ANACONDA_VERSION}-Linux-x86_64.sh" -b -p /opt/conda \
    && rm "Miniconda3-py38_${ANACONDA_VERSION}-Linux-x86_64.sh"

ENV CONDA_HOME /opt/conda
ENV PATH $CONDA_HOME/bin:$PATH
ENV LANG C.UTF-8

RUN set -eux; \
    wget "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.1-1_all.deb" \
    && dpkg -i cuda-keyring_1.1-1_all.deb \
    && rm /etc/apt/sources.list.d/cuda.list \
    && apt update \
    && apt install cuda-toolkit-12-0 -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
