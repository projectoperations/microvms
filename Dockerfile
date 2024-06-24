FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils \
    xvfb x11vnc fluxbox openssh-server

# Add QEMU VM setup script
COPY setup_vm.sh /setup_vm.sh
RUN chmod +x /setup_vm.sh

CMD ["/setup_vm.sh"]
