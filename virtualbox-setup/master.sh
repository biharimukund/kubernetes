#!/bin/bash

echo "This is master"
IP_ADDR=$(ifconfig | grep -A1 eth1 | awk 'NR>1{print $2}')
HOST_NAME=$(hostname -s)
sudo swapoff -a
kubeadm init --apiserver-advertise-address=$IP_ADDR --apiserver-cert-extra-sans=$IP_ADDR  --node-name $HOST_NAME --pod-network-cidr=10.244.0.0/16
sudo --user=vagrant mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
sudo kubeadm token create --print-join-command > /tmp/kubeadm_join_cmd.sh
sudo chmod 755 /tmp/kubeadm_join_cmd.sh
sudo sed -i '/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sudo systemctl restart sshd