# djaydev/intelgputools:latest

#Pull base image.
FROM jlesage/baseimage-gui:alpine-3.10-glibc

WORKDIR /tmp

# Install packages.
RUN apk add --no-cache wget dbus-x11 libva-intel-driver libva rpm2cpio xfce4-terminal && \
    wget http://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/cauldron/x86_64/media/core/release//intel-gpu-tools-1.24-1.mga8.x86_64.rpm && \
    rpm2cpio intel-gpu-tools-1.23-3.mga7.x86_64.rpm | cpio -ivd && \
    cp -r usr/* /usr/ && \
    apk del wget rpm2cpio && \
    rm -rf /var/cache/apk/* /tmp/* /tmp/.[!.]*

# Generate and install favicons.
RUN APP_ICON_URL=https://ee3.pigugroup.eu/uploaded/intelhd.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="intel-gpu-tools"
