# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04

# Copy the intel-gpu-tools package to container
COPY intel-gpu-tools_1.23-3_amd64.deb /tmp/intel-gpu-tools_1.23-3_amd64.deb

# Install packages.
RUN apt-get update && apt-get install -y xfce4-terminal locales /tmp/intel-gpu-tools_1.23-3_amd64.deb

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Generate and install favicons.
RUN APP_ICON_URL=https://ee3.pigugroup.eu/uploaded/intelhd.png && \
    install_app_icon.sh https://ee3.pigugroup.eu/uploaded/intelhd.png

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="intel-gpu-tools"
