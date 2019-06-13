# djaydev/intelgputools:latest

# Pull base image.
FROM jlesage/baseimage-gui:debian-9

WORKDIR /tmp

# Install packages.
RUN apt-get update && apt-get install --no-install-recommends -y wget alien xfce4-terminal && \
    wget http://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/cauldron/x86_64/media/core/release//intel-gpu-tools-1.23-3.mga7.x86_64.rpm && \
    alien --to-deb intel-gpu-tools-1.23-3.mga7.x86_64.rpm && \
    apt-get install -y /tmp/intel-gpu-tools_1.23-4_amd64.deb && \
    apt-get remove wget alien -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Generate and install favicons.
RUN APP_ICON_URL=https://ee3.pigugroup.eu/uploaded/intelhd.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Copy the start script.
COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh

# Set the name of the application.
ENV APP_NAME="intel-gpu-tools"
