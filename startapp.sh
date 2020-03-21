#!/bin/sh
mkdir -p /config/xdg/config/xfce4/terminal && \
printf "[Configuration]\nEncoding=UTF-8\nFontName=Cousine 12\n" >> /config/xdg/config/xfce4/terminal/terminalrc
exec /usr/bin/xfce4-terminal -e /usr/bin/intel_gpu_top
