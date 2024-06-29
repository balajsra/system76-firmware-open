FROM ubuntu:20.04

# Install most dependencies
USER root
ARG TZ="America/New_York"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    adduser \
    sudo \
    tzdata \
    build-essential \
    ccache \
    cmake \
    curl \
    dosfstools \
    flashrom \
    git-lfs \
    libncurses-dev \
    libssl-dev \
    libudev-dev \
    mtools \
    parted \
    pkgconf \
    python-is-python3 \
    python3-distutils \
    uuid-dev \
    zlib1g-dev \
    bison \
    bzip2 \
    ca-certificates \
    flex \
    g++ \
    gcc \
    gnat \
    libnss3-dev \
    patch \
    tar \
    xz-utils \
    avr-libc \
    avrdude \
    clang-format \
    gcc-avr \
    libc-dev \
    libhidapi-dev \
    libudev-dev \
    sdcc \
    shellcheck \
    xxd

# Create non-root user with disabled password and sudo privileges
ARG USER=docker
RUN adduser --disabled-password --gecos '' ${USER}
RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enter build directory in user's home
USER ${USER}
ARG BUILD_DIR=/home/${USER}/firmware-open
WORKDIR ${BUILD_DIR}

# Set git configuration (required by some scripts)
ARG GIT_NAME="Docker User"
ARG GIT_EMAIL="docker@gmail.com"
RUN git config --global user.name "${GIT_NAME}"
RUN git config --global user.email "${GIT_EMAIL}"
