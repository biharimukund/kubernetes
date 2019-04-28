#!/bin/bash

echo "This is worker"
sudo swapoff -a
yum install -y sshpass
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@192.168.56.105:/tmp/kubeadm_join_cmd.sh .
sh ./kubeadm_join_cmd.sh