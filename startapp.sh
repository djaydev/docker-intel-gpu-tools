#!/bin/sh
sed-patch 's/Monospace 10/Cousine Bold 10/' /usr/share/lxterminal/lxterminal.conf
exec lxterminal -e /usr/bin/intel_gpu_top
