# docker-intel-gpu-tools
Tools for monitoring intel GPU

Base image used: jlesage/baseimage-gui:alpine

```
docker run -d \
    --name=intel-gpu-tools \
    -p 5800:5800 \
    -p 5900:5900 \
    --privileged=true \
    --device /dev/dri:/dev/dri \
    -e 'USER_ID'='0' \
    djaydev/intel-gpu-tools
```

Where:
- `--device /dev/dri:/dev/dri`: Intel GPU location
- `Port 5900`: for VNC client connection
- `'USER_ID'='0'`: Runs APP as root which is required by intel-gpu-tools

Browse to http://your-host-ip:5800 to access the GUI.

### Environment Variables
Some environment variables can be set to customize the behavior of the container and its application. The following list give more details about them available at https://github.com/jlesage/docker-baseimage-gui#environment-variables
