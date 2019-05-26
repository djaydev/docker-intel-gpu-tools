# Pull base image.
FROM jlesage/baseimage-gui:debian-9

# Copy the intel-gpu-tools package to container
COPY intel-gpu-tools_1.23-3_amd64.deb /tmp/intel-gpu-tools_1.23-3_amd64.deb

# Install packages.
RUN apt-get update && apt-get install -y xfce4-terminal /tmp/intel-gpu-tools_1.23-3_amd64.deb

# Generate and install favicons.
RUN APP_ICON_URL=https://ee3.pigugroup.eu/uploaded/intelhd.png && \
    install_app_icon.sh https://ee3.pigugroup.eu/uploaded/intelhd.png

# Copy the start script.
COPY startapp.sh /startapp.sh

# Clean
RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the name of the application.
ENV APP_NAME="intel-gpu-tools"
