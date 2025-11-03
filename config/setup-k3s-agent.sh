#!/bin/bash

sudo apk add cgroup-tools
sudo rc-update add cgroups default
sudo rc-service cgroups start

sudo modprobe overlay

lsmod | grep overlay || (echo "Overlay module NOT loaded!" && exit 1)

export K3S_TOKEN="6622b144185864cc78aa157eec5bbfe2"
export K3S_URL="https://192.168.56.110:6443"

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.111 --flannel-iface eth1" sh -

sudo rc-update add k3s-agent default
sudo rc-service k3s-agent start
