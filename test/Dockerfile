# Pull base image.
FROM jlesage/baseimage-gui:debian-9

# Add backports for latest Intel packages
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list

# Install packages.
RUN apt-get update
RUN apt-get install -y \
			wget \
			gcc \
			flex \
			bison \
			pkg-config \
			libpciaccess-dev \
			libkmod-dev \
			libprocps-dev \
			libunwind-dev \
			libdw-dev \
			zlib1g-dev \
			liblzma-dev \
			libcairo-dev \
			libpixman-1-dev \
			libudev-dev \
			libgsl-dev \
			libasound2-dev \
			libxmlrpc-core-c3-dev \
			libjson-c-dev \
			libcurl4-openssl-dev \
			libxrandr-dev \
			libxv-dev \
			x11proto-dri2-dev \
			python-docutils \
			valgrind \
			xfce4-terminal \
			peg

RUN apt-get install -t stretch-backports -y \
					libdrm-dev \
					libdrm-intel1

# autotools build deps
RUN apt-get install -y \
			autoconf \
			automake \
			xutils-dev \
			libtool \
			make

WORKDIR /tmp
 
# Download Intel Tools from gitlab
RUN wget https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/master/igt-gpu-tools-master.tar
RUN tar -xvf igt-gpu-tools-master.tar
RUN cd igt-gpu-tools-master && chmod +x autogen.sh && ./autogen.sh
RUN cd igt-gpu-tools-master && make install

# Generate and install favicons.
RUN APP_ICON_URL=https://ee3.pigugroup.eu/uploaded/intelhd.png && \
    install_app_icon.sh https://ee3.pigugroup.eu/uploaded/intelhd.png

# Cleanup
RUN apt-get autoremove -y && \
	apt-get remove -y make autoconf automake gcc pkg-config && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy xfce4-terminal default preferences file.
COPY terminalrc /config/xdg/config/xfce4/terminal/terminalrc

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="intel-gpu-tools"
