#!/bin/bash

# Start XVFB (X virtual framebuffer) to allow graphical applications to run
Xvfb :1 -screen 0 1024x768x16 &

# Start fluxbox window manager
fluxbox &

# Start x11vnc server with encryption
x11vnc -display :1 -nopw -listen localhost -ssl -xkb &

# Start SSH server
service ssh start

# Start QEMU VM with bridge network
qemu-system-x86_64 -m 2G -hda /path/to/your/image.qcow2 \
    -net nic -net bridge,br=br0 -display vnc=:1

# Keep the container running
tail -f /dev/null
