# k8s cluster setup on virtual box with vagrant

This repo can be used to setup k8s cluster with internal etcd on virtual box with 1 master and 2 worker nodes.

## Prequsities:
* Virtual box should be installed on system. Click [here](https://www.virtualbox.org/wiki/Downloads) to see innstallation steps if not installed.
* Vagrant should be present on your local machine. Installation [steps](https://www.vagrantup.com/docs/installation/)

## Steps to create k8s cluster:
1. git clone https://github.com/biharimukund/kubernetes.git
2. cd virtualbox-setup
3. vagrant up

Running above code will setup 1 master 2 worker nodes k8s cluster.

`servers.yaml` file contains the server details.
`commands.yaml` contains the provisiong command for machine.
`master.sh` contains k8s-master setup commands.
`worker.sh` contains k8s node setup commands.

Once the script completes successfully, you can login in the master machine k8s-master-lx01 as below:

```
$ vagrant ssh k8s-master-lx01
[vagrant@k8s-master-lx01 ~]$ sudo su -
[root@k8s-master-lx01 ~]# export KUBECONFIG=/etc/kubernetes/admin.conf
[root@k8s-master-lx01 ~]# kubectl get no
NAME              STATUS   ROLES    AGE     VERSION
k8s-master-lx01   Ready    master   15m     v1.14.1
k8s-worker-lx01   Ready    <none>   8m59s   v1.14.1
k8s-worker-lx02   Ready    <none>   2m30s   v1.14.1
```

```
[root@k8s-master-lx01 ~]# kubectl get po --all-namespaces
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-fb8b8dccf-nbztt                   1/1     Running   0          16m
kube-system   coredns-fb8b8dccf-sv9qt                   1/1     Running   0          16m
kube-system   etcd-k8s-master-lx01                      1/1     Running   0          15m
kube-system   kube-apiserver-k8s-master-lx01            1/1     Running   0          15m
kube-system   kube-controller-manager-k8s-master-lx01   1/1     Running   0          15m
kube-system   kube-flannel-ds-amd64-dzwkf               1/1     Running   0          10m
kube-system   kube-flannel-ds-amd64-qphwl               1/1     Running   1          3m31s
kube-system   kube-flannel-ds-amd64-z4f9d               1/1     Running   0          16m
kube-system   kube-proxy-bjh2c                          1/1     Running   0          3m31s
kube-system   kube-proxy-cc6kp                          1/1     Running   0          16m
kube-system   kube-proxy-h7sg2                          1/1     Running   0          10m
kube-system   kube-scheduler-k8s-master-lx01            1/1     Running   0          15m
```


### Cleanup

Run command:
1. `vagrant destroy`

### Sample ouput

```
$ vagrant up
Bringing machine 'k8s-master-lx01' up with 'virtualbox' provider...
==> k8s-master-lx01: Importing base box 'centos/7'...
==> k8s-master-lx01: Matching MAC address for NAT networking...
==> k8s-master-lx01: Checking if box 'centos/7' version '1902.01' is up to date...
==> k8s-master-lx01: Setting the name of the VM: k8s-master-lx01
==> k8s-master-lx01: Vagrant has detected a configuration issue which exposes a
==> k8s-master-lx01: vulnerability with the installed version of VirtualBox. The
==> k8s-master-lx01: current guest is configured to use an E1000 NIC type for a
==> k8s-master-lx01: network adapter which is vulnerable in this version of VirtualBox.
==> k8s-master-lx01: Ensure the guest is trusted to use this configuration or update
==> k8s-master-lx01: the NIC type using one of the methods below:
==> k8s-master-lx01: 
==> k8s-master-lx01:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> k8s-master-lx01:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> k8s-master-lx01: Clearing any previously set network interfaces...
==> k8s-master-lx01: Preparing network interfaces based on configuration...
    k8s-master-lx01: Adapter 1: nat
    k8s-master-lx01: Adapter 2: hostonly
==> k8s-master-lx01: Forwarding ports...
    k8s-master-lx01: 22 (guest) => 10522 (host) (adapter 1)
    k8s-master-lx01: 22 (guest) => 2222 (host) (adapter 1)
==> k8s-master-lx01: Running 'pre-boot' VM customizations...
==> k8s-master-lx01: Booting VM...
==> k8s-master-lx01: Waiting for machine to boot. This may take a few minutes...
    k8s-master-lx01: SSH address: 127.0.0.1:2222
    k8s-master-lx01: SSH username: vagrant
    k8s-master-lx01: SSH auth method: private key
    k8s-master-lx01: 
    k8s-master-lx01: Vagrant insecure key detected. Vagrant will automatically replace
    k8s-master-lx01: this with a newly generated keypair for better security.
    k8s-master-lx01: 
    k8s-master-lx01: Inserting generated public key within guest...
    k8s-master-lx01: Removing insecure key from the guest if it's present...
    k8s-master-lx01: Key inserted! Disconnecting and reconnecting using new SSH key...
==> k8s-master-lx01: Machine booted and ready!
==> k8s-master-lx01: Checking for guest additions in VM...
    k8s-master-lx01: No guest additions were detected on the base box for this VM! Guest
    k8s-master-lx01: additions are required for forwarded ports, shared folders, host only
    k8s-master-lx01: networking, and more. If SSH fails on this machine, please install
    k8s-master-lx01: the guest additions and repackage the box to continue.
    k8s-master-lx01: 
    k8s-master-lx01: This is not an error message; everything may continue to work properly,
    k8s-master-lx01: in which case you may ignore this message.
==> k8s-master-lx01: Setting hostname...
==> k8s-master-lx01: Configuring and enabling network interfaces...
==> k8s-master-lx01: Rsyncing folder: /Users/mukund_bihari/k8s_virtualbox/virtualbox-setup/ => /vagrant
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32053-yy8jo6.sh
    k8s-master-lx01: This is master
    k8s-master-lx01: /tmp/vagrant-shell: line 4: ifconfig: command not found
    k8s-master-lx01: /tmp/vagrant-shell: line 7: kubeadm: command not found
    k8s-master-lx01: cp: cannot stat ‘/etc/kubernetes/admin.conf’: No such file or directory
    k8s-master-lx01: chown: cannot access ‘/home/vagrant/.kube/config’: No such file or directory
    k8s-master-lx01: /tmp/vagrant-shell: line 12: kubectl: command not found
    k8s-master-lx01: sudo: kubeadm: command not found
Mukund's mac:virtualbox-setup mukund_bihari$ cat /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32053-yy8jo6.sh
cat: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32053-yy8jo6.sh: No such file or directory
Mukund's mac:virtualbox-setup mukund_bihari$ vagrant destroy
==> k8s-worker-lx02: VM not created. Moving on...
==> k8s-worker-lx01: VM not created. Moving on...
    k8s-master-lx01: Are you sure you want to destroy the 'k8s-master-lx01' VM? [y/N] y
==> k8s-master-lx01: Forcing shutdown of VM...
==> k8s-master-lx01: Destroying VM and associated drives...
Mukund's mac:virtualbox-setup mukund_bihari$ vagrant up
Bringing machine 'k8s-master-lx01' up with 'virtualbox' provider...
Bringing machine 'k8s-worker-lx01' up with 'virtualbox' provider...
Bringing machine 'k8s-worker-lx02' up with 'virtualbox' provider...
==> k8s-master-lx01: Importing base box 'centos/7'...
==> k8s-master-lx01: Matching MAC address for NAT networking...
==> k8s-master-lx01: Checking if box 'centos/7' version '1902.01' is up to date...
==> k8s-master-lx01: Setting the name of the VM: k8s-master-lx01
==> k8s-master-lx01: Vagrant has detected a configuration issue which exposes a
==> k8s-master-lx01: vulnerability with the installed version of VirtualBox. The
==> k8s-master-lx01: current guest is configured to use an E1000 NIC type for a
==> k8s-master-lx01: network adapter which is vulnerable in this version of VirtualBox.
==> k8s-master-lx01: Ensure the guest is trusted to use this configuration or update
==> k8s-master-lx01: the NIC type using one of the methods below:
==> k8s-master-lx01: 
==> k8s-master-lx01:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> k8s-master-lx01:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> k8s-master-lx01: Clearing any previously set network interfaces...
==> k8s-master-lx01: Preparing network interfaces based on configuration...
    k8s-master-lx01: Adapter 1: nat
    k8s-master-lx01: Adapter 2: hostonly
==> k8s-master-lx01: Forwarding ports...
    k8s-master-lx01: 22 (guest) => 10522 (host) (adapter 1)
    k8s-master-lx01: 22 (guest) => 2222 (host) (adapter 1)
==> k8s-master-lx01: Running 'pre-boot' VM customizations...
==> k8s-master-lx01: Booting VM...
==> k8s-master-lx01: Waiting for machine to boot. This may take a few minutes...
    k8s-master-lx01: SSH address: 127.0.0.1:2222
    k8s-master-lx01: SSH username: vagrant
    k8s-master-lx01: SSH auth method: private key
    k8s-master-lx01: 
    k8s-master-lx01: Vagrant insecure key detected. Vagrant will automatically replace
    k8s-master-lx01: this with a newly generated keypair for better security.
    k8s-master-lx01: 
    k8s-master-lx01: Inserting generated public key within guest...
    k8s-master-lx01: Removing insecure key from the guest if it's present...
    k8s-master-lx01: Key inserted! Disconnecting and reconnecting using new SSH key...
==> k8s-master-lx01: Machine booted and ready!
==> k8s-master-lx01: Checking for guest additions in VM...
    k8s-master-lx01: No guest additions were detected on the base box for this VM! Guest
    k8s-master-lx01: additions are required for forwarded ports, shared folders, host only
    k8s-master-lx01: networking, and more. If SSH fails on this machine, please install
    k8s-master-lx01: the guest additions and repackage the box to continue.
    k8s-master-lx01: 
    k8s-master-lx01: This is not an error message; everything may continue to work properly,
    k8s-master-lx01: in which case you may ignore this message.
==> k8s-master-lx01: Setting hostname...
==> k8s-master-lx01: Configuring and enabling network interfaces...
==> k8s-master-lx01: Rsyncing folder: /Users/mukund_bihari/k8s_virtualbox/virtualbox-setup/ => /vagrant
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Loaded plugins: fastestmirror
    k8s-master-lx01: Determining fastest mirrors
    k8s-master-lx01:  * base: ftp.iitm.ac.in
    k8s-master-lx01:  * extras: repos.del.extreme-ix.org
    k8s-master-lx01:  * updates: repos.del.extreme-ix.org
    k8s-master-lx01: Resolving Dependencies
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package NetworkManager.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-master-lx01: ---> Package NetworkManager.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-master-lx01: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-master-lx01: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-master-lx01: ---> Package NetworkManager-team.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-master-lx01: ---> Package NetworkManager-team.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-master-lx01: ---> Package NetworkManager-tui.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-master-lx01: ---> Package NetworkManager-tui.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-master-lx01: ---> Package dbus.x86_64 1:1.10.24-12.el7 will be updated
    k8s-master-lx01: ---> Package dbus.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-master-lx01: ---> Package dbus-libs.x86_64 1:1.10.24-12.el7 will be updated
    k8s-master-lx01: ---> Package dbus-libs.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-master-lx01: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-master-lx01: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-master-lx01: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-master-lx01: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-master-lx01: ---> Package glibc.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-master-lx01: ---> Package glibc.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-master-lx01: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-master-lx01: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-master-lx01: ---> Package iproute.x86_64 0:4.11.0-14.el7 will be updated
    k8s-master-lx01: ---> Package iproute.x86_64 0:4.11.0-14.el7_6.2 will be an update
    k8s-master-lx01: ---> Package kernel.x86_64 0:3.10.0-957.12.1.el7 will be installed
    k8s-master-lx01: ---> Package kernel-tools.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-master-lx01: ---> Package kernel-tools.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-master-lx01: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-master-lx01: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-master-lx01: ---> Package libblkid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-master-lx01: ---> Package libblkid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-master-lx01: ---> Package libgcc.x86_64 0:4.8.5-36.el7 will be updated
    k8s-master-lx01: ---> Package libgcc.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-master-lx01: ---> Package libgomp.x86_64 0:4.8.5-36.el7 will be updated
    k8s-master-lx01: ---> Package libgomp.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-master-lx01: ---> Package libmount.x86_64 0:2.23.2-59.el7 will be updated
    k8s-master-lx01: ---> Package libmount.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-master-lx01: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7 will be updated
    k8s-master-lx01: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-master-lx01: ---> Package libssh2.x86_64 0:1.4.3-12.el7 will be updated
    k8s-master-lx01: ---> Package libssh2.x86_64 0:1.4.3-12.el7_6.2 will be an update
    k8s-master-lx01: ---> Package libstdc++.x86_64 0:4.8.5-36.el7 will be updated
    k8s-master-lx01: ---> Package libstdc++.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-master-lx01: ---> Package libuuid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-master-lx01: ---> Package libuuid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-master-lx01: ---> Package nss-pem.x86_64 0:1.0.3-5.el7 will be updated
    k8s-master-lx01: ---> Package nss-pem.x86_64 0:1.0.3-5.el7_6.1 will be an update
    k8s-master-lx01: ---> Package openssl.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-master-lx01: ---> Package openssl.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-master-lx01: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-master-lx01: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-master-lx01: ---> Package polkit.x86_64 0:0.112-18.el7 will be updated
    k8s-master-lx01: ---> Package polkit.x86_64 0:0.112-18.el7_6.1 will be an update
    k8s-master-lx01: ---> Package python.x86_64 0:2.7.5-76.el7 will be updated
    k8s-master-lx01: ---> Package python.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-master-lx01: ---> Package python-libs.x86_64 0:2.7.5-76.el7 will be updated
    k8s-master-lx01: ---> Package python-libs.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-master-lx01: ---> Package python-perf.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-master-lx01: ---> Package python-perf.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-master-lx01: ---> Package rsync.x86_64 0:3.1.2-4.el7 will be updated
    k8s-master-lx01: ---> Package rsync.x86_64 0:3.1.2-6.el7_6.1 will be an update
    k8s-master-lx01: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-master-lx01: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-master-lx01: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-master-lx01: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-master-lx01: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7 will be updated
    k8s-master-lx01: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1 will be an update
    k8s-master-lx01: ---> Package systemd.x86_64 0:219-62.el7_6.5 will be updated
    k8s-master-lx01: ---> Package systemd.x86_64 0:219-62.el7_6.6 will be an update
    k8s-master-lx01: ---> Package systemd-libs.x86_64 0:219-62.el7_6.5 will be updated
    k8s-master-lx01: ---> Package systemd-libs.x86_64 0:219-62.el7_6.6 will be an update
    k8s-master-lx01: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.5 will be updated
    k8s-master-lx01: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.6 will be an update
    k8s-master-lx01: ---> Package tuned.noarch 0:2.10.0-6.el7 will be updated
    k8s-master-lx01: ---> Package tuned.noarch 0:2.10.0-6.el7_6.3 will be an update
    k8s-master-lx01: ---> Package tzdata.noarch 0:2018i-1.el7 will be updated
    k8s-master-lx01: ---> Package tzdata.noarch 0:2019a-1.el7 will be an update
    k8s-master-lx01: ---> Package util-linux.x86_64 0:2.23.2-59.el7 will be updated
    k8s-master-lx01: ---> Package util-linux.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-master-lx01: ---> Package xfsprogs.x86_64 0:4.5.0-18.el7 will be updated
    k8s-master-lx01: ---> Package xfsprogs.x86_64 0:4.5.0-19.el7_6 will be an update
    k8s-master-lx01: --> Finished Dependency Resolution
    k8s-master-lx01: 
    k8s-master-lx01: Dependencies Resolved
    k8s-master-lx01: 
    k8s-master-lx01: ================================================================================
    k8s-master-lx01:  Package                    Arch      Version                  Repository  Size
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Installing:
    k8s-master-lx01:  kernel                     x86_64    3.10.0-957.12.1.el7      updates     48 M
    k8s-master-lx01: Updating:
    k8s-master-lx01:  NetworkManager             x86_64    1:1.12.0-10.el7_6        updates    1.7 M
    k8s-master-lx01:  NetworkManager-libnm       x86_64    1:1.12.0-10.el7_6        updates    1.4 M
    k8s-master-lx01:  NetworkManager-team        x86_64    1:1.12.0-10.el7_6        updates    159 k
    k8s-master-lx01:  NetworkManager-tui         x86_64    1:1.12.0-10.el7_6        updates    239 k
    k8s-master-lx01:  dbus                       x86_64    1:1.10.24-13.el7_6       updates    245 k
    k8s-master-lx01:  dbus-libs                  x86_64    1:1.10.24-13.el7_6       updates    169 k
    k8s-master-lx01:  device-mapper              x86_64    7:1.02.149-10.el7_6.7    updates    293 k
    k8s-master-lx01:  device-mapper-libs         x86_64    7:1.02.149-10.el7_6.7    updates    320 k
    k8s-master-lx01:  glibc                      x86_64    2.17-260.el7_6.4         updates    3.7 M
    k8s-master-lx01:  glibc-common               x86_64    2.17-260.el7_6.4         updates     12 M
    k8s-master-lx01:  iproute                    x86_64    4.11.0-14.el7_6.2        updates    764 k
    k8s-master-lx01:  kernel-tools               x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-master-lx01:  kernel-tools-libs          x86_64    3.10.0-957.12.1.el7      updates    7.0 M
    k8s-master-lx01:  libblkid                   x86_64    2.23.2-59.el7_6.1        updates    181 k
    k8s-master-lx01:  libgcc                     x86_64    4.8.5-36.el7_6.2         updates    102 k
    k8s-master-lx01:  libgomp                    x86_64    4.8.5-36.el7_6.2         updates    158 k
    k8s-master-lx01:  libmount                   x86_64    2.23.2-59.el7_6.1        updates    182 k
    k8s-master-lx01:  libsmartcols               x86_64    2.23.2-59.el7_6.1        updates    140 k
    k8s-master-lx01:  libssh2                    x86_64    1.4.3-12.el7_6.2         updates    135 k
    k8s-master-lx01:  libstdc++                  x86_64    4.8.5-36.el7_6.2         updates    305 k
    k8s-master-lx01:  libuuid                    x86_64    2.23.2-59.el7_6.1        updates     82 k
    k8s-master-lx01:  nss-pem                    x86_64    1.0.3-5.el7_6.1          updates     74 k
    k8s-master-lx01:  openssl                    x86_64    1:1.0.2k-16.el7_6.1      updates    493 k
    k8s-master-lx01:  openssl-libs               x86_64    1:1.0.2k-16.el7_6.1      updates    1.2 M
    k8s-master-lx01:  polkit                     x86_64    0.112-18.el7_6.1         updates    168 k
    k8s-master-lx01:  python                     x86_64    2.7.5-77.el7_6           updates     94 k
    k8s-master-lx01:  python-libs                x86_64    2.7.5-77.el7_6           updates    5.6 M
    k8s-master-lx01:  python-perf                x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-master-lx01:  rsync                      x86_64    3.1.2-6.el7_6.1          updates    404 k
    k8s-master-lx01:  selinux-policy             noarch    3.13.1-229.el7_6.12      updates    484 k
    k8s-master-lx01:  selinux-policy-targeted    noarch    3.13.1-229.el7_6.12      updates    6.9 M
    k8s-master-lx01:  shadow-utils               x86_64    2:4.1.5.1-25.el7_6.1     updates    1.1 M
    k8s-master-lx01:  systemd                    x86_64    219-62.el7_6.6           updates    5.1 M
    k8s-master-lx01:  systemd-libs               x86_64    219-62.el7_6.6           updates    407 k
    k8s-master-lx01:  systemd-sysv               x86_64    219-62.el7_6.6           updates     84 k
    k8s-master-lx01:  tuned                      noarch    2.10.0-6.el7_6.3         updates    254 k
    k8s-master-lx01:  tzdata                     noarch    2019a-1.el7              updates    494 k
    k8s-master-lx01:  util-linux                 x86_64    2.23.2-59.el7_6.1        updates    2.0 M
    k8s-master-lx01:  xfsprogs                   x86_64    4.5.0-19.el7_6           updates    897 k
    k8s-master-lx01: 
    k8s-master-lx01: Transaction Summary
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Install   1 Package
    k8s-master-lx01: Upgrade  39 Packages
    k8s-master-lx01: 
    k8s-master-lx01: Total download size: 117 M
    k8s-master-lx01: Downloading packages:
    k8s-master-lx01: Delta RPMs reduced 26 M of updates to 7.5 M (70% saved)
    k8s-master-lx01: /usr/share/locale/ar/LC_MESSAGES/NetworkManager.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: Public key for NetworkManager-team-1.12.0-10.el7_6.x86_64.rpm is not installed
    k8s-master-lx01: warning: /var/cache/yum/x86_64/7/updates/packages/NetworkManager-team-1.12.0-10.el7_6.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    k8s-master-lx01: /usr/share/locale/cs/LC_MESSAGES/polkit-1.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: Finishing delta rebuilds of 9 package(s) (17 M)
    k8s-master-lx01: /usr/share/locale/ja/LC_MESSAGES/shadow.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: /usr/share/locale/de/LC_MESSAGES/systemd.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: /usr/share/locale/da/LC_MESSAGES/util-linux.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: /usr/share/locale/de/LC_MESSAGES/xfsprogs.mo: No such file or directory
    k8s-master-lx01: cannot reconstruct rpm from disk files
    k8s-master-lx01: Some delta RPMs failed to download or rebuild. Retrying..
    k8s-master-lx01: Public key for polkit-0.112-18.el7_6.1.x86_64.rpm is not installed
    k8s-master-lx01: --------------------------------------------------------------------------------
    k8s-master-lx01: Total                                              3.8 MB/s | 109 MB  00:28     
    k8s-master-lx01: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-master-lx01: Importing GPG key 0xF4A80EB5:
    k8s-master-lx01:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    k8s-master-lx01:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    k8s-master-lx01:  Package    : centos-release-7-6.1810.2.el7.centos.x86_64 (@anaconda)
    k8s-master-lx01:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-master-lx01: Running transaction check
    k8s-master-lx01: Running transaction test
    k8s-master-lx01: Transaction test succeeded
    k8s-master-lx01: Running transaction
    k8s-master-lx01:   Updating   : libgcc-4.8.5-36.el7_6.2.x86_64                              1/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : selinux-policy-3.13.1-229.el7_6.12.noarch                   2/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : tzdata-2019a-1.el7.noarch                                   3/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : glibc-2.17-260.el7_6.4.x86_64                               4/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : glibc-common-2.17-260.el7_6.4.x86_64                        5/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : systemd-libs-219-62.el7_6.6.x86_64                          6/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libuuid-2.23.2-59.el7_6.1.x86_64                            7/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libblkid-2.23.2-59.el7_6.1.x86_64                           8/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                    9/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    10/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : python-libs-2.7.5-77.el7_6.x86_64                          11/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : python-2.7.5-77.el7_6.x86_64                               12/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libmount-2.23.2-59.el7_6.1.x86_64                          13/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              14/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : python-perf-3.10.0-957.12.1.el7.x86_64                     15/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        16/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : systemd-219-62.el7_6.6.x86_64                              17/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:dbus-1.10.24-13.el7_6.x86_64                             18/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : polkit-0.112-18.el7_6.1.x86_64                             19/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    20/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libsmartcols-2.23.2-59.el7_6.1.x86_64                      21/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : util-linux-2.23.2-59.el7_6.1.x86_64                        22/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            23/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 24/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               25/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : kernel-tools-3.10.0-957.12.1.el7.x86_64                    26/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : tuned-2.10.0-6.el7_6.3.noarch                              27/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                28/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               29/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : systemd-sysv-219-62.el7_6.6.x86_64                         30/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : rsync-3.1.2-6.el7_6.1.x86_64                               31/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libssh2-1.4.3-12.el7_6.2.x86_64                            32/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         33/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : xfsprogs-4.5.0-19.el7_6.x86_64                             34/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libstdc++-4.8.5-36.el7_6.2.x86_64                          35/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : nss-pem-1.0.3-5.el7_6.1.x86_64                             36/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : libgomp-4.8.5-36.el7_6.2.x86_64                            37/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : iproute-4.11.0-14.el7_6.2.x86_64                           38/79
    k8s-master-lx01:  
    k8s-master-lx01:   Updating   : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         39/79
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : kernel-3.10.0-957.12.1.el7.x86_64                          40/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : tuned-2.10.0-6.el7.noarch                                  41/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : systemd-sysv-219-62.el7_6.5.x86_64                         42/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 43/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 44/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            45/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : util-linux-2.23.2-59.el7.x86_64                            46/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : xfsprogs-4.5.0-18.el7.x86_64                               47/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:openssl-1.0.2k-16.el7.x86_64                             48/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : python-perf-3.10.0-957.5.1.el7.x86_64                      49/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : python-2.7.5-76.el7.x86_64                                 50/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : python-libs-2.7.5-76.el7.x86_64                            51/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : kernel-tools-3.10.0-957.5.1.el7.x86_64                     52/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                53/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     54/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : polkit-0.112-18.el7.x86_64                                 55/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               56/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libstdc++-4.8.5-36.el7.x86_64                              57/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libssh2-1.4.3-12.el7.x86_64                                58/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : rsync-3.1.2-4.el7.x86_64                                   59/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          60/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:dbus-1.10.24-12.el7.x86_64                               61/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : systemd-219-62.el7_6.5.x86_64                              62/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libmount-2.23.2-59.el7.x86_64                              63/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libblkid-2.23.2-59.el7.x86_64                              64/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:dbus-libs-1.10.24-12.el7.x86_64                          65/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : systemd-libs-219-62.el7_6.5.x86_64                         66/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libuuid-2.23.2-59.el7.x86_64                               67/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       68/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : 1:openssl-libs-1.0.2k-16.el7.x86_64                        69/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                70/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libsmartcols-2.23.2-59.el7.x86_64                          71/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : iproute-4.11.0-14.el7.x86_64                               72/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libgomp-4.8.5-36.el7.x86_64                                73/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : nss-pem-1.0.3-5.el7.x86_64                                 74/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : selinux-policy-3.13.1-229.el7_6.9.noarch                   75/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : glibc-common-2.17-260.el7_6.3.x86_64                       76/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : glibc-2.17-260.el7_6.3.x86_64                              77/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : tzdata-2018i-1.el7.noarch                                  78/79
    k8s-master-lx01:  
    k8s-master-lx01:   Cleanup    : libgcc-4.8.5-36.el7.x86_64                                 79/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libsmartcols-2.23.2-59.el7_6.1.x86_64                       1/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-sysv-219-62.el7_6.6.x86_64                          2/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libssh2-1.4.3-12.el7_6.2.x86_64                             3/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : glibc-common-2.17-260.el7_6.4.x86_64                        4/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libblkid-2.23.2-59.el7_6.1.x86_64                           5/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : util-linux-2.23.2-59.el7_6.1.x86_64                         6/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : rsync-3.1.2-6.el7_6.1.x86_64                                7/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libmount-2.23.2-59.el7_6.1.x86_64                           8/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libstdc++-4.8.5-36.el7_6.2.x86_64                           9/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                   10/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : nss-pem-1.0.3-5.el7_6.1.x86_64                             11/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libgcc-4.8.5-36.el7_6.2.x86_64                             12/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libgomp-4.8.5-36.el7_6.2.x86_64                            13/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         14/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : tzdata-2019a-1.el7.noarch                                  15/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : iproute-4.11.0-14.el7_6.2.x86_64                           16/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         17/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-perf-3.10.0-957.12.1.el7.x86_64                     18/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                19/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : polkit-0.112-18.el7_6.1.x86_64                             20/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        21/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            22/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    23/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kernel-3.10.0-957.12.1.el7.x86_64                          24/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    25/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-2.7.5-77.el7_6.x86_64                               26/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-219-62.el7_6.6.x86_64                              27/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                             28/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              29/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : selinux-policy-3.13.1-229.el7_6.12.noarch                  30/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libuuid-2.23.2-59.el7_6.1.x86_64                           31/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : xfsprogs-4.5.0-19.el7_6.x86_64                             32/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               33/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : glibc-2.17-260.el7_6.4.x86_64                              34/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-libs-219-62.el7_6.6.x86_64                         35/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               36/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kernel-tools-3.10.0-957.12.1.el7.x86_64                    37/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-libs-2.7.5-77.el7_6.x86_64                          38/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : tuned-2.10.0-6.el7_6.3.noarch                              39/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 40/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-2.7.5-76.el7.x86_64                                 41/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-perf-3.10.0-957.5.1.el7.x86_64                      42/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               43/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libblkid-2.23.2-59.el7.x86_64                              44/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kernel-tools-3.10.0-957.5.1.el7.x86_64                     45/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-219-62.el7_6.5.x86_64                              46/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libgcc-4.8.5-36.el7.x86_64                                 47/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : iproute-4.11.0-14.el7.x86_64                               48/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libstdc++-4.8.5-36.el7.x86_64                              49/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:openssl-libs-1.0.2k-16.el7.x86_64                        50/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : glibc-2.17-260.el7_6.3.x86_64                              51/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            52/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : xfsprogs-4.5.0-18.el7.x86_64                               53/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libuuid-2.23.2-59.el7.x86_64                               54/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : nss-pem-1.0.3-5.el7.x86_64                                 55/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libssh2-1.4.3-12.el7.x86_64                                56/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:openssl-1.0.2k-16.el7.x86_64                             57/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-libs-219-62.el7_6.5.x86_64                         58/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:dbus-1.10.24-12.el7.x86_64                               59/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : rsync-3.1.2-4.el7.x86_64                                   60/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 61/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                62/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       63/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libgomp-4.8.5-36.el7.x86_64                                64/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     65/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : selinux-policy-3.13.1-229.el7_6.9.noarch                   66/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          67/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:dbus-libs-1.10.24-12.el7.x86_64                          68/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : systemd-sysv-219-62.el7_6.5.x86_64                         69/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libmount-2.23.2-59.el7.x86_64                              70/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : util-linux-2.23.2-59.el7.x86_64                            71/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libsmartcols-2.23.2-59.el7.x86_64                          72/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-libs-2.7.5-76.el7.x86_64                            73/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : polkit-0.112-18.el7.x86_64                                 74/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : tzdata-2018i-1.el7.noarch                                  75/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                76/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : glibc-common-2.17-260.el7_6.3.x86_64                       77/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 78/79
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : tuned-2.10.0-6.el7.noarch                                  79/79
    k8s-master-lx01:  
    k8s-master-lx01: 
    k8s-master-lx01: Installed:
    k8s-master-lx01:   kernel.x86_64 0:3.10.0-957.12.1.el7                                           
    k8s-master-lx01: 
    k8s-master-lx01: Updated:
    k8s-master-lx01:   NetworkManager.x86_64 1:1.12.0-10.el7_6                                       
    k8s-master-lx01:   NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6                                 
    k8s-master-lx01:   NetworkManager-team.x86_64 1:1.12.0-10.el7_6                                  
    k8s-master-lx01:   NetworkManager-tui.x86_64 1:1.12.0-10.el7_6                                   
    k8s-master-lx01:   dbus.x86_64 1:1.10.24-13.el7_6                                                
    k8s-master-lx01:   dbus-libs.x86_64 1:1.10.24-13.el7_6                                           
    k8s-master-lx01:   device-mapper.x86_64 7:1.02.149-10.el7_6.7                                    
    k8s-master-lx01:   device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7                               
    k8s-master-lx01:   glibc.x86_64 0:2.17-260.el7_6.4                                               
    k8s-master-lx01:   glibc-common.x86_64 0:2.17-260.el7_6.4                                        
    k8s-master-lx01:   iproute.x86_64 0:4.11.0-14.el7_6.2                                            
    k8s-master-lx01:   kernel-tools.x86_64 0:3.10.0-957.12.1.el7                                     
    k8s-master-lx01:   kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7                                
    k8s-master-lx01:   libblkid.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-master-lx01:   libgcc.x86_64 0:4.8.5-36.el7_6.2                                              
    k8s-master-lx01:   libgomp.x86_64 0:4.8.5-36.el7_6.2                                             
    k8s-master-lx01:   libmount.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-master-lx01:   libsmartcols.x86_64 0:2.23.2-59.el7_6.1                                       
    k8s-master-lx01:   libssh2.x86_64 0:1.4.3-12.el7_6.2                                             
    k8s-master-lx01:   libstdc++.x86_64 0:4.8.5-36.el7_6.2                                           
    k8s-master-lx01:   libuuid.x86_64 0:2.23.2-59.el7_6.1                                            
    k8s-master-lx01:   nss-pem.x86_64 0:1.0.3-5.el7_6.1                                              
    k8s-master-lx01:   openssl.x86_64 1:1.0.2k-16.el7_6.1                                            
    k8s-master-lx01:   openssl-libs.x86_64 1:1.0.2k-16.el7_6.1                                       
    k8s-master-lx01:   polkit.x86_64 0:0.112-18.el7_6.1                                              
    k8s-master-lx01:   python.x86_64 0:2.7.5-77.el7_6                                                
    k8s-master-lx01:   python-libs.x86_64 0:2.7.5-77.el7_6                                           
    k8s-master-lx01:   python-perf.x86_64 0:3.10.0-957.12.1.el7                                      
    k8s-master-lx01:   rsync.x86_64 0:3.1.2-6.el7_6.1                                                
    k8s-master-lx01:   selinux-policy.noarch 0:3.13.1-229.el7_6.12                                   
    k8s-master-lx01:   selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12                          
    k8s-master-lx01:   shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1                                      
    k8s-master-lx01:   systemd.x86_64 0:219-62.el7_6.6                                               
    k8s-master-lx01:   systemd-libs.x86_64 0:219-62.el7_6.6                                          
    k8s-master-lx01:   systemd-sysv.x86_64 0:219-62.el7_6.6                                          
    k8s-master-lx01:   tuned.noarch 0:2.10.0-6.el7_6.3                                               
    k8s-master-lx01:   tzdata.noarch 0:2019a-1.el7                                                   
    k8s-master-lx01:   util-linux.x86_64 0:2.23.2-59.el7_6.1                                         
    k8s-master-lx01:   xfsprogs.x86_64 0:4.5.0-19.el7_6                                              
    k8s-master-lx01: Complete!
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Loaded plugins: fastestmirror
    k8s-master-lx01: Loading mirror speeds from cached hostfile
    k8s-master-lx01:  * base: ftp.iitm.ac.in
    k8s-master-lx01:  * extras: repos.del.extreme-ix.org
    k8s-master-lx01:  * updates: repos.del.extreme-ix.org
    k8s-master-lx01: Resolving Dependencies
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package bind-utils.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-master-lx01: --> Processing Dependency: bind-libs = 32:9.9.4-73.el7_6 for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: liblwres.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: libisccfg.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: libisccc.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: libisc.so.95()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: libdns.so.100()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: --> Processing Dependency: libbind9.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-master-lx01: ---> Package docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-master-lx01: --> Processing Dependency: docker-common = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: docker-client = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: subscription-manager-rhsm-certificates for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: ---> Package epel-release.noarch 0:7-11 will be installed
    k8s-master-lx01: ---> Package net-tools.x86_64 0:2.0-0.24.20131004git.el7 will be installed
    k8s-master-lx01: ---> Package ntp.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-master-lx01: --> Processing Dependency: ntpdate = 4.2.6p5-28.el7.centos for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed
    k8s-master-lx01: ---> Package bind-libs.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-master-lx01: ---> Package docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-master-lx01: ---> Package docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-master-lx01: --> Processing Dependency: skopeo-containers >= 1:0.1.26-2 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: oci-umount >= 2:2.3.3-3 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: oci-systemd-hook >= 1:0.1.4-9 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: oci-register-machine >= 1:0-5.13 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: lvm2 >= 2.02.112 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: container-storage-setup >= 0.9.0-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: container-selinux >= 2:2.51-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: atomic-registries for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-master-lx01: ---> Package ntpdate.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-master-lx01: ---> Package subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos will be installed
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos will be installed
    k8s-master-lx01: --> Processing Dependency: python-yaml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: python-setuptools for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-master-lx01: --> Processing Dependency: python-pytoml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-master-lx01: ---> Package container-selinux.noarch 2:2.95-2.el7_6 will be installed
    k8s-master-lx01: --> Processing Dependency: policycoreutils-python for package: 2:container-selinux-2.95-2.el7_6.noarch
    k8s-master-lx01: ---> Package container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7 will be installed
    k8s-master-lx01: ---> Package containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos will be installed
    k8s-master-lx01: ---> Package lvm2.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-master-lx01: --> Processing Dependency: lvm2-libs = 7:2.02.180-10.el7_6.7 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: device-mapper-persistent-data >= 0.7.0-0.1.rc6 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: liblvm2app.so.2.2(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: libdevmapper-event.so.1.02(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: libaio.so.1(LIBAIO_0.4)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: libaio.so.1(LIBAIO_0.1)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: liblvm2app.so.2.2()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: libdevmapper-event.so.1.02()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: --> Processing Dependency: libaio.so.1()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: ---> Package oci-register-machine.x86_64 1:0-6.git2b44233.el7 will be installed
    k8s-master-lx01: ---> Package oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6 will be installed
    k8s-master-lx01: --> Processing Dependency: libyajl.so.2()(64bit) for package: 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64
    k8s-master-lx01: ---> Package oci-umount.x86_64 2:2.3.4-2.git87f9237.el7 will be installed
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package PyYAML.x86_64 0:3.10-11.el7 will be installed
    k8s-master-lx01: --> Processing Dependency: libyaml-0.so.2()(64bit) for package: PyYAML-3.10-11.el7.x86_64
    k8s-master-lx01: ---> Package device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-master-lx01: ---> Package device-mapper-persistent-data.x86_64 0:0.7.3-3.el7 will be installed
    k8s-master-lx01: ---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed
    k8s-master-lx01: ---> Package lvm2-libs.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-master-lx01: --> Processing Dependency: device-mapper-event = 7:1.02.149-10.el7_6.7 for package: 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64
    k8s-master-lx01: ---> Package policycoreutils-python.x86_64 0:2.5-29.el7_6.1 will be installed
    k8s-master-lx01: --> Processing Dependency: setools-libs >= 3.3.8-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libsemanage-python >= 2.5-14 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: audit-libs-python >= 2.1.3-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: python-IPy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libqpol.so.1(VERS_1.4)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libqpol.so.1(VERS_1.2)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libcgroup for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libapol.so.4(VERS_4.0)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: checkpolicy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libqpol.so.1()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: --> Processing Dependency: libapol.so.4()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-master-lx01: ---> Package python-pytoml.noarch 0:0.1.14-1.git7dea353.el7 will be installed
    k8s-master-lx01: ---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed
    k8s-master-lx01: --> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch
    k8s-master-lx01: ---> Package yajl.x86_64 0:2.0.4-4.el7 will be installed
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package audit-libs-python.x86_64 0:2.8.4-4.el7 will be installed
    k8s-master-lx01: ---> Package checkpolicy.x86_64 0:2.5-8.el7 will be installed
    k8s-master-lx01: ---> Package device-mapper-event.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-master-lx01: ---> Package libcgroup.x86_64 0:0.41-20.el7 will be installed
    k8s-master-lx01: ---> Package libsemanage-python.x86_64 0:2.5-14.el7 will be installed
    k8s-master-lx01: ---> Package libyaml.x86_64 0:0.1.4-11.el7_0 will be installed
    k8s-master-lx01: ---> Package python-IPy.noarch 0:0.75-6.el7 will be installed
    k8s-master-lx01: ---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed
    k8s-master-lx01: --> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-master-lx01: --> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-master-lx01: ---> Package setools-libs.x86_64 0:3.3.8-4.el7 will be installed
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
    k8s-master-lx01: ---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed
    k8s-master-lx01: --> Finished Dependency Resolution
    k8s-master-lx01: 
    k8s-master-lx01: Dependencies Resolved
    k8s-master-lx01: 
    k8s-master-lx01: ================================================================================
    k8s-master-lx01:  Package                 Arch   Version                           Repository
    k8s-master-lx01:                                                                            Size
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Installing:
    k8s-master-lx01:  bind-utils              x86_64 32:9.9.4-73.el7_6                 updates 206 k
    k8s-master-lx01:  docker                  x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   18 M
    k8s-master-lx01:  epel-release            noarch 7-11                              extras   15 k
    k8s-master-lx01:  net-tools               x86_64 2.0-0.24.20131004git.el7          base    306 k
    k8s-master-lx01:  ntp                     x86_64 4.2.6p5-28.el7.centos             base    549 k
    k8s-master-lx01: Installing for dependencies:
    k8s-master-lx01:  PyYAML                  x86_64 3.10-11.el7                       base    153 k
    k8s-master-lx01:  atomic-registries       x86_64 1:1.22.1-26.gitb507039.el7.centos extras   35 k
    k8s-master-lx01:  audit-libs-python       x86_64 2.8.4-4.el7                       base     76 k
    k8s-master-lx01:  autogen-libopts         x86_64 5.18-5.el7                        base     66 k
    k8s-master-lx01:  bind-libs               x86_64 32:9.9.4-73.el7_6                 updates 1.0 M
    k8s-master-lx01:  checkpolicy             x86_64 2.5-8.el7                         base    295 k
    k8s-master-lx01:  container-selinux       noarch 2:2.95-2.el7_6                    extras   39 k
    k8s-master-lx01:  container-storage-setup noarch 0.11.0-2.git5eaf76c.el7           extras   35 k
    k8s-master-lx01:  containers-common       x86_64 1:0.1.35-2.git404c5bd.el7.centos  extras   21 k
    k8s-master-lx01:  device-mapper-event     x86_64 7:1.02.149-10.el7_6.7             updates 189 k
    k8s-master-lx01:  device-mapper-event-libs
    k8s-master-lx01:                          x86_64 7:1.02.149-10.el7_6.7             updates 188 k
    k8s-master-lx01:  device-mapper-persistent-data
    k8s-master-lx01:                          x86_64 0.7.3-3.el7                       base    405 k
    k8s-master-lx01:  docker-client           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras  3.9 M
    k8s-master-lx01:  docker-common           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   96 k
    k8s-master-lx01:  libaio                  x86_64 0.3.109-13.el7                    base     24 k
    k8s-master-lx01:  libcgroup               x86_64 0.41-20.el7                       base     66 k
    k8s-master-lx01:  libsemanage-python      x86_64 2.5-14.el7                        base    113 k
    k8s-master-lx01:  libyaml                 x86_64 0.1.4-11.el7_0                    base     55 k
    k8s-master-lx01:  lvm2                    x86_64 7:2.02.180-10.el7_6.7             updates 1.3 M
    k8s-master-lx01:  lvm2-libs               x86_64 7:2.02.180-10.el7_6.7             updates 1.1 M
    k8s-master-lx01:  ntpdate                 x86_64 4.2.6p5-28.el7.centos             base     86 k
    k8s-master-lx01:  oci-register-machine    x86_64 1:0-6.git2b44233.el7              extras  1.1 M
    k8s-master-lx01:  oci-systemd-hook        x86_64 1:0.1.18-3.git8787307.el7_6       extras   34 k
    k8s-master-lx01:  oci-umount              x86_64 2:2.3.4-2.git87f9237.el7          extras   32 k
    k8s-master-lx01:  policycoreutils-python  x86_64 2.5-29.el7_6.1                    updates 456 k
    k8s-master-lx01:  python-IPy              noarch 0.75-6.el7                        base     32 k
    k8s-master-lx01:  python-backports        x86_64 1.0-8.el7                         base    5.8 k
    k8s-master-lx01:  python-backports-ssl_match_hostname
    k8s-master-lx01:                          noarch 3.5.0.1-1.el7                     base     13 k
    k8s-master-lx01:  python-ipaddress        noarch 1.0.16-2.el7                      base     34 k
    k8s-master-lx01:  python-pytoml           noarch 0.1.14-1.git7dea353.el7           extras   18 k
    k8s-master-lx01:  python-setuptools       noarch 0.9.8-7.el7                       base    397 k
    k8s-master-lx01:  setools-libs            x86_64 3.3.8-4.el7                       base    620 k
    k8s-master-lx01:  subscription-manager-rhsm-certificates
    k8s-master-lx01:                          x86_64 1.21.10-3.el7.centos              updates 207 k
    k8s-master-lx01:  yajl                    x86_64 2.0.4-4.el7                       base     39 k
    k8s-master-lx01: 
    k8s-master-lx01: Transaction Summary
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Install  5 Packages (+34 Dependent packages)
    k8s-master-lx01: Total download size: 31 M
    k8s-master-lx01: Installed size: 103 M
    k8s-master-lx01: Downloading packages:
    k8s-master-lx01: --------------------------------------------------------------------------------
    k8s-master-lx01: Total                                              6.2 MB/s |  31 MB  00:04     
    k8s-master-lx01: Running transaction check
    k8s-master-lx01: Running transaction test
    k8s-master-lx01: Transaction test succeeded
    k8s-master-lx01: Running transaction
    k8s-master-lx01:   Installing : libaio-0.3.109-13.el7.x86_64                                1/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64       2/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : yajl-2.0.4-4.el7.x86_64                                     3/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                  4/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64         5/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            6/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                      7/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : device-mapper-persistent-data-0.7.3-3.el7.x86_64            8/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           9/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch     10/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-ipaddress-1.0.16-2.el7.noarch                       11/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 32:bind-libs-9.9.4-73.el7_6.x86_64                         12/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libyaml-0.1.4-11.el7_0.x86_64                              13/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : PyYAML-3.10-11.el7.x86_64                                  14/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : audit-libs-python-2.8.4-4.el7.x86_64                       15/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   16/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           17/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-backports-1.0-8.el7.x86_64                          18/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch   19/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-setuptools-0.9.8-7.el7.noarch                       20/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libsemanage-python-2.5-14.el7.x86_64                       21/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : ntpdate-4.2.6p5-28.el7.centos.x86_64                       22/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : setools-libs-3.3.8-4.el7.x86_64                            23/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-pytoml-0.1.14-1.git7dea353.el7.noarch               24/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   25/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : python-IPy-0.75-6.el7.noarch                               26/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : checkpolicy-2.5-8.el7.x86_64                               27/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   28/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : autogen-libopts-5.18-5.el7.x86_64                          29/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libcgroup-0.41-20.el7.x86_64                               30/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : policycoreutils-python-2.5-29.el7_6.1.x86_64               31/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 2:container-selinux-2.95-2.el7_6.noarch                    32/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     33/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64     34/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            35/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : ntp-4.2.6p5-28.el7.centos.x86_64                           36/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : 32:bind-utils-9.9.4-73.el7_6.x86_64                        37/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : epel-release-7-11.noarch                                   38/39
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : net-tools-2.0-0.24.20131004git.el7.x86_64                  39/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : device-mapper-persistent-data-0.7.3-3.el7.x86_64            1/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libcgroup-0.41-20.el7.x86_64                                2/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch    3/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64      4/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            5/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : autogen-libopts-5.18-5.el7.x86_64                           6/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch      7/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           8/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-setuptools-0.9.8-7.el7.noarch                        9/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   10/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : net-tools-2.0-0.24.20131004git.el7.x86_64                  11/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:container-selinux-2.95-2.el7_6.noarch                    12/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                 13/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : checkpolicy-2.5-8.el7.x86_64                               14/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : epel-release-7-11.noarch                                   15/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : ntp-4.2.6p5-28.el7.centos.x86_64                           16/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64      17/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-IPy-0.75-6.el7.noarch                               18/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     19/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-pytoml-0.1.14-1.git7dea353.el7.noarch               20/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64        21/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : setools-libs-3.3.8-4.el7.x86_64                            22/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            23/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : ntpdate-4.2.6p5-28.el7.centos.x86_64                       24/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libsemanage-python-2.5-14.el7.x86_64                       25/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-backports-1.0-8.el7.x86_64                          26/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           27/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 32:bind-utils-9.9.4-73.el7_6.x86_64                        28/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   29/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : yajl-2.0.4-4.el7.x86_64                                    30/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   31/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : audit-libs-python-2.8.4-4.el7.x86_64                       32/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libyaml-0.1.4-11.el7_0.x86_64                              33/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libaio-0.3.109-13.el7.x86_64                               34/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 32:bind-libs-9.9.4-73.el7_6.x86_64                         35/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : python-ipaddress-1.0.16-2.el7.noarch                       36/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : policycoreutils-python-2.5-29.el7_6.1.x86_64               37/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : PyYAML-3.10-11.el7.x86_64                                  38/39
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                     39/39
    k8s-master-lx01:  
    k8s-master-lx01: 
    k8s-master-lx01: Installed:
    k8s-master-lx01:   bind-utils.x86_64 32:9.9.4-73.el7_6                                           
    k8s-master-lx01:   docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                               
    k8s-master-lx01:   epel-release.noarch 0:7-11                                                    
    k8s-master-lx01:   net-tools.x86_64 0:2.0-0.24.20131004git.el7                                   
    k8s-master-lx01:   ntp.x86_64 0:4.2.6p5-28.el7.centos                                            
    k8s-master-lx01: 
    k8s-master-lx01: Dependency Installed:
    k8s-master-lx01:   PyYAML.x86_64 0:3.10-11.el7                                                   
    k8s-master-lx01:   atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos                    
    k8s-master-lx01:   audit-libs-python.x86_64 0:2.8.4-4.el7                                        
    k8s-master-lx01:   autogen-libopts.x86_64 0:5.18-5.el7                                           
    k8s-master-lx01:   bind-libs.x86_64 32:9.9.4-73.el7_6                                            
    k8s-master-lx01:   checkpolicy.x86_64 0:2.5-8.el7                                                
    k8s-master-lx01:   container-selinux.noarch 2:2.95-2.el7_6                                       
    k8s-master-lx01:   container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7                      
    k8s-master-lx01:   containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos                     
    k8s-master-lx01:   device-mapper-event.x86_64 7:1.02.149-10.el7_6.7                              
    k8s-master-lx01:   device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7                         
    k8s-master-lx01:   device-mapper-persistent-data.x86_64 0:0.7.3-3.el7                            
    k8s-master-lx01:   docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-master-lx01:   docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-master-lx01:   libaio.x86_64 0:0.3.109-13.el7                                                
    k8s-master-lx01:   libcgroup.x86_64 0:0.41-20.el7                                                
    k8s-master-lx01:   libsemanage-python.x86_64 0:2.5-14.el7                                        
    k8s-master-lx01:   libyaml.x86_64 0:0.1.4-11.el7_0                                               
    k8s-master-lx01:   lvm2.x86_64 7:2.02.180-10.el7_6.7                                             
    k8s-master-lx01:   lvm2-libs.x86_64 7:2.02.180-10.el7_6.7                                        
    k8s-master-lx01:   ntpdate.x86_64 0:4.2.6p5-28.el7.centos                                        
    k8s-master-lx01:   oci-register-machine.x86_64 1:0-6.git2b44233.el7                              
    k8s-master-lx01:   oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6                           
    k8s-master-lx01:   oci-umount.x86_64 2:2.3.4-2.git87f9237.el7                                    
    k8s-master-lx01:   policycoreutils-python.x86_64 0:2.5-29.el7_6.1                                
    k8s-master-lx01:   python-IPy.noarch 0:0.75-6.el7                                                
    k8s-master-lx01:   python-backports.x86_64 0:1.0-8.el7                                           
    k8s-master-lx01:   python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    
    k8s-master-lx01:   python-ipaddress.noarch 0:1.0.16-2.el7                                        
    k8s-master-lx01:   python-pytoml.noarch 0:0.1.14-1.git7dea353.el7                                
    k8s-master-lx01:   python-setuptools.noarch 0:0.9.8-7.el7                                        
    k8s-master-lx01:   setools-libs.x86_64 0:3.3.8-4.el7                                             
    k8s-master-lx01:   subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos          
    k8s-master-lx01:   yajl.x86_64 0:2.0.4-4.el7                                                     
    k8s-master-lx01: Complete!
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/ntpd.service to /usr/lib/systemd/system/ntpd.service.
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: * Applying /usr/lib/sysctl.d/00-system.conf ...
    k8s-master-lx01: net.bridge.bridge-nf-call-ip6tables = 0
    k8s-master-lx01: net.bridge.bridge-nf-call-iptables = 0
    k8s-master-lx01: net.bridge.bridge-nf-call-arptables = 0
    k8s-master-lx01: * Applying /usr/lib/sysctl.d/10-default-yama-scope.conf ...
    k8s-master-lx01: kernel.yama.ptrace_scope = 0
    k8s-master-lx01: * Applying /usr/lib/sysctl.d/50-default.conf ...
    k8s-master-lx01: kernel.sysrq = 16
    k8s-master-lx01: kernel.core_uses_pid = 1
    k8s-master-lx01: net.ipv4.conf.default.rp_filter = 1
    k8s-master-lx01: net.ipv4.conf.all.rp_filter = 1
    k8s-master-lx01: net.ipv4.conf.default.accept_source_route = 0
    k8s-master-lx01: net.ipv4.conf.all.accept_source_route = 0
    k8s-master-lx01: net.ipv4.conf.default.promote_secondaries = 1
    k8s-master-lx01: net.ipv4.conf.all.promote_secondaries = 1
    k8s-master-lx01: fs.protected_hardlinks = 1
    k8s-master-lx01: fs.protected_symlinks = 1
    k8s-master-lx01: * Applying /usr/lib/sysctl.d/99-docker.conf ...
    k8s-master-lx01: fs.may_detach_mounts = 1
    k8s-master-lx01: * Applying /etc/sysctl.d/99-sysctl.conf ...
    k8s-master-lx01: * Applying /etc/sysctl.d/k8s.conf ...
    k8s-master-lx01: net.bridge.bridge-nf-call-ip6tables = 1
    k8s-master-lx01: net.bridge.bridge-nf-call-iptables = 1
    k8s-master-lx01: * Applying /etc/sysctl.conf ...
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Loaded plugins: fastestmirror
    k8s-master-lx01: Loading mirror speeds from cached hostfile
    k8s-master-lx01:  * base: ftp.iitm.ac.in
    k8s-master-lx01:  * epel: repos.del.extreme-ix.org
    k8s-master-lx01:  * extras: repos.del.extreme-ix.org
    k8s-master-lx01:  * updates: repos.del.extreme-ix.org
    k8s-master-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-master-lx01: Importing GPG key 0xA7317B0F:
    k8s-master-lx01:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-master-lx01:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-master-lx01:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-master-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-master-lx01: Resolving Dependencies
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package kubeadm.x86_64 0:1.14.1-0 will be installed
    k8s-master-lx01: --> Processing Dependency: kubernetes-cni >= 0.7.5 for package: kubeadm-1.14.1-0.x86_64
    k8s-master-lx01: --> Processing Dependency: cri-tools >= 1.11.0 for package: kubeadm-1.14.1-0.x86_64
    k8s-master-lx01: ---> Package kubectl.x86_64 0:1.14.1-0 will be installed
    k8s-master-lx01: ---> Package kubelet.x86_64 0:1.14.1-0 will be installed
    k8s-master-lx01: --> Processing Dependency: socat for package: kubelet-1.14.1-0.x86_64
    k8s-master-lx01: --> Processing Dependency: conntrack for package: kubelet-1.14.1-0.x86_64
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package conntrack-tools.x86_64 0:1.4.4-4.el7 will be installed
    k8s-master-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.1)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: --> Processing Dependency: libnetfilter_cthelper.so.0(LIBNETFILTER_CTHELPER_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: --> Processing Dependency: libnetfilter_queue.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: --> Processing Dependency: libnetfilter_cthelper.so.0()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-master-lx01: ---> Package cri-tools.x86_64 0:1.12.0-0 will be installed
    k8s-master-lx01: ---> Package kubernetes-cni.x86_64 0:0.7.5-0 will be installed
    k8s-master-lx01: ---> Package socat.x86_64 0:1.7.3.2-2.el7 will be installed
    k8s-master-lx01: --> Running transaction check
    k8s-master-lx01: ---> Package libnetfilter_cthelper.x86_64 0:1.0.0-9.el7 will be installed
    k8s-master-lx01: ---> Package libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7 will be installed
    k8s-master-lx01: ---> Package libnetfilter_queue.x86_64 0:1.0.2-2.el7_2 will be installed
    k8s-master-lx01: --> Finished Dependency Resolution
    k8s-master-lx01: 
    k8s-master-lx01: Dependencies Resolved
    k8s-master-lx01: 
    k8s-master-lx01: ================================================================================
    k8s-master-lx01:  Package                    Arch       Version             Repository      Size
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Installing:
    k8s-master-lx01:  kubeadm                    x86_64     1.14.1-0            kubernetes     8.7 M
    k8s-master-lx01:  kubectl                    x86_64     1.14.1-0            kubernetes     9.5 M
    k8s-master-lx01:  kubelet                    x86_64     1.14.1-0            kubernetes      23 M
    k8s-master-lx01: Installing for dependencies:
    k8s-master-lx01:  conntrack-tools            x86_64     1.4.4-4.el7         base           186 k
    k8s-master-lx01:  cri-tools                  x86_64     1.12.0-0            kubernetes     4.2 M
    k8s-master-lx01:  kubernetes-cni             x86_64     0.7.5-0             kubernetes      10 M
    k8s-master-lx01:  libnetfilter_cthelper      x86_64     1.0.0-9.el7         base            18 k
    k8s-master-lx01:  libnetfilter_cttimeout     x86_64     1.0.0-6.el7         base            18 k
    k8s-master-lx01:  libnetfilter_queue         x86_64     1.0.2-2.el7_2       base            23 k
    k8s-master-lx01:  socat                      x86_64     1.7.3.2-2.el7       base           290 k
    k8s-master-lx01: 
    k8s-master-lx01: Transaction Summary
    k8s-master-lx01: ================================================================================
    k8s-master-lx01: Install  3 Packages (+7 Dependent packages)
    k8s-master-lx01: 
    k8s-master-lx01: Total download size: 56 M
    k8s-master-lx01: Installed size: 256 M
    k8s-master-lx01: Downloading packages:
    k8s-master-lx01: warning: /var/cache/yum/x86_64/7/kubernetes/packages/9e1af74c18311f2f6f8460dbd1aa3e02911105bfd455416381e995d8172a0a01-kubeadm-1.14.1-0.x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 3e1ba8d5: NOKEY
    k8s-master-lx01: Public key for 9e1af74c18311f2f6f8460dbd1aa3e02911105bfd455416381e995d8172a0a01-kubeadm-1.14.1-0.x86_64.rpm is not installed
    k8s-master-lx01: --------------------------------------------------------------------------------
    k8s-master-lx01: Total                                              5.9 MB/s |  56 MB  00:09     
    k8s-master-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-master-lx01: Importing GPG key 0xA7317B0F:
    k8s-master-lx01:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-master-lx01:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-master-lx01:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-master-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-master-lx01: Importing GPG key 0x3E1BA8D5:
    k8s-master-lx01:  Userid     : "Google Cloud Packages RPM Signing Key <gc-team@google.com>"
    k8s-master-lx01:  Fingerprint: 3749 e1ba 95a8 6ce0 5454 6ed2 f09c 394c 3e1b a8d5
    k8s-master-lx01:  From       : https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-master-lx01: Running transaction check
    k8s-master-lx01: Running transaction test
    k8s-master-lx01: Transaction test succeeded
    k8s-master-lx01: Running transaction
    k8s-master-lx01:   Installing : socat-1.7.3.2-2.el7.x86_64                                  1/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     2/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   3/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : kubectl-1.14.1-0.x86_64                                     4/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    5/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : conntrack-tools-1.4.4-4.el7.x86_64                          6/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : kubernetes-cni-0.7.5-0.x86_64                               7/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : kubelet-1.14.1-0.x86_64                                     8/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : cri-tools-1.12.0-0.x86_64                                   9/10
    k8s-master-lx01:  
    k8s-master-lx01:   Installing : kubeadm-1.14.1-0.x86_64                                    10/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : cri-tools-1.12.0-0.x86_64                                   1/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    2/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kubectl-1.14.1-0.x86_64                                     3/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   4/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     5/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kubeadm-1.14.1-0.x86_64                                     6/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kubelet-1.14.1-0.x86_64                                     7/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : kubernetes-cni-0.7.5-0.x86_64                               8/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : socat-1.7.3.2-2.el7.x86_64                                  9/10
    k8s-master-lx01:  
    k8s-master-lx01:   Verifying  : conntrack-tools-1.4.4-4.el7.x86_64                         10/10
    k8s-master-lx01:  
    k8s-master-lx01: 
    k8s-master-lx01: Installed:
    k8s-master-lx01:   kubeadm.x86_64 0:1.14.1-0 kubectl.x86_64 0:1.14.1-0 kubelet.x86_64 0:1.14.1-0
    k8s-master-lx01: 
    k8s-master-lx01: Dependency Installed:
    k8s-master-lx01:   conntrack-tools.x86_64 0:1.4.4-4.el7                                          
    k8s-master-lx01:   cri-tools.x86_64 0:1.12.0-0                                                   
    k8s-master-lx01:   kubernetes-cni.x86_64 0:0.7.5-0                                               
    k8s-master-lx01:   libnetfilter_cthelper.x86_64 0:1.0.0-9.el7                                    
    k8s-master-lx01:   libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7                                   
    k8s-master-lx01:   libnetfilter_queue.x86_64 0:1.0.2-2.el7_2                                     
    k8s-master-lx01:   socat.x86_64 0:1.7.3.2-2.el7                                                  
    k8s-master-lx01: Complete!
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: inline script
    k8s-master-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/kubelet.service to /usr/lib/systemd/system/kubelet.service.
==> k8s-master-lx01: Running provisioner: shell...
    k8s-master-lx01: Running: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32249-1lkcus7.sh
    k8s-master-lx01: This is master
    k8s-master-lx01: [init] Using Kubernetes version: v1.14.1
    k8s-master-lx01: [preflight] Running pre-flight checks
    k8s-master-lx01: [preflight] Pulling images required for setting up a Kubernetes cluster
    k8s-master-lx01: [preflight] This might take a minute or two, depending on the speed of your internet connection
    k8s-master-lx01: [preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
    k8s-master-lx01: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    k8s-master-lx01: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    k8s-master-lx01: [kubelet-start] Activating the kubelet service
    k8s-master-lx01: [certs] Using certificateDir folder "/etc/kubernetes/pki"
    k8s-master-lx01: [certs] Generating "ca" certificate and key
    k8s-master-lx01: [certs] Generating "apiserver" certificate and key
    k8s-master-lx01: [certs] apiserver serving cert is signed for DNS names [k8s-master-lx01 kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 192.168.56.105 192.168.56.105]
    k8s-master-lx01: [certs] Generating "apiserver-kubelet-client" certificate and key
    k8s-master-lx01: [certs] Generating "front-proxy-ca" certificate and key
    k8s-master-lx01: [certs] Generating "front-proxy-client" certificate and key
    k8s-master-lx01: [certs] Generating "etcd/ca" certificate and key
    k8s-master-lx01: [certs] Generating "etcd/server" certificate and key
    k8s-master-lx01: [certs] etcd/server serving cert is signed for DNS names [k8s-master-lx01 localhost] and IPs [192.168.56.105 127.0.0.1 ::1]
    k8s-master-lx01: [certs] Generating "etcd/peer" certificate and key
    k8s-master-lx01: [certs] etcd/peer serving cert is signed for DNS names [k8s-master-lx01 localhost] and IPs [192.168.56.105 127.0.0.1 ::1]
    k8s-master-lx01: [certs] Generating "etcd/healthcheck-client" certificate and key
    k8s-master-lx01: [certs] Generating "apiserver-etcd-client" certificate and key
    k8s-master-lx01: [certs] Generating "sa" key and public key
    k8s-master-lx01: [kubeconfig] Using kubeconfig folder "/etc/kubernetes"
    k8s-master-lx01: [kubeconfig] Writing "admin.conf" kubeconfig file
    k8s-master-lx01: [kubeconfig] Writing "kubelet.conf" kubeconfig file
    k8s-master-lx01: [kubeconfig] Writing "controller-manager.conf" kubeconfig file
    k8s-master-lx01: [kubeconfig] Writing "scheduler.conf" kubeconfig file
    k8s-master-lx01: [control-plane] Using manifest folder "/etc/kubernetes/manifests"
    k8s-master-lx01: [control-plane] Creating static Pod manifest for "kube-apiserver"
    k8s-master-lx01: [control-plane] Creating static Pod manifest for "kube-controller-manager"
    k8s-master-lx01: [control-plane] Creating static Pod manifest for "kube-scheduler"
    k8s-master-lx01: [etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
    k8s-master-lx01: [wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
    k8s-master-lx01: [apiclient] All control plane components are healthy after 18.503218 seconds
    k8s-master-lx01: [upload-config] storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
    k8s-master-lx01: [kubelet] Creating a ConfigMap "kubelet-config-1.14" in namespace kube-system with the configuration for the kubelets in the cluster
    k8s-master-lx01: [upload-certs] Skipping phase. Please see --experimental-upload-certs
    k8s-master-lx01: [mark-control-plane] Marking the node k8s-master-lx01 as control-plane by adding the label "node-role.kubernetes.io/master=''"
    k8s-master-lx01: [mark-control-plane] Marking the node k8s-master-lx01 as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
    k8s-master-lx01: [bootstrap-token] Using token: 4jgm24.vp3ls19rgkdi0jx6
    k8s-master-lx01: [bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
    k8s-master-lx01: [bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
    k8s-master-lx01: [bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
    k8s-master-lx01: [bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
    k8s-master-lx01: [bootstrap-token] creating the "cluster-info" ConfigMap in the "kube-public" namespace
    k8s-master-lx01: [addons] Applied essential addon: CoreDNS
    k8s-master-lx01: [addons] Applied essential addon: kube-proxy
    k8s-master-lx01: 
    k8s-master-lx01: Your Kubernetes control-plane has initialized successfully!
    k8s-master-lx01: 
    k8s-master-lx01: To start using your cluster, you need to run the following as a regular user:
    k8s-master-lx01: 
    k8s-master-lx01:   mkdir -p $HOME/.kube
    k8s-master-lx01:   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    k8s-master-lx01:   sudo chown $(id -u):$(id -g) $HOME/.kube/config
    k8s-master-lx01: 
    k8s-master-lx01: You should now deploy a pod network to the cluster.
    k8s-master-lx01: Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
    k8s-master-lx01:   https://kubernetes.io/docs/concepts/cluster-administration/addons/
    k8s-master-lx01: 
    k8s-master-lx01: Then you can join any number of worker nodes by running the following on each as root:
    k8s-master-lx01: 
    k8s-master-lx01: kubeadm join 192.168.56.105:6443 --token 4jgm24.vp3ls19rgkdi0jx6 \
    k8s-master-lx01:     --discovery-token-ca-cert-hash sha256:977053efa5b7dcd51e497f75892fb94e839838be597dcaf84689d698d6e6e7ad 
    k8s-master-lx01: clusterrole.rbac.authorization.k8s.io/flannel created
    k8s-master-lx01: clusterrolebinding.rbac.authorization.k8s.io/flannel created
    k8s-master-lx01: serviceaccount/flannel created
    k8s-master-lx01: configmap/kube-flannel-cfg created
    k8s-master-lx01: daemonset.extensions/kube-flannel-ds-amd64 created
    k8s-master-lx01: daemonset.extensions/kube-flannel-ds-arm64 created
    k8s-master-lx01: daemonset.extensions/kube-flannel-ds-arm created
    k8s-master-lx01: daemonset.extensions/kube-flannel-ds-ppc64le created
    k8s-master-lx01: daemonset.extensions/kube-flannel-ds-s390x created
==> k8s-worker-lx01: Importing base box 'centos/7'...
==> k8s-worker-lx01: Matching MAC address for NAT networking...
==> k8s-worker-lx01: Checking if box 'centos/7' version '1902.01' is up to date...
==> k8s-worker-lx01: Setting the name of the VM: k8s-worker-lx01
==> k8s-worker-lx01: Fixed port collision for 22 => 2222. Now on port 2200.
==> k8s-worker-lx01: Vagrant has detected a configuration issue which exposes a
==> k8s-worker-lx01: vulnerability with the installed version of VirtualBox. The
==> k8s-worker-lx01: current guest is configured to use an E1000 NIC type for a
==> k8s-worker-lx01: network adapter which is vulnerable in this version of VirtualBox.
==> k8s-worker-lx01: Ensure the guest is trusted to use this configuration or update
==> k8s-worker-lx01: the NIC type using one of the methods below:
==> k8s-worker-lx01: 
==> k8s-worker-lx01:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> k8s-worker-lx01:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> k8s-worker-lx01: Clearing any previously set network interfaces...
==> k8s-worker-lx01: Preparing network interfaces based on configuration...
    k8s-worker-lx01: Adapter 1: nat
    k8s-worker-lx01: Adapter 2: hostonly
==> k8s-worker-lx01: Forwarding ports...
    k8s-worker-lx01: 22 (guest) => 10622 (host) (adapter 1)
    k8s-worker-lx01: 22 (guest) => 2200 (host) (adapter 1)
==> k8s-worker-lx01: Running 'pre-boot' VM customizations...
==> k8s-worker-lx01: Booting VM...
==> k8s-worker-lx01: Waiting for machine to boot. This may take a few minutes...
    k8s-worker-lx01: SSH address: 127.0.0.1:2200
    k8s-worker-lx01: SSH username: vagrant
    k8s-worker-lx01: SSH auth method: private key
    k8s-worker-lx01: 
    k8s-worker-lx01: Vagrant insecure key detected. Vagrant will automatically replace
    k8s-worker-lx01: this with a newly generated keypair for better security.
    k8s-worker-lx01: 
    k8s-worker-lx01: Inserting generated public key within guest...
    k8s-worker-lx01: Removing insecure key from the guest if it's present...
    k8s-worker-lx01: Key inserted! Disconnecting and reconnecting using new SSH key...
==> k8s-worker-lx01: Machine booted and ready!
==> k8s-worker-lx01: Checking for guest additions in VM...
    k8s-worker-lx01: No guest additions were detected on the base box for this VM! Guest
    k8s-worker-lx01: additions are required for forwarded ports, shared folders, host only
    k8s-worker-lx01: networking, and more. If SSH fails on this machine, please install
    k8s-worker-lx01: the guest additions and repackage the box to continue.
    k8s-worker-lx01: 
    k8s-worker-lx01: This is not an error message; everything may continue to work properly,
    k8s-worker-lx01: in which case you may ignore this message.
==> k8s-worker-lx01: Setting hostname...
==> k8s-worker-lx01: Configuring and enabling network interfaces...
==> k8s-worker-lx01: Rsyncing folder: /Users/mukund_bihari/k8s_virtualbox/virtualbox-setup/ => /vagrant
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Loaded plugins: fastestmirror
    k8s-worker-lx01: Determining fastest mirrors
    k8s-worker-lx01:  * base: ftp.iitm.ac.in
    k8s-worker-lx01:  * extras: centos.myfahim.com
    k8s-worker-lx01:  * updates: centos.myfahim.com
    k8s-worker-lx01: Resolving Dependencies
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package NetworkManager.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx01: ---> Package NetworkManager.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx01: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx01: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx01: ---> Package NetworkManager-team.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx01: ---> Package NetworkManager-team.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx01: ---> Package NetworkManager-tui.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx01: ---> Package NetworkManager-tui.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx01: ---> Package dbus.x86_64 1:1.10.24-12.el7 will be updated
    k8s-worker-lx01: ---> Package dbus.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-worker-lx01: ---> Package dbus-libs.x86_64 1:1.10.24-12.el7 will be updated
    k8s-worker-lx01: ---> Package dbus-libs.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-worker-lx01: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-worker-lx01: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-worker-lx01: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-worker-lx01: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-worker-lx01: ---> Package glibc.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-worker-lx01: ---> Package glibc.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-worker-lx01: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-worker-lx01: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-worker-lx01: ---> Package iproute.x86_64 0:4.11.0-14.el7 will be updated
    k8s-worker-lx01: ---> Package iproute.x86_64 0:4.11.0-14.el7_6.2 will be an update
    k8s-worker-lx01: ---> Package kernel.x86_64 0:3.10.0-957.12.1.el7 will be installed
    k8s-worker-lx01: ---> Package kernel-tools.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx01: ---> Package kernel-tools.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx01: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx01: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx01: ---> Package libblkid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx01: ---> Package libblkid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package libgcc.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx01: ---> Package libgcc.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx01: ---> Package libgomp.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx01: ---> Package libgomp.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx01: ---> Package libmount.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx01: ---> Package libmount.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx01: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package libssh2.x86_64 0:1.4.3-12.el7 will be updated
    k8s-worker-lx01: ---> Package libssh2.x86_64 0:1.4.3-12.el7_6.2 will be an update
    k8s-worker-lx01: ---> Package libstdc++.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx01: ---> Package libstdc++.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx01: ---> Package libuuid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx01: ---> Package libuuid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package nss-pem.x86_64 0:1.0.3-5.el7 will be updated
    k8s-worker-lx01: ---> Package nss-pem.x86_64 0:1.0.3-5.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package openssl.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-worker-lx01: ---> Package openssl.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-worker-lx01: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package polkit.x86_64 0:0.112-18.el7 will be updated
    k8s-worker-lx01: ---> Package polkit.x86_64 0:0.112-18.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package python.x86_64 0:2.7.5-76.el7 will be updated
    k8s-worker-lx01: ---> Package python.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-worker-lx01: ---> Package python-libs.x86_64 0:2.7.5-76.el7 will be updated
    k8s-worker-lx01: ---> Package python-libs.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-worker-lx01: ---> Package python-perf.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx01: ---> Package python-perf.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx01: ---> Package rsync.x86_64 0:3.1.2-4.el7 will be updated
    k8s-worker-lx01: ---> Package rsync.x86_64 0:3.1.2-6.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-worker-lx01: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-worker-lx01: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-worker-lx01: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-worker-lx01: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7 will be updated
    k8s-worker-lx01: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package systemd.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx01: ---> Package systemd.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx01: ---> Package systemd-libs.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx01: ---> Package systemd-libs.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx01: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx01: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx01: ---> Package tuned.noarch 0:2.10.0-6.el7 will be updated
    k8s-worker-lx01: ---> Package tuned.noarch 0:2.10.0-6.el7_6.3 will be an update
    k8s-worker-lx01: ---> Package tzdata.noarch 0:2018i-1.el7 will be updated
    k8s-worker-lx01: ---> Package tzdata.noarch 0:2019a-1.el7 will be an update
    k8s-worker-lx01: ---> Package util-linux.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx01: ---> Package util-linux.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx01: ---> Package xfsprogs.x86_64 0:4.5.0-18.el7 will be updated
    k8s-worker-lx01: ---> Package xfsprogs.x86_64 0:4.5.0-19.el7_6 will be an update
    k8s-worker-lx01: --> Finished Dependency Resolution
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependencies Resolved
    k8s-worker-lx01: 
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01:  Package                    Arch      Version                  Repository  Size
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Installing:
    k8s-worker-lx01:  kernel                     x86_64    3.10.0-957.12.1.el7      updates     48 M
    k8s-worker-lx01: Updating:
    k8s-worker-lx01:  NetworkManager             x86_64    1:1.12.0-10.el7_6        updates    1.7 M
    k8s-worker-lx01:  NetworkManager-libnm       x86_64    1:1.12.0-10.el7_6        updates    1.4 M
    k8s-worker-lx01:  NetworkManager-team        x86_64    1:1.12.0-10.el7_6        updates    159 k
    k8s-worker-lx01:  NetworkManager-tui         x86_64    1:1.12.0-10.el7_6        updates    239 k
    k8s-worker-lx01:  dbus                       x86_64    1:1.10.24-13.el7_6       updates    245 k
    k8s-worker-lx01:  dbus-libs                  x86_64    1:1.10.24-13.el7_6       updates    169 k
    k8s-worker-lx01:  device-mapper              x86_64    7:1.02.149-10.el7_6.7    updates    293 k
    k8s-worker-lx01:  device-mapper-libs         x86_64    7:1.02.149-10.el7_6.7    updates    320 k
    k8s-worker-lx01:  glibc                      x86_64    2.17-260.el7_6.4         updates    3.7 M
    k8s-worker-lx01:  glibc-common               x86_64    2.17-260.el7_6.4         updates     12 M
    k8s-worker-lx01:  iproute                    x86_64    4.11.0-14.el7_6.2        updates    764 k
    k8s-worker-lx01:  kernel-tools               x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-worker-lx01:  kernel-tools-libs          x86_64    3.10.0-957.12.1.el7      updates    7.0 M
    k8s-worker-lx01:  libblkid                   x86_64    2.23.2-59.el7_6.1        updates    181 k
    k8s-worker-lx01:  libgcc                     x86_64    4.8.5-36.el7_6.2         updates    102 k
    k8s-worker-lx01:  libgomp                    x86_64    4.8.5-36.el7_6.2         updates    158 k
    k8s-worker-lx01:  libmount                   x86_64    2.23.2-59.el7_6.1        updates    182 k
    k8s-worker-lx01:  libsmartcols               x86_64    2.23.2-59.el7_6.1        updates    140 k
    k8s-worker-lx01:  libssh2                    x86_64    1.4.3-12.el7_6.2         updates    135 k
    k8s-worker-lx01:  libstdc++                  x86_64    4.8.5-36.el7_6.2         updates    305 k
    k8s-worker-lx01:  libuuid                    x86_64    2.23.2-59.el7_6.1        updates     82 k
    k8s-worker-lx01:  nss-pem                    x86_64    1.0.3-5.el7_6.1          updates     74 k
    k8s-worker-lx01:  openssl                    x86_64    1:1.0.2k-16.el7_6.1      updates    493 k
    k8s-worker-lx01:  openssl-libs               x86_64    1:1.0.2k-16.el7_6.1      updates    1.2 M
    k8s-worker-lx01:  polkit                     x86_64    0.112-18.el7_6.1         updates    168 k
    k8s-worker-lx01:  python                     x86_64    2.7.5-77.el7_6           updates     94 k
    k8s-worker-lx01:  python-libs                x86_64    2.7.5-77.el7_6           updates    5.6 M
    k8s-worker-lx01:  python-perf                x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-worker-lx01:  rsync                      x86_64    3.1.2-6.el7_6.1          updates    404 k
    k8s-worker-lx01:  selinux-policy             noarch    3.13.1-229.el7_6.12      updates    484 k
    k8s-worker-lx01:  selinux-policy-targeted    noarch    3.13.1-229.el7_6.12      updates    6.9 M
    k8s-worker-lx01:  shadow-utils               x86_64    2:4.1.5.1-25.el7_6.1     updates    1.1 M
    k8s-worker-lx01:  systemd                    x86_64    219-62.el7_6.6           updates    5.1 M
    k8s-worker-lx01:  systemd-libs               x86_64    219-62.el7_6.6           updates    407 k
    k8s-worker-lx01:  systemd-sysv               x86_64    219-62.el7_6.6           updates     84 k
    k8s-worker-lx01:  tuned                      noarch    2.10.0-6.el7_6.3         updates    254 k
    k8s-worker-lx01:  tzdata                     noarch    2019a-1.el7              updates    494 k
    k8s-worker-lx01:  util-linux                 x86_64    2.23.2-59.el7_6.1        updates    2.0 M
    k8s-worker-lx01:  xfsprogs                   x86_64    4.5.0-19.el7_6           updates    897 k
    k8s-worker-lx01: 
    k8s-worker-lx01: Transaction Summary
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Install   1 Package
    k8s-worker-lx01: Upgrade  39 Packages
    k8s-worker-lx01: Total download size: 117 M
    k8s-worker-lx01: Downloading packages:
    k8s-worker-lx01: Delta RPMs reduced 26 M of updates to 7.5 M (70% saved)
    k8s-worker-lx01: /usr/share/locale/ar/LC_MESSAGES/NetworkManager.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: Public key for NetworkManager-1.12.0-10.el7_6.x86_64.rpm is not installed
    k8s-worker-lx01: warning: /var/cache/yum/x86_64/7/updates/packages/NetworkManager-1.12.0-10.el7_6.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    k8s-worker-lx01: /usr/share/locale/ja/LC_MESSAGES/shadow.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: Finishing delta rebuilds of 10 package(s) (17 M)
    k8s-worker-lx01: /usr/share/locale/cs/LC_MESSAGES/polkit-1.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: /usr/share/locale/da/LC_MESSAGES/util-linux.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: /usr/share/locale/de/LC_MESSAGES/xfsprogs.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: /usr/share/locale/de/LC_MESSAGES/systemd.mo: No such file or directory
    k8s-worker-lx01: cannot reconstruct rpm from disk files
    k8s-worker-lx01: Some delta RPMs failed to download or rebuild. Retrying..
    k8s-worker-lx01: Public key for polkit-0.112-18.el7_6.1.x86_64.rpm is not installed
    k8s-worker-lx01: --------------------------------------------------------------------------------
    k8s-worker-lx01: Total                                              3.6 MB/s | 109 MB  00:30     
    k8s-worker-lx01: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-worker-lx01: Importing GPG key 0xF4A80EB5:
    k8s-worker-lx01:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    k8s-worker-lx01:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    k8s-worker-lx01:  Package    : centos-release-7-6.1810.2.el7.centos.x86_64 (@anaconda)
    k8s-worker-lx01:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-worker-lx01: Running transaction check
    k8s-worker-lx01: Running transaction test
    k8s-worker-lx01: Transaction test succeeded
    k8s-worker-lx01: Running transaction
    k8s-worker-lx01:   Updating   : libgcc-4.8.5-36.el7_6.2.x86_64                              1/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : selinux-policy-3.13.1-229.el7_6.12.noarch                   2/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : tzdata-2019a-1.el7.noarch                                   3/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : glibc-2.17-260.el7_6.4.x86_64                               4/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : glibc-common-2.17-260.el7_6.4.x86_64                        5/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : systemd-libs-219-62.el7_6.6.x86_64                          6/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libuuid-2.23.2-59.el7_6.1.x86_64                            7/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libblkid-2.23.2-59.el7_6.1.x86_64                           8/79


    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                    9/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    10/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : python-libs-2.7.5-77.el7_6.x86_64                          11/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : python-2.7.5-77.el7_6.x86_64                               12/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libmount-2.23.2-59.el7_6.1.x86_64                          13/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              14/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : python-perf-3.10.0-957.12.1.el7.x86_64                     15/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        16/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : systemd-219-62.el7_6.6.x86_64                              17/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:dbus-1.10.24-13.el7_6.x86_64                             18/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : polkit-0.112-18.el7_6.1.x86_64                             19/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    20/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libsmartcols-2.23.2-59.el7_6.1.x86_64                      21/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : util-linux-2.23.2-59.el7_6.1.x86_64                        22/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            23/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 24/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               25/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : kernel-tools-3.10.0-957.12.1.el7.x86_64                    26/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : tuned-2.10.0-6.el7_6.3.noarch                              27/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                28/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               29/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : systemd-sysv-219-62.el7_6.6.x86_64                         30/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : rsync-3.1.2-6.el7_6.1.x86_64                               31/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libssh2-1.4.3-12.el7_6.2.x86_64                            32/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         33/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : xfsprogs-4.5.0-19.el7_6.x86_64                             34/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libstdc++-4.8.5-36.el7_6.2.x86_64                          35/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : nss-pem-1.0.3-5.el7_6.1.x86_64                             36/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : libgomp-4.8.5-36.el7_6.2.x86_64                            37/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : iproute-4.11.0-14.el7_6.2.x86_64                           38/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Updating   : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         39/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : kernel-3.10.0-957.12.1.el7.x86_64                          40/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : tuned-2.10.0-6.el7.noarch                                  41/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : systemd-sysv-219-62.el7_6.5.x86_64                         42/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 43/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 44/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            45/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : util-linux-2.23.2-59.el7.x86_64                            46/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : xfsprogs-4.5.0-18.el7.x86_64                               47/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:openssl-1.0.2k-16.el7.x86_64                             48/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : python-perf-3.10.0-957.5.1.el7.x86_64                      49/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : python-2.7.5-76.el7.x86_64                                 50/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : python-libs-2.7.5-76.el7.x86_64                            51/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : kernel-tools-3.10.0-957.5.1.el7.x86_64                     52/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                53/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     54/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : polkit-0.112-18.el7.x86_64                                 55/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               56/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libstdc++-4.8.5-36.el7.x86_64                              57/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libssh2-1.4.3-12.el7.x86_64                                58/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : rsync-3.1.2-4.el7.x86_64                                   59/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          60/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:dbus-1.10.24-12.el7.x86_64                               61/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : systemd-219-62.el7_6.5.x86_64                              62/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libmount-2.23.2-59.el7.x86_64                              63/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libblkid-2.23.2-59.el7.x86_64                              64/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:dbus-libs-1.10.24-12.el7.x86_64                          65/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : systemd-libs-219-62.el7_6.5.x86_64                         66/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libuuid-2.23.2-59.el7.x86_64                               67/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       68/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : 1:openssl-libs-1.0.2k-16.el7.x86_64                        69/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                70/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libsmartcols-2.23.2-59.el7.x86_64                          71/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : iproute-4.11.0-14.el7.x86_64                               72/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libgomp-4.8.5-36.el7.x86_64                                73/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : nss-pem-1.0.3-5.el7.x86_64                                 74/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : selinux-policy-3.13.1-229.el7_6.9.noarch                   75/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : glibc-common-2.17-260.el7_6.3.x86_64                       76/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : glibc-2.17-260.el7_6.3.x86_64                              77/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : tzdata-2018i-1.el7.noarch                                  78/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Cleanup    : libgcc-4.8.5-36.el7.x86_64                                 79/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libsmartcols-2.23.2-59.el7_6.1.x86_64                       1/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-sysv-219-62.el7_6.6.x86_64                          2/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libssh2-1.4.3-12.el7_6.2.x86_64                             3/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : glibc-common-2.17-260.el7_6.4.x86_64                        4/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libblkid-2.23.2-59.el7_6.1.x86_64                           5/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : util-linux-2.23.2-59.el7_6.1.x86_64                         6/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : rsync-3.1.2-6.el7_6.1.x86_64                                7/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libmount-2.23.2-59.el7_6.1.x86_64                           8/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libstdc++-4.8.5-36.el7_6.2.x86_64                           9/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                   10/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : nss-pem-1.0.3-5.el7_6.1.x86_64                             11/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libgcc-4.8.5-36.el7_6.2.x86_64                             12/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libgomp-4.8.5-36.el7_6.2.x86_64                            13/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         14/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : tzdata-2019a-1.el7.noarch                                  15/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : iproute-4.11.0-14.el7_6.2.x86_64                           16/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         17/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-perf-3.10.0-957.12.1.el7.x86_64                     18/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                19/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : polkit-0.112-18.el7_6.1.x86_64                             20/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        21/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            22/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    23/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kernel-3.10.0-957.12.1.el7.x86_64                          24/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    25/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-2.7.5-77.el7_6.x86_64                               26/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-219-62.el7_6.6.x86_64                              27/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                             28/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              29/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : selinux-policy-3.13.1-229.el7_6.12.noarch                  30/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libuuid-2.23.2-59.el7_6.1.x86_64                           31/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : xfsprogs-4.5.0-19.el7_6.x86_64                             32/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               33/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : glibc-2.17-260.el7_6.4.x86_64                              34/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-libs-219-62.el7_6.6.x86_64                         35/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               36/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kernel-tools-3.10.0-957.12.1.el7.x86_64                    37/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-libs-2.7.5-77.el7_6.x86_64                          38/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : tuned-2.10.0-6.el7_6.3.noarch                              39/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 40/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-2.7.5-76.el7.x86_64                                 41/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-perf-3.10.0-957.5.1.el7.x86_64                      42/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               43/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libblkid-2.23.2-59.el7.x86_64                              44/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kernel-tools-3.10.0-957.5.1.el7.x86_64                     45/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-219-62.el7_6.5.x86_64                              46/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libgcc-4.8.5-36.el7.x86_64                                 47/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : iproute-4.11.0-14.el7.x86_64                               48/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libstdc++-4.8.5-36.el7.x86_64                              49/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:openssl-libs-1.0.2k-16.el7.x86_64                        50/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : glibc-2.17-260.el7_6.3.x86_64                              51/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            52/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : xfsprogs-4.5.0-18.el7.x86_64                               53/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libuuid-2.23.2-59.el7.x86_64                               54/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : nss-pem-1.0.3-5.el7.x86_64                                 55/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libssh2-1.4.3-12.el7.x86_64                                56/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:openssl-1.0.2k-16.el7.x86_64                             57/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-libs-219-62.el7_6.5.x86_64                         58/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:dbus-1.10.24-12.el7.x86_64                               59/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : rsync-3.1.2-4.el7.x86_64                                   60/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 61/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                62/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       63/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libgomp-4.8.5-36.el7.x86_64                                64/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     65/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : selinux-policy-3.13.1-229.el7_6.9.noarch                   66/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          67/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:dbus-libs-1.10.24-12.el7.x86_64                          68/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : systemd-sysv-219-62.el7_6.5.x86_64                         69/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libmount-2.23.2-59.el7.x86_64                              70/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : util-linux-2.23.2-59.el7.x86_64                            71/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libsmartcols-2.23.2-59.el7.x86_64                          72/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-libs-2.7.5-76.el7.x86_64                            73/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : polkit-0.112-18.el7.x86_64                                 74/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : tzdata-2018i-1.el7.noarch                                  75/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                76/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : glibc-common-2.17-260.el7_6.3.x86_64                       77/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 78/79
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : tuned-2.10.0-6.el7.noarch                                  79/79
    k8s-worker-lx01:  
    k8s-worker-lx01: 
    k8s-worker-lx01: Installed:
    k8s-worker-lx01:   kernel.x86_64 0:3.10.0-957.12.1.el7                                           
    k8s-worker-lx01: 
    k8s-worker-lx01: Updated:
    k8s-worker-lx01:   NetworkManager.x86_64 1:1.12.0-10.el7_6                                       
    k8s-worker-lx01:   NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6                                 
    k8s-worker-lx01:   NetworkManager-team.x86_64 1:1.12.0-10.el7_6                                  
    k8s-worker-lx01:   NetworkManager-tui.x86_64 1:1.12.0-10.el7_6                                   
    k8s-worker-lx01:   dbus.x86_64 1:1.10.24-13.el7_6                                                
    k8s-worker-lx01:   dbus-libs.x86_64 1:1.10.24-13.el7_6                                           
    k8s-worker-lx01:   device-mapper.x86_64 7:1.02.149-10.el7_6.7                                    
    k8s-worker-lx01:   device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7                               
    k8s-worker-lx01:   glibc.x86_64 0:2.17-260.el7_6.4                                               
    k8s-worker-lx01:   glibc-common.x86_64 0:2.17-260.el7_6.4                                        
    k8s-worker-lx01:   iproute.x86_64 0:4.11.0-14.el7_6.2                                            
    k8s-worker-lx01:   kernel-tools.x86_64 0:3.10.0-957.12.1.el7                                     
    k8s-worker-lx01:   kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7                                
    k8s-worker-lx01:   libblkid.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-worker-lx01:   libgcc.x86_64 0:4.8.5-36.el7_6.2                                              
    k8s-worker-lx01:   libgomp.x86_64 0:4.8.5-36.el7_6.2                                             
    k8s-worker-lx01:   libmount.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-worker-lx01:   libsmartcols.x86_64 0:2.23.2-59.el7_6.1                                       
    k8s-worker-lx01:   libssh2.x86_64 0:1.4.3-12.el7_6.2                                             
    k8s-worker-lx01:   libstdc++.x86_64 0:4.8.5-36.el7_6.2                                           
    k8s-worker-lx01:   libuuid.x86_64 0:2.23.2-59.el7_6.1                                            
    k8s-worker-lx01:   nss-pem.x86_64 0:1.0.3-5.el7_6.1                                              
    k8s-worker-lx01:   openssl.x86_64 1:1.0.2k-16.el7_6.1                                            
    k8s-worker-lx01:   openssl-libs.x86_64 1:1.0.2k-16.el7_6.1                                       
    k8s-worker-lx01:   polkit.x86_64 0:0.112-18.el7_6.1                                              
    k8s-worker-lx01:   python.x86_64 0:2.7.5-77.el7_6                                                
    k8s-worker-lx01:   python-libs.x86_64 0:2.7.5-77.el7_6                                           
    k8s-worker-lx01:   python-perf.x86_64 0:3.10.0-957.12.1.el7                                      
    k8s-worker-lx01:   rsync.x86_64 0:3.1.2-6.el7_6.1                                                
    k8s-worker-lx01:   selinux-policy.noarch 0:3.13.1-229.el7_6.12                                   
    k8s-worker-lx01:   selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12                          
    k8s-worker-lx01:   shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1                                      
    k8s-worker-lx01:   systemd.x86_64 0:219-62.el7_6.6                                               
    k8s-worker-lx01:   systemd-libs.x86_64 0:219-62.el7_6.6                                          
    k8s-worker-lx01:   systemd-sysv.x86_64 0:219-62.el7_6.6                                          
    k8s-worker-lx01:   tuned.noarch 0:2.10.0-6.el7_6.3                                               
    k8s-worker-lx01:   tzdata.noarch 0:2019a-1.el7                                                   
    k8s-worker-lx01:   util-linux.x86_64 0:2.23.2-59.el7_6.1                                         
    k8s-worker-lx01:   xfsprogs.x86_64 0:4.5.0-19.el7_6                                              
    k8s-worker-lx01: Complete!
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Loaded plugins: fastestmirror
    k8s-worker-lx01: Loading mirror speeds from cached hostfile
    k8s-worker-lx01:  * base: ftp.iitm.ac.in
    k8s-worker-lx01:  * extras: centos.myfahim.com
    k8s-worker-lx01:  * updates: centos.myfahim.com
    k8s-worker-lx01: Resolving Dependencies
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package bind-utils.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-worker-lx01: --> Processing Dependency: bind-libs = 32:9.9.4-73.el7_6 for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: liblwres.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: libisccfg.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: libisccc.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: libisc.so.95()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: libdns.so.100()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: --> Processing Dependency: libbind9.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx01: ---> Package docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx01: --> Processing Dependency: docker-common = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: docker-client = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: subscription-manager-rhsm-certificates for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: ---> Package epel-release.noarch 0:7-11 will be installed
    k8s-worker-lx01: ---> Package net-tools.x86_64 0:2.0-0.24.20131004git.el7 will be installed
    k8s-worker-lx01: ---> Package ntp.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-worker-lx01: --> Processing Dependency: ntpdate = 4.2.6p5-28.el7.centos for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed
    k8s-worker-lx01: ---> Package bind-libs.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-worker-lx01: ---> Package docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx01: ---> Package docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx01: --> Processing Dependency: skopeo-containers >= 1:0.1.26-2 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: oci-umount >= 2:2.3.3-3 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: oci-systemd-hook >= 1:0.1.4-9 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: oci-register-machine >= 1:0-5.13 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: lvm2 >= 2.02.112 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: container-storage-setup >= 0.9.0-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: container-selinux >= 2:2.51-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: atomic-registries for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx01: ---> Package ntpdate.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-worker-lx01: ---> Package subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos will be installed
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos will be installed
    k8s-worker-lx01: --> Processing Dependency: python-yaml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: python-setuptools for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx01: --> Processing Dependency: python-pytoml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx01: ---> Package container-selinux.noarch 2:2.95-2.el7_6 will be installed
    k8s-worker-lx01: --> Processing Dependency: policycoreutils-python for package: 2:container-selinux-2.95-2.el7_6.noarch
    k8s-worker-lx01: ---> Package container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7 will be installed
    k8s-worker-lx01: ---> Package containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos will be installed
    k8s-worker-lx01: ---> Package lvm2.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-worker-lx01: --> Processing Dependency: lvm2-libs = 7:2.02.180-10.el7_6.7 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: device-mapper-persistent-data >= 0.7.0-0.1.rc6 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: liblvm2app.so.2.2(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libdevmapper-event.so.1.02(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libaio.so.1(LIBAIO_0.4)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libaio.so.1(LIBAIO_0.1)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: liblvm2app.so.2.2()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libdevmapper-event.so.1.02()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libaio.so.1()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: ---> Package oci-register-machine.x86_64 1:0-6.git2b44233.el7 will be installed
    k8s-worker-lx01: ---> Package oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6 will be installed
    k8s-worker-lx01: --> Processing Dependency: libyajl.so.2()(64bit) for package: 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64
    k8s-worker-lx01: ---> Package oci-umount.x86_64 2:2.3.4-2.git87f9237.el7 will be installed
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package PyYAML.x86_64 0:3.10-11.el7 will be installed
    k8s-worker-lx01: --> Processing Dependency: libyaml-0.so.2()(64bit) for package: PyYAML-3.10-11.el7.x86_64
    k8s-worker-lx01: ---> Package device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-worker-lx01: ---> Package device-mapper-persistent-data.x86_64 0:0.7.3-3.el7 will be installed
    k8s-worker-lx01: ---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed
    k8s-worker-lx01: ---> Package lvm2-libs.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-worker-lx01: --> Processing Dependency: device-mapper-event = 7:1.02.149-10.el7_6.7 for package: 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx01: ---> Package policycoreutils-python.x86_64 0:2.5-29.el7_6.1 will be installed
    k8s-worker-lx01: --> Processing Dependency: setools-libs >= 3.3.8-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libsemanage-python >= 2.5-14 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: audit-libs-python >= 2.1.3-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: python-IPy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libqpol.so.1(VERS_1.4)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libqpol.so.1(VERS_1.2)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libcgroup for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libapol.so.4(VERS_4.0)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: checkpolicy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libqpol.so.1()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: --> Processing Dependency: libapol.so.4()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx01: ---> Package python-pytoml.noarch 0:0.1.14-1.git7dea353.el7 will be installed
    k8s-worker-lx01: ---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed
    k8s-worker-lx01: --> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch
    k8s-worker-lx01: ---> Package yajl.x86_64 0:2.0.4-4.el7 will be installed
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package audit-libs-python.x86_64 0:2.8.4-4.el7 will be installed
    k8s-worker-lx01: ---> Package checkpolicy.x86_64 0:2.5-8.el7 will be installed
    k8s-worker-lx01: ---> Package device-mapper-event.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-worker-lx01: ---> Package libcgroup.x86_64 0:0.41-20.el7 will be installed
    k8s-worker-lx01: ---> Package libsemanage-python.x86_64 0:2.5-14.el7 will be installed
    k8s-worker-lx01: ---> Package libyaml.x86_64 0:0.1.4-11.el7_0 will be installed
    k8s-worker-lx01: ---> Package python-IPy.noarch 0:0.75-6.el7 will be installed
    k8s-worker-lx01: ---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed
    k8s-worker-lx01: --> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-worker-lx01: --> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-worker-lx01: ---> Package setools-libs.x86_64 0:3.3.8-4.el7 will be installed
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
    k8s-worker-lx01: ---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed
    k8s-worker-lx01: --> Finished Dependency Resolution
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependencies Resolved
    k8s-worker-lx01: 
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01:  Package                 Arch   Version                           Repository
    k8s-worker-lx01:                                                                            Size
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Installing:
    k8s-worker-lx01:  bind-utils              x86_64 32:9.9.4-73.el7_6                 updates 206 k
    k8s-worker-lx01:  docker                  x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   18 M
    k8s-worker-lx01:  epel-release            noarch 7-11                              extras   15 k
    k8s-worker-lx01:  net-tools               x86_64 2.0-0.24.20131004git.el7          base    306 k
    k8s-worker-lx01:  ntp                     x86_64 4.2.6p5-28.el7.centos             base    549 k
    k8s-worker-lx01: Installing for dependencies:
    k8s-worker-lx01:  PyYAML                  x86_64 3.10-11.el7                       base    153 k
    k8s-worker-lx01:  atomic-registries       x86_64 1:1.22.1-26.gitb507039.el7.centos extras   35 k
    k8s-worker-lx01:  audit-libs-python       x86_64 2.8.4-4.el7                       base     76 k
    k8s-worker-lx01:  autogen-libopts         x86_64 5.18-5.el7                        base     66 k
    k8s-worker-lx01:  bind-libs               x86_64 32:9.9.4-73.el7_6                 updates 1.0 M
    k8s-worker-lx01:  checkpolicy             x86_64 2.5-8.el7                         base    295 k
    k8s-worker-lx01:  container-selinux       noarch 2:2.95-2.el7_6                    extras   39 k
    k8s-worker-lx01:  container-storage-setup noarch 0.11.0-2.git5eaf76c.el7           extras   35 k
    k8s-worker-lx01:  containers-common       x86_64 1:0.1.35-2.git404c5bd.el7.centos  extras   21 k
    k8s-worker-lx01:  device-mapper-event     x86_64 7:1.02.149-10.el7_6.7             updates 189 k
    k8s-worker-lx01:  device-mapper-event-libs
    k8s-worker-lx01:                          x86_64 7:1.02.149-10.el7_6.7             updates 188 k
    k8s-worker-lx01:  device-mapper-persistent-data
    k8s-worker-lx01:                          x86_64 0.7.3-3.el7                       base    405 k
    k8s-worker-lx01:  docker-client           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras  3.9 M
    k8s-worker-lx01:  docker-common           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   96 k
    k8s-worker-lx01:  libaio                  x86_64 0.3.109-13.el7                    base     24 k
    k8s-worker-lx01:  libcgroup               x86_64 0.41-20.el7                       base     66 k
    k8s-worker-lx01:  libsemanage-python      x86_64 2.5-14.el7                        base    113 k
    k8s-worker-lx01:  libyaml                 x86_64 0.1.4-11.el7_0                    base     55 k
    k8s-worker-lx01:  lvm2                    x86_64 7:2.02.180-10.el7_6.7             updates 1.3 M
    k8s-worker-lx01:  lvm2-libs               x86_64 7:2.02.180-10.el7_6.7             updates 1.1 M
    k8s-worker-lx01:  ntpdate                 x86_64 4.2.6p5-28.el7.centos             base     86 k
    k8s-worker-lx01:  oci-register-machine    x86_64 1:0-6.git2b44233.el7              extras  1.1 M
    k8s-worker-lx01:  oci-systemd-hook        x86_64 1:0.1.18-3.git8787307.el7_6       extras   34 k
    k8s-worker-lx01:  oci-umount              x86_64 2:2.3.4-2.git87f9237.el7          extras   32 k
    k8s-worker-lx01:  policycoreutils-python  x86_64 2.5-29.el7_6.1                    updates 456 k
    k8s-worker-lx01:  python-IPy              noarch 0.75-6.el7                        base     32 k
    k8s-worker-lx01:  python-backports        x86_64 1.0-8.el7                         base    5.8 k
    k8s-worker-lx01:  python-backports-ssl_match_hostname
    k8s-worker-lx01:                          noarch 3.5.0.1-1.el7                     base     13 k
    k8s-worker-lx01:  python-ipaddress        noarch 1.0.16-2.el7                      base     34 k
    k8s-worker-lx01:  python-pytoml           noarch 0.1.14-1.git7dea353.el7           extras   18 k
    k8s-worker-lx01:  python-setuptools       noarch 0.9.8-7.el7                       base    397 k
    k8s-worker-lx01:  setools-libs            x86_64 3.3.8-4.el7                       base    620 k
    k8s-worker-lx01:  subscription-manager-rhsm-certificates
    k8s-worker-lx01:                          x86_64 1.21.10-3.el7.centos              updates 207 k
    k8s-worker-lx01:  yajl                    x86_64 2.0.4-4.el7                       base     39 k
    k8s-worker-lx01: 
    k8s-worker-lx01: Transaction Summary
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Install  5 Packages (+34 Dependent packages)
    k8s-worker-lx01: Total download size: 31 M
    k8s-worker-lx01: Installed size: 103 M
    k8s-worker-lx01: Downloading packages:
    k8s-worker-lx01: --------------------------------------------------------------------------------
    k8s-worker-lx01: Total                                              5.1 MB/s |  31 MB  00:06     
    k8s-worker-lx01: Running transaction check
    k8s-worker-lx01: Running transaction test
    k8s-worker-lx01: Transaction test succeeded
    k8s-worker-lx01: Running transaction
    k8s-worker-lx01:   Installing : libaio-0.3.109-13.el7.x86_64                                1/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64       2/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : yajl-2.0.4-4.el7.x86_64                                     3/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                  4/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64         5/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            6/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                      7/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : device-mapper-persistent-data-0.7.3-3.el7.x86_64            8/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           9/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch     10/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-ipaddress-1.0.16-2.el7.noarch                       11/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 32:bind-libs-9.9.4-73.el7_6.x86_64                         12/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libyaml-0.1.4-11.el7_0.x86_64                              13/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : PyYAML-3.10-11.el7.x86_64                                  14/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : audit-libs-python-2.8.4-4.el7.x86_64                       15/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   16/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           17/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-backports-1.0-8.el7.x86_64                          18/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch   19/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-setuptools-0.9.8-7.el7.noarch                       20/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libsemanage-python-2.5-14.el7.x86_64                       21/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : ntpdate-4.2.6p5-28.el7.centos.x86_64                       22/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : setools-libs-3.3.8-4.el7.x86_64                            23/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-pytoml-0.1.14-1.git7dea353.el7.noarch               24/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   25/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : python-IPy-0.75-6.el7.noarch                               26/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : checkpolicy-2.5-8.el7.x86_64                               27/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   28/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : autogen-libopts-5.18-5.el7.x86_64                          29/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libcgroup-0.41-20.el7.x86_64                               30/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : policycoreutils-python-2.5-29.el7_6.1.x86_64               31/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 2:container-selinux-2.95-2.el7_6.noarch                    32/39

    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     33/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64     34/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            35/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : ntp-4.2.6p5-28.el7.centos.x86_64                           36/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : 32:bind-utils-9.9.4-73.el7_6.x86_64                        37/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : epel-release-7-11.noarch                                   38/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : net-tools-2.0-0.24.20131004git.el7.x86_64                  39/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : device-mapper-persistent-data-0.7.3-3.el7.x86_64            1/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libcgroup-0.41-20.el7.x86_64                                2/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch    3/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64      4/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            5/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : autogen-libopts-5.18-5.el7.x86_64                           6/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch      7/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           8/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-setuptools-0.9.8-7.el7.noarch                        9/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   10/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : net-tools-2.0-0.24.20131004git.el7.x86_64                  11/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:container-selinux-2.95-2.el7_6.noarch                    12/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                 13/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : checkpolicy-2.5-8.el7.x86_64                               14/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : epel-release-7-11.noarch                                   15/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : ntp-4.2.6p5-28.el7.centos.x86_64                           16/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64      17/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-IPy-0.75-6.el7.noarch                               18/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     19/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-pytoml-0.1.14-1.git7dea353.el7.noarch               20/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64        21/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : setools-libs-3.3.8-4.el7.x86_64                            22/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            23/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : ntpdate-4.2.6p5-28.el7.centos.x86_64                       24/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libsemanage-python-2.5-14.el7.x86_64                       25/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-backports-1.0-8.el7.x86_64                          26/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           27/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 32:bind-utils-9.9.4-73.el7_6.x86_64                        28/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   29/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : yajl-2.0.4-4.el7.x86_64                                    30/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   31/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : audit-libs-python-2.8.4-4.el7.x86_64                       32/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libyaml-0.1.4-11.el7_0.x86_64                              33/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libaio-0.3.109-13.el7.x86_64                               34/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 32:bind-libs-9.9.4-73.el7_6.x86_64                         35/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : python-ipaddress-1.0.16-2.el7.noarch                       36/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : policycoreutils-python-2.5-29.el7_6.1.x86_64               37/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : PyYAML-3.10-11.el7.x86_64                                  38/39
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                     39/39
    k8s-worker-lx01:  
    k8s-worker-lx01: 
    k8s-worker-lx01: Installed:
    k8s-worker-lx01:   bind-utils.x86_64 32:9.9.4-73.el7_6                                           
    k8s-worker-lx01:   docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                               
    k8s-worker-lx01:   epel-release.noarch 0:7-11                                                    
    k8s-worker-lx01:   net-tools.x86_64 0:2.0-0.24.20131004git.el7                                   
    k8s-worker-lx01:   ntp.x86_64 0:4.2.6p5-28.el7.centos                                            
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependency Installed:
    k8s-worker-lx01:   PyYAML.x86_64 0:3.10-11.el7                                                   
    k8s-worker-lx01:   atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos                    
    k8s-worker-lx01:   audit-libs-python.x86_64 0:2.8.4-4.el7                                        
    k8s-worker-lx01:   autogen-libopts.x86_64 0:5.18-5.el7                                           
    k8s-worker-lx01:   bind-libs.x86_64 32:9.9.4-73.el7_6                                            
    k8s-worker-lx01:   checkpolicy.x86_64 0:2.5-8.el7                                                
    k8s-worker-lx01:   container-selinux.noarch 2:2.95-2.el7_6                                       
    k8s-worker-lx01:   container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7                      
    k8s-worker-lx01:   containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos                     
    k8s-worker-lx01:   device-mapper-event.x86_64 7:1.02.149-10.el7_6.7                              
    k8s-worker-lx01:   device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7                         
    k8s-worker-lx01:   device-mapper-persistent-data.x86_64 0:0.7.3-3.el7                            
    k8s-worker-lx01:   docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-worker-lx01:   docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-worker-lx01:   libaio.x86_64 0:0.3.109-13.el7                                                
    k8s-worker-lx01:   libcgroup.x86_64 0:0.41-20.el7                                                
    k8s-worker-lx01:   libsemanage-python.x86_64 0:2.5-14.el7                                        
    k8s-worker-lx01:   libyaml.x86_64 0:0.1.4-11.el7_0                                               
    k8s-worker-lx01:   lvm2.x86_64 7:2.02.180-10.el7_6.7                                             
    k8s-worker-lx01:   lvm2-libs.x86_64 7:2.02.180-10.el7_6.7                                        
    k8s-worker-lx01:   ntpdate.x86_64 0:4.2.6p5-28.el7.centos                                        
    k8s-worker-lx01:   oci-register-machine.x86_64 1:0-6.git2b44233.el7                              
    k8s-worker-lx01:   oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6                           
    k8s-worker-lx01:   oci-umount.x86_64 2:2.3.4-2.git87f9237.el7                                    
    k8s-worker-lx01:   policycoreutils-python.x86_64 0:2.5-29.el7_6.1                                
    k8s-worker-lx01:   python-IPy.noarch 0:0.75-6.el7                                                
    k8s-worker-lx01:   python-backports.x86_64 0:1.0-8.el7                                           
    k8s-worker-lx01:   python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    
    k8s-worker-lx01:   python-ipaddress.noarch 0:1.0.16-2.el7                                        
    k8s-worker-lx01:   python-pytoml.noarch 0:0.1.14-1.git7dea353.el7                                
    k8s-worker-lx01:   python-setuptools.noarch 0:0.9.8-7.el7                                        
    k8s-worker-lx01:   setools-libs.x86_64 0:3.3.8-4.el7                                             
    k8s-worker-lx01:   subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos          
    k8s-worker-lx01:   yajl.x86_64 0:2.0.4-4.el7                                                     
    k8s-worker-lx01: Complete!
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/ntpd.service to /usr/lib/systemd/system/ntpd.service.
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: * Applying /usr/lib/sysctl.d/00-system.conf ...
    k8s-worker-lx01: net.bridge.bridge-nf-call-ip6tables = 0
    k8s-worker-lx01: net.bridge.bridge-nf-call-iptables = 0
    k8s-worker-lx01: net.bridge.bridge-nf-call-arptables = 0
    k8s-worker-lx01: * Applying /usr/lib/sysctl.d/10-default-yama-scope.conf ...
    k8s-worker-lx01: kernel.yama.ptrace_scope = 0
    k8s-worker-lx01: * Applying /usr/lib/sysctl.d/50-default.conf ...
    k8s-worker-lx01: kernel.sysrq = 16
    k8s-worker-lx01: kernel.core_uses_pid = 1
    k8s-worker-lx01: net.ipv4.conf.default.rp_filter = 1
    k8s-worker-lx01: net.ipv4.conf.all.rp_filter = 1
    k8s-worker-lx01: net.ipv4.conf.default.accept_source_route = 0
    k8s-worker-lx01: net.ipv4.conf.all.accept_source_route = 0
    k8s-worker-lx01: net.ipv4.conf.default.promote_secondaries = 1
    k8s-worker-lx01: net.ipv4.conf.all.promote_secondaries = 1
    k8s-worker-lx01: fs.protected_hardlinks = 1
    k8s-worker-lx01: fs.protected_symlinks = 1
    k8s-worker-lx01: * Applying /usr/lib/sysctl.d/99-docker.conf ...
    k8s-worker-lx01: fs.may_detach_mounts = 1
    k8s-worker-lx01: * Applying /etc/sysctl.d/99-sysctl.conf ...
    k8s-worker-lx01: * Applying /etc/sysctl.d/k8s.conf ...
    k8s-worker-lx01: net.bridge.bridge-nf-call-ip6tables = 1
    k8s-worker-lx01: net.bridge.bridge-nf-call-iptables = 1
    k8s-worker-lx01: * Applying /etc/sysctl.conf ...
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Loaded plugins: fastestmirror
    k8s-worker-lx01: Loading mirror speeds from cached hostfile
    k8s-worker-lx01:  * base: ftp.iitm.ac.in
    k8s-worker-lx01:  * epel: kartolo.sby.datautama.net.id
    k8s-worker-lx01:  * extras: centos.myfahim.com
    k8s-worker-lx01:  * updates: centos.myfahim.com
    k8s-worker-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx01: Importing GPG key 0xA7317B0F:
    k8s-worker-lx01:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-worker-lx01:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-worker-lx01:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx01: Resolving Dependencies
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package kubeadm.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx01: --> Processing Dependency: kubernetes-cni >= 0.7.5 for package: kubeadm-1.14.1-0.x86_64
    k8s-worker-lx01: --> Processing Dependency: cri-tools >= 1.11.0 for package: kubeadm-1.14.1-0.x86_64
    k8s-worker-lx01: ---> Package kubectl.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx01: ---> Package kubelet.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx01: --> Processing Dependency: socat for package: kubelet-1.14.1-0.x86_64
    k8s-worker-lx01: --> Processing Dependency: conntrack for package: kubelet-1.14.1-0.x86_64
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package conntrack-tools.x86_64 0:1.4.4-4.el7 will be installed
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.1)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_cthelper.so.0(LIBNETFILTER_CTHELPER_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_queue.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_cttimeout.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: --> Processing Dependency: libnetfilter_cthelper.so.0()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx01: ---> Package cri-tools.x86_64 0:1.12.0-0 will be installed
    k8s-worker-lx01: ---> Package kubernetes-cni.x86_64 0:0.7.5-0 will be installed
    k8s-worker-lx01: ---> Package socat.x86_64 0:1.7.3.2-2.el7 will be installed
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package libnetfilter_cthelper.x86_64 0:1.0.0-9.el7 will be installed
    k8s-worker-lx01: ---> Package libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7 will be installed
    k8s-worker-lx01: ---> Package libnetfilter_queue.x86_64 0:1.0.2-2.el7_2 will be installed
    k8s-worker-lx01: --> Finished Dependency Resolution
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependencies Resolved
    k8s-worker-lx01: 
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01:  Package                    Arch       Version             Repository      Size
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Installing:
    k8s-worker-lx01:  kubeadm                    x86_64     1.14.1-0            kubernetes     8.7 M
    k8s-worker-lx01:  kubectl                    x86_64     1.14.1-0            kubernetes     9.5 M
    k8s-worker-lx01:  kubelet                    x86_64     1.14.1-0            kubernetes      23 M
    k8s-worker-lx01: Installing for dependencies:
    k8s-worker-lx01:  conntrack-tools            x86_64     1.4.4-4.el7         base           186 k
    k8s-worker-lx01:  cri-tools                  x86_64     1.12.0-0            kubernetes     4.2 M
    k8s-worker-lx01:  kubernetes-cni             x86_64     0.7.5-0             kubernetes      10 M
    k8s-worker-lx01:  libnetfilter_cthelper      x86_64     1.0.0-9.el7         base            18 k
    k8s-worker-lx01:  libnetfilter_cttimeout     x86_64     1.0.0-6.el7         base            18 k
    k8s-worker-lx01:  libnetfilter_queue         x86_64     1.0.2-2.el7_2       base            23 k
    k8s-worker-lx01:  socat                      x86_64     1.7.3.2-2.el7       base           290 k
    k8s-worker-lx01: 
    k8s-worker-lx01: Transaction Summary
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Install  3 Packages (+7 Dependent packages)
    k8s-worker-lx01: Total download size: 56 M
    k8s-worker-lx01: Installed size: 256 M
    k8s-worker-lx01: Downloading packages:
    k8s-worker-lx01: warning: /var/cache/yum/x86_64/7/kubernetes/packages/53edc739a0e51a4c17794de26b13ee5df939bd3161b37f503fe2af8980b41a89-cri-tools-1.12.0-0.x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 3e1ba8d5: NOKEY
    k8s-worker-lx01: Public key for 53edc739a0e51a4c17794de26b13ee5df939bd3161b37f503fe2af8980b41a89-cri-tools-1.12.0-0.x86_64.rpm is not installed
    k8s-worker-lx01: --------------------------------------------------------------------------------
    k8s-worker-lx01: Total                                              1.0 MB/s |  56 MB  00:56     
    k8s-worker-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx01: Importing GPG key 0xA7317B0F:
    k8s-worker-lx01:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-worker-lx01:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-worker-lx01:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx01: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx01: Importing GPG key 0x3E1BA8D5:
    k8s-worker-lx01:  Userid     : "Google Cloud Packages RPM Signing Key <gc-team@google.com>"
    k8s-worker-lx01:  Fingerprint: 3749 e1ba 95a8 6ce0 5454 6ed2 f09c 394c 3e1b a8d5
    k8s-worker-lx01:  From       : https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx01: Running transaction check
    k8s-worker-lx01: Running transaction test
    k8s-worker-lx01: Transaction test succeeded
    k8s-worker-lx01: Running transaction
    k8s-worker-lx01:   Installing : socat-1.7.3.2-2.el7.x86_64                                  1/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     2/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   3/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : kubectl-1.14.1-0.x86_64                                     4/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    5/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : conntrack-tools-1.4.4-4.el7.x86_64                          6/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : kubernetes-cni-0.7.5-0.x86_64                               7/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : kubelet-1.14.1-0.x86_64                                     8/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : cri-tools-1.12.0-0.x86_64                                   9/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Installing : kubeadm-1.14.1-0.x86_64                                    10/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : cri-tools-1.12.0-0.x86_64                                   1/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    2/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kubectl-1.14.1-0.x86_64                                     3/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   4/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     5/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kubeadm-1.14.1-0.x86_64                                     6/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kubelet-1.14.1-0.x86_64                                     7/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : kubernetes-cni-0.7.5-0.x86_64                               8/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : socat-1.7.3.2-2.el7.x86_64                                  9/10
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : conntrack-tools-1.4.4-4.el7.x86_64                         10/10
    k8s-worker-lx01:  
    k8s-worker-lx01: 
    k8s-worker-lx01: Installed:
    k8s-worker-lx01:   kubeadm.x86_64 0:1.14.1-0 kubectl.x86_64 0:1.14.1-0 kubelet.x86_64 0:1.14.1-0
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependency Installed:
    k8s-worker-lx01:   conntrack-tools.x86_64 0:1.4.4-4.el7                                          
    k8s-worker-lx01:   cri-tools.x86_64 0:1.12.0-0                                                   
    k8s-worker-lx01:   kubernetes-cni.x86_64 0:0.7.5-0                                               
    k8s-worker-lx01:   libnetfilter_cthelper.x86_64 0:1.0.0-9.el7                                    
    k8s-worker-lx01:   libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7                                   
    k8s-worker-lx01:   libnetfilter_queue.x86_64 0:1.0.2-2.el7_2                                     
    k8s-worker-lx01:   socat.x86_64 0:1.7.3.2-2.el7                                                  
    k8s-worker-lx01: 
    k8s-worker-lx01: Complete!
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: inline script
    k8s-worker-lx01: Created symlink from /etc/systemd/system/multi-user.target.wants/kubelet.service to /usr/lib/systemd/system/kubelet.service.
==> k8s-worker-lx01: Running provisioner: shell...
    k8s-worker-lx01: Running: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32249-1wxyx61.sh
    k8s-worker-lx01: This is worker
    k8s-worker-lx01: Loaded plugins: fastestmirror
    k8s-worker-lx01: Loading mirror speeds from cached hostfile
    k8s-worker-lx01:  * base: ftp.iitm.ac.in
    k8s-worker-lx01:  * epel: repos.del.extreme-ix.org
    k8s-worker-lx01:  * extras: centos.myfahim.com
    k8s-worker-lx01:  * updates: centos.myfahim.com
    k8s-worker-lx01: Resolving Dependencies
    k8s-worker-lx01: --> Running transaction check
    k8s-worker-lx01: ---> Package sshpass.x86_64 0:1.06-2.el7 will be installed
    k8s-worker-lx01: --> Finished Dependency Resolution
    k8s-worker-lx01: 
    k8s-worker-lx01: Dependencies Resolved
    k8s-worker-lx01: 
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01:  Package           Arch             Version              Repository        Size
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Installing:
    k8s-worker-lx01:  sshpass           x86_64           1.06-2.el7           extras            21 k
    k8s-worker-lx01: 
    k8s-worker-lx01: Transaction Summary
    k8s-worker-lx01: ================================================================================
    k8s-worker-lx01: Install  1 Package
    k8s-worker-lx01: 
    k8s-worker-lx01: Total download size: 21 k
    k8s-worker-lx01: Installed size: 38 k
    k8s-worker-lx01: Downloading packages:
    k8s-worker-lx01: Running transaction check
    k8s-worker-lx01: Running transaction test
    k8s-worker-lx01: Transaction test succeeded
    k8s-worker-lx01: Running transaction
    k8s-worker-lx01:   Installing : sshpass-1.06-2.el7.x86_64                                    1/1
    k8s-worker-lx01:  
    k8s-worker-lx01:   Verifying  : sshpass-1.06-2.el7.x86_64                                    1/1
    k8s-worker-lx01:  
    k8s-worker-lx01: 
    k8s-worker-lx01: Installed:
    k8s-worker-lx01:   sshpass.x86_64 0:1.06-2.el7                                                   
    k8s-worker-lx01: Complete!
    k8s-worker-lx01: Warning: Permanently added '192.168.56.105' (ECDSA) to the list of known hosts.
    k8s-worker-lx01: [preflight] Running pre-flight checks
    k8s-worker-lx01: [preflight] Reading configuration from the cluster...
    k8s-worker-lx01: [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
    k8s-worker-lx01: [kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.14" ConfigMap in the kube-system namespace
    k8s-worker-lx01: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    k8s-worker-lx01: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    k8s-worker-lx01: [kubelet-start] Activating the kubelet service
    k8s-worker-lx01: [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
    k8s-worker-lx01: 
    k8s-worker-lx01: This node has joined the cluster:
    k8s-worker-lx01: * Certificate signing request was sent to apiserver and a response was received.
    k8s-worker-lx01: * The Kubelet was informed of the new secure connection details.
    k8s-worker-lx01: 
    k8s-worker-lx01: Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
==> k8s-worker-lx02: Importing base box 'centos/7'...
==> k8s-worker-lx02: Matching MAC address for NAT networking...
==> k8s-worker-lx02: Checking if box 'centos/7' version '1902.01' is up to date...
==> k8s-worker-lx02: Setting the name of the VM: k8s-worker-lx02
==> k8s-worker-lx02: Fixed port collision for 22 => 2222. Now on port 2201.
==> k8s-worker-lx02: Vagrant has detected a configuration issue which exposes a
==> k8s-worker-lx02: vulnerability with the installed version of VirtualBox. The
==> k8s-worker-lx02: current guest is configured to use an E1000 NIC type for a
==> k8s-worker-lx02: network adapter which is vulnerable in this version of VirtualBox.
==> k8s-worker-lx02: Ensure the guest is trusted to use this configuration or update
==> k8s-worker-lx02: the NIC type using one of the methods below:
==> k8s-worker-lx02: 
==> k8s-worker-lx02:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> k8s-worker-lx02:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> k8s-worker-lx02: Clearing any previously set network interfaces...
==> k8s-worker-lx02: Preparing network interfaces based on configuration...
    k8s-worker-lx02: Adapter 1: nat
    k8s-worker-lx02: Adapter 2: hostonly
==> k8s-worker-lx02: Forwarding ports...
    k8s-worker-lx02: 22 (guest) => 10722 (host) (adapter 1)
    k8s-worker-lx02: 22 (guest) => 2201 (host) (adapter 1)
==> k8s-worker-lx02: Running 'pre-boot' VM customizations...
==> k8s-worker-lx02: Booting VM...
==> k8s-worker-lx02: Waiting for machine to boot. This may take a few minutes...
    k8s-worker-lx02: SSH address: 127.0.0.1:2201
    k8s-worker-lx02: SSH username: vagrant
    k8s-worker-lx02: SSH auth method: private key
    k8s-worker-lx02: 
    k8s-worker-lx02: Vagrant insecure key detected. Vagrant will automatically replace
    k8s-worker-lx02: this with a newly generated keypair for better security.
    k8s-worker-lx02: 
    k8s-worker-lx02: Inserting generated public key within guest...
    k8s-worker-lx02: Removing insecure key from the guest if it's present...
    k8s-worker-lx02: Key inserted! Disconnecting and reconnecting using new SSH key...
==> k8s-worker-lx02: Machine booted and ready!
==> k8s-worker-lx02: Checking for guest additions in VM...
    k8s-worker-lx02: No guest additions were detected on the base box for this VM! Guest
    k8s-worker-lx02: additions are required for forwarded ports, shared folders, host only
    k8s-worker-lx02: networking, and more. If SSH fails on this machine, please install
    k8s-worker-lx02: the guest additions and repackage the box to continue.
    k8s-worker-lx02: 
    k8s-worker-lx02: This is not an error message; everything may continue to work properly,
    k8s-worker-lx02: in which case you may ignore this message.
==> k8s-worker-lx02: Setting hostname...
==> k8s-worker-lx02: Configuring and enabling network interfaces...
==> k8s-worker-lx02: Rsyncing folder: /Users/mukund_bihari/k8s_virtualbox/virtualbox-setup/ => /vagrant
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Loaded plugins: fastestmirror
    k8s-worker-lx02: Determining fastest mirrors
    k8s-worker-lx02:  * base: repos.del.extreme-ix.org
    k8s-worker-lx02:  * extras: repos.del.extreme-ix.org
    k8s-worker-lx02:  * updates: repos.del.extreme-ix.org
    k8s-worker-lx02: Resolving Dependencies
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package NetworkManager.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx02: ---> Package NetworkManager.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx02: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx02: ---> Package NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx02: ---> Package NetworkManager-team.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx02: ---> Package NetworkManager-team.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx02: ---> Package NetworkManager-tui.x86_64 1:1.12.0-8.el7_6 will be updated
    k8s-worker-lx02: ---> Package NetworkManager-tui.x86_64 1:1.12.0-10.el7_6 will be an update
    k8s-worker-lx02: ---> Package dbus.x86_64 1:1.10.24-12.el7 will be updated
    k8s-worker-lx02: ---> Package dbus.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-worker-lx02: ---> Package dbus-libs.x86_64 1:1.10.24-12.el7 will be updated
    k8s-worker-lx02: ---> Package dbus-libs.x86_64 1:1.10.24-13.el7_6 will be an update
    k8s-worker-lx02: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-worker-lx02: ---> Package device-mapper.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-worker-lx02: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.3 will be updated
    k8s-worker-lx02: ---> Package device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7 will be an update
    k8s-worker-lx02: ---> Package glibc.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-worker-lx02: ---> Package glibc.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-worker-lx02: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.3 will be updated
    k8s-worker-lx02: ---> Package glibc-common.x86_64 0:2.17-260.el7_6.4 will be an update
    k8s-worker-lx02: ---> Package iproute.x86_64 0:4.11.0-14.el7 will be updated
    k8s-worker-lx02: ---> Package iproute.x86_64 0:4.11.0-14.el7_6.2 will be an update
    k8s-worker-lx02: ---> Package kernel.x86_64 0:3.10.0-957.12.1.el7 will be installed
    k8s-worker-lx02: ---> Package kernel-tools.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx02: ---> Package kernel-tools.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx02: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx02: ---> Package kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx02: ---> Package libblkid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx02: ---> Package libblkid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package libgcc.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx02: ---> Package libgcc.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx02: ---> Package libgomp.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx02: ---> Package libgomp.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx02: ---> Package libmount.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx02: ---> Package libmount.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx02: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package libssh2.x86_64 0:1.4.3-12.el7 will be updated
    k8s-worker-lx02: ---> Package libssh2.x86_64 0:1.4.3-12.el7_6.2 will be an update
    k8s-worker-lx02: ---> Package libstdc++.x86_64 0:4.8.5-36.el7 will be updated
    k8s-worker-lx02: ---> Package libstdc++.x86_64 0:4.8.5-36.el7_6.2 will be an update
    k8s-worker-lx02: ---> Package libuuid.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx02: ---> Package libuuid.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package nss-pem.x86_64 0:1.0.3-5.el7 will be updated
    k8s-worker-lx02: ---> Package nss-pem.x86_64 0:1.0.3-5.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package openssl.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-worker-lx02: ---> Package openssl.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7 will be updated
    k8s-worker-lx02: ---> Package openssl-libs.x86_64 1:1.0.2k-16.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package polkit.x86_64 0:0.112-18.el7 will be updated
    k8s-worker-lx02: ---> Package polkit.x86_64 0:0.112-18.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package python.x86_64 0:2.7.5-76.el7 will be updated
    k8s-worker-lx02: ---> Package python.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-worker-lx02: ---> Package python-libs.x86_64 0:2.7.5-76.el7 will be updated
    k8s-worker-lx02: ---> Package python-libs.x86_64 0:2.7.5-77.el7_6 will be an update
    k8s-worker-lx02: ---> Package python-perf.x86_64 0:3.10.0-957.5.1.el7 will be updated
    k8s-worker-lx02: ---> Package python-perf.x86_64 0:3.10.0-957.12.1.el7 will be an update
    k8s-worker-lx02: ---> Package rsync.x86_64 0:3.1.2-4.el7 will be updated
    k8s-worker-lx02: ---> Package rsync.x86_64 0:3.1.2-6.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-worker-lx02: ---> Package selinux-policy.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-worker-lx02: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.9 will be updated
    k8s-worker-lx02: ---> Package selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12 will be an update
    k8s-worker-lx02: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7 will be updated
    k8s-worker-lx02: ---> Package shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package systemd.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx02: ---> Package systemd.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx02: ---> Package systemd-libs.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx02: ---> Package systemd-libs.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx02: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.5 will be updated
    k8s-worker-lx02: ---> Package systemd-sysv.x86_64 0:219-62.el7_6.6 will be an update
    k8s-worker-lx02: ---> Package tuned.noarch 0:2.10.0-6.el7 will be updated
    k8s-worker-lx02: ---> Package tuned.noarch 0:2.10.0-6.el7_6.3 will be an update
    k8s-worker-lx02: ---> Package tzdata.noarch 0:2018i-1.el7 will be updated
    k8s-worker-lx02: ---> Package tzdata.noarch 0:2019a-1.el7 will be an update
    k8s-worker-lx02: ---> Package util-linux.x86_64 0:2.23.2-59.el7 will be updated
    k8s-worker-lx02: ---> Package util-linux.x86_64 0:2.23.2-59.el7_6.1 will be an update
    k8s-worker-lx02: ---> Package xfsprogs.x86_64 0:4.5.0-18.el7 will be updated
    k8s-worker-lx02: ---> Package xfsprogs.x86_64 0:4.5.0-19.el7_6 will be an update
    k8s-worker-lx02: --> Finished Dependency Resolution
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependencies Resolved
    k8s-worker-lx02: 
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02:  Package                    Arch      Version                  Repository  Size
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Installing:
    k8s-worker-lx02:  kernel                     x86_64    3.10.0-957.12.1.el7      updates     48 M
    k8s-worker-lx02: Updating:
    k8s-worker-lx02:  NetworkManager             x86_64    1:1.12.0-10.el7_6        updates    1.7 M
    k8s-worker-lx02:  NetworkManager-libnm       x86_64    1:1.12.0-10.el7_6        updates    1.4 M
    k8s-worker-lx02:  NetworkManager-team        x86_64    1:1.12.0-10.el7_6        updates    159 k
    k8s-worker-lx02:  NetworkManager-tui         x86_64    1:1.12.0-10.el7_6        updates    239 k
    k8s-worker-lx02:  dbus                       x86_64    1:1.10.24-13.el7_6       updates    245 k
    k8s-worker-lx02:  dbus-libs                  x86_64    1:1.10.24-13.el7_6       updates    169 k
    k8s-worker-lx02:  device-mapper              x86_64    7:1.02.149-10.el7_6.7    updates    293 k
    k8s-worker-lx02:  device-mapper-libs         x86_64    7:1.02.149-10.el7_6.7    updates    320 k
    k8s-worker-lx02:  glibc                      x86_64    2.17-260.el7_6.4         updates    3.7 M
    k8s-worker-lx02:  glibc-common               x86_64    2.17-260.el7_6.4         updates     12 M
    k8s-worker-lx02:  iproute                    x86_64    4.11.0-14.el7_6.2        updates    764 k
    k8s-worker-lx02:  kernel-tools               x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-worker-lx02:  kernel-tools-libs          x86_64    3.10.0-957.12.1.el7      updates    7.0 M
    k8s-worker-lx02:  libblkid                   x86_64    2.23.2-59.el7_6.1        updates    181 k
    k8s-worker-lx02:  libgcc                     x86_64    4.8.5-36.el7_6.2         updates    102 k
    k8s-worker-lx02:  libgomp                    x86_64    4.8.5-36.el7_6.2         updates    158 k
    k8s-worker-lx02:  libmount                   x86_64    2.23.2-59.el7_6.1        updates    182 k
    k8s-worker-lx02:  libsmartcols               x86_64    2.23.2-59.el7_6.1        updates    140 k
    k8s-worker-lx02:  libssh2                    x86_64    1.4.3-12.el7_6.2         updates    135 k
    k8s-worker-lx02:  libstdc++                  x86_64    4.8.5-36.el7_6.2         updates    305 k
    k8s-worker-lx02:  libuuid                    x86_64    2.23.2-59.el7_6.1        updates     82 k
    k8s-worker-lx02:  nss-pem                    x86_64    1.0.3-5.el7_6.1          updates     74 k
    k8s-worker-lx02:  openssl                    x86_64    1:1.0.2k-16.el7_6.1      updates    493 k
    k8s-worker-lx02:  openssl-libs               x86_64    1:1.0.2k-16.el7_6.1      updates    1.2 M
    k8s-worker-lx02:  polkit                     x86_64    0.112-18.el7_6.1         updates    168 k
    k8s-worker-lx02:  python                     x86_64    2.7.5-77.el7_6           updates     94 k
    k8s-worker-lx02:  python-libs                x86_64    2.7.5-77.el7_6           updates    5.6 M
    k8s-worker-lx02:  python-perf                x86_64    3.10.0-957.12.1.el7      updates    7.1 M
    k8s-worker-lx02:  rsync                      x86_64    3.1.2-6.el7_6.1          updates    404 k
    k8s-worker-lx02:  selinux-policy             noarch    3.13.1-229.el7_6.12      updates    484 k
    k8s-worker-lx02:  selinux-policy-targeted    noarch    3.13.1-229.el7_6.12      updates    6.9 M
    k8s-worker-lx02:  shadow-utils               x86_64    2:4.1.5.1-25.el7_6.1     updates    1.1 M
    k8s-worker-lx02:  systemd                    x86_64    219-62.el7_6.6           updates    5.1 M
    k8s-worker-lx02:  systemd-libs               x86_64    219-62.el7_6.6           updates    407 k
    k8s-worker-lx02:  systemd-sysv               x86_64    219-62.el7_6.6           updates     84 k
    k8s-worker-lx02:  tuned                      noarch    2.10.0-6.el7_6.3         updates    254 k
    k8s-worker-lx02:  tzdata                     noarch    2019a-1.el7              updates    494 k
    k8s-worker-lx02:  util-linux                 x86_64    2.23.2-59.el7_6.1        updates    2.0 M
    k8s-worker-lx02:  xfsprogs                   x86_64    4.5.0-19.el7_6           updates    897 k
    k8s-worker-lx02: 
    k8s-worker-lx02: Transaction Summary
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Install   1 Package
    k8s-worker-lx02: Upgrade  39 Packages
    k8s-worker-lx02: 
    k8s-worker-lx02: Total download size: 117 M
    k8s-worker-lx02: Downloading packages:
    k8s-worker-lx02: Delta RPMs reduced 26 M of updates to 7.5 M (70% saved)
    k8s-worker-lx02: /usr/share/locale/ar/LC_MESSAGES/NetworkManager.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: Public key for NetworkManager-team-1.12.0-10.el7_6.x86_64.rpm is not installed
    k8s-worker-lx02: warning: /var/cache/yum/x86_64/7/updates/packages/NetworkManager-team-1.12.0-10.el7_6.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    k8s-worker-lx02: /usr/share/locale/cs/LC_MESSAGES/polkit-1.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: Finishing delta rebuilds of 8 package(s) (16 M)
    k8s-worker-lx02: /usr/share/locale/ja/LC_MESSAGES/shadow.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: /usr/share/locale/da/LC_MESSAGES/util-linux.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: /usr/share/locale/de/LC_MESSAGES/xfsprogs.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: /usr/share/locale/de/LC_MESSAGES/systemd.mo: No such file or directory
    k8s-worker-lx02: cannot reconstruct rpm from disk files
    k8s-worker-lx02: Some delta RPMs failed to download or rebuild. Retrying..
    k8s-worker-lx02: Public key for polkit-0.112-18.el7_6.1.x86_64.rpm is not installed
    k8s-worker-lx02: --------------------------------------------------------------------------------
    k8s-worker-lx02: Total                                              3.4 MB/s | 109 MB  00:32     
    k8s-worker-lx02: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-worker-lx02: Importing GPG key 0xF4A80EB5:
    k8s-worker-lx02:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    k8s-worker-lx02:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    k8s-worker-lx02:  Package    : centos-release-7-6.1810.2.el7.centos.x86_64 (@anaconda)
    k8s-worker-lx02:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    k8s-worker-lx02: Running transaction check
    k8s-worker-lx02: Running transaction test
    k8s-worker-lx02: Transaction test succeeded
    k8s-worker-lx02: Running transaction
    k8s-worker-lx02:   Updating   : libgcc-4.8.5-36.el7_6.2.x86_64                              1/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : selinux-policy-3.13.1-229.el7_6.12.noarch                   2/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : tzdata-2019a-1.el7.noarch                                   3/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : glibc-2.17-260.el7_6.4.x86_64                               4/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : glibc-common-2.17-260.el7_6.4.x86_64                        5/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : systemd-libs-219-62.el7_6.6.x86_64                          6/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libuuid-2.23.2-59.el7_6.1.x86_64                            7/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libblkid-2.23.2-59.el7_6.1.x86_64                           8/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                    9/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    10/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : python-libs-2.7.5-77.el7_6.x86_64                          11/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : python-2.7.5-77.el7_6.x86_64                               12/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libmount-2.23.2-59.el7_6.1.x86_64                          13/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              14/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : python-perf-3.10.0-957.12.1.el7.x86_64                     15/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        16/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : systemd-219-62.el7_6.6.x86_64                              17/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:dbus-1.10.24-13.el7_6.x86_64                             18/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : polkit-0.112-18.el7_6.1.x86_64                             19/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    20/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libsmartcols-2.23.2-59.el7_6.1.x86_64                      21/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : util-linux-2.23.2-59.el7_6.1.x86_64                        22/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            23/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 24/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               25/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : kernel-tools-3.10.0-957.12.1.el7.x86_64                    26/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : tuned-2.10.0-6.el7_6.3.noarch                              27/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                28/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               29/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : systemd-sysv-219-62.el7_6.6.x86_64                         30/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : rsync-3.1.2-6.el7_6.1.x86_64                               31/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libssh2-1.4.3-12.el7_6.2.x86_64                            32/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         33/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : xfsprogs-4.5.0-19.el7_6.x86_64                             34/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libstdc++-4.8.5-36.el7_6.2.x86_64                          35/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : nss-pem-1.0.3-5.el7_6.1.x86_64                             36/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : libgomp-4.8.5-36.el7_6.2.x86_64                            37/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : iproute-4.11.0-14.el7_6.2.x86_64                           38/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Updating   : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         39/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : kernel-3.10.0-957.12.1.el7.x86_64                          40/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : tuned-2.10.0-6.el7.noarch                                  41/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : systemd-sysv-219-62.el7_6.5.x86_64                         42/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 43/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 44/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            45/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : util-linux-2.23.2-59.el7.x86_64                            46/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : xfsprogs-4.5.0-18.el7.x86_64                               47/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:openssl-1.0.2k-16.el7.x86_64                             48/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : python-perf-3.10.0-957.5.1.el7.x86_64                      49/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : python-2.7.5-76.el7.x86_64                                 50/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : python-libs-2.7.5-76.el7.x86_64                            51/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : kernel-tools-3.10.0-957.5.1.el7.x86_64                     52/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                53/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     54/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : polkit-0.112-18.el7.x86_64                                 55/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               56/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libstdc++-4.8.5-36.el7.x86_64                              57/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libssh2-1.4.3-12.el7.x86_64                                58/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : rsync-3.1.2-4.el7.x86_64                                   59/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          60/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:dbus-1.10.24-12.el7.x86_64                               61/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : systemd-219-62.el7_6.5.x86_64                              62/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libmount-2.23.2-59.el7.x86_64                              63/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libblkid-2.23.2-59.el7.x86_64                              64/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:dbus-libs-1.10.24-12.el7.x86_64                          65/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : systemd-libs-219-62.el7_6.5.x86_64                         66/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libuuid-2.23.2-59.el7.x86_64                               67/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       68/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : 1:openssl-libs-1.0.2k-16.el7.x86_64                        69/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                70/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libsmartcols-2.23.2-59.el7.x86_64                          71/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : iproute-4.11.0-14.el7.x86_64                               72/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libgomp-4.8.5-36.el7.x86_64                                73/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : nss-pem-1.0.3-5.el7.x86_64                                 74/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : selinux-policy-3.13.1-229.el7_6.9.noarch                   75/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : glibc-common-2.17-260.el7_6.3.x86_64                       76/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : glibc-2.17-260.el7_6.3.x86_64                              77/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : tzdata-2018i-1.el7.noarch                                  78/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Cleanup    : libgcc-4.8.5-36.el7.x86_64                                 79/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libsmartcols-2.23.2-59.el7_6.1.x86_64                       1/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-sysv-219-62.el7_6.6.x86_64                          2/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libssh2-1.4.3-12.el7_6.2.x86_64                             3/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : glibc-common-2.17-260.el7_6.4.x86_64                        4/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libblkid-2.23.2-59.el7_6.1.x86_64                           5/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : util-linux-2.23.2-59.el7_6.1.x86_64                         6/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : rsync-3.1.2-6.el7_6.1.x86_64                                7/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libmount-2.23.2-59.el7_6.1.x86_64                           8/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libstdc++-4.8.5-36.el7_6.2.x86_64                           9/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7_6.1.x86_64                   10/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : nss-pem-1.0.3-5.el7_6.1.x86_64                             11/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libgcc-4.8.5-36.el7_6.2.x86_64                             12/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libgomp-4.8.5-36.el7_6.2.x86_64                            13/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.12.noarch         14/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : tzdata-2019a-1.el7.noarch                                  15/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : iproute-4.11.0-14.el7_6.2.x86_64                           16/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:openssl-1.0.2k-16.el7_6.1.x86_64                         17/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-perf-3.10.0-957.12.1.el7.x86_64                     18/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-tui-1.12.0-10.el7_6.x86_64                19/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : polkit-0.112-18.el7_6.1.x86_64                             20/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        21/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.7.x86_64            22/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-1.12.0-10.el7_6.x86_64                    23/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kernel-3.10.0-957.12.1.el7.x86_64                          24/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:openssl-libs-1.0.2k-16.el7_6.1.x86_64                    25/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-2.7.5-77.el7_6.x86_64                               26/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-219-62.el7_6.6.x86_64                              27/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                             28/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-libnm-1.12.0-10.el7_6.x86_64              29/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : selinux-policy-3.13.1-229.el7_6.12.noarch                  30/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libuuid-2.23.2-59.el7_6.1.x86_64                           31/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : xfsprogs-4.5.0-19.el7_6.x86_64                             32/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kernel-tools-libs-3.10.0-957.12.1.el7.x86_64               33/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : glibc-2.17-260.el7_6.4.x86_64                              34/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-libs-219-62.el7_6.6.x86_64                         35/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-team-1.12.0-10.el7_6.x86_64               36/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kernel-tools-3.10.0-957.12.1.el7.x86_64                    37/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-libs-2.7.5-77.el7_6.x86_64                          38/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : tuned-2.10.0-6.el7_6.3.noarch                              39/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.7.x86_64                 40/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-2.7.5-76.el7.x86_64                                 41/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-perf-3.10.0-957.5.1.el7.x86_64                      42/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-libnm-1.12.0-8.el7_6.x86_64               43/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libblkid-2.23.2-59.el7.x86_64                              44/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kernel-tools-3.10.0-957.5.1.el7.x86_64                     45/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-219-62.el7_6.5.x86_64                              46/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libgcc-4.8.5-36.el7.x86_64                                 47/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : iproute-4.11.0-14.el7.x86_64                               48/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libstdc++-4.8.5-36.el7.x86_64                              49/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:openssl-libs-1.0.2k-16.el7.x86_64                        50/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : glibc-2.17-260.el7_6.3.x86_64                              51/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-libs-1.02.149-10.el7_6.3.x86_64            52/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : xfsprogs-4.5.0-18.el7.x86_64                               53/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libuuid-2.23.2-59.el7.x86_64                               54/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : nss-pem-1.0.3-5.el7.x86_64                                 55/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libssh2-1.4.3-12.el7.x86_64                                56/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:openssl-1.0.2k-16.el7.x86_64                             57/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-libs-219-62.el7_6.5.x86_64                         58/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:dbus-1.10.24-12.el7.x86_64                               59/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : rsync-3.1.2-4.el7.x86_64                                   60/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-tui-1.12.0-8.el7_6.x86_64                 61/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kernel-tools-libs-3.10.0-957.5.1.el7.x86_64                62/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:shadow-utils-4.1.5.1-25.el7.x86_64                       63/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libgomp-4.8.5-36.el7.x86_64                                64/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-1.12.0-8.el7_6.x86_64                     65/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : selinux-policy-3.13.1-229.el7_6.9.noarch                   66/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : selinux-policy-targeted-3.13.1-229.el7_6.9.noarch          67/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:dbus-libs-1.10.24-12.el7.x86_64                          68/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : systemd-sysv-219-62.el7_6.5.x86_64                         69/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libmount-2.23.2-59.el7.x86_64                              70/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : util-linux-2.23.2-59.el7.x86_64                            71/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libsmartcols-2.23.2-59.el7.x86_64                          72/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-libs-2.7.5-76.el7.x86_64                            73/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : polkit-0.112-18.el7.x86_64                                 74/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : tzdata-2018i-1.el7.noarch                                  75/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:NetworkManager-team-1.12.0-8.el7_6.x86_64                76/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : glibc-common-2.17-260.el7_6.3.x86_64                       77/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-1.02.149-10.el7_6.3.x86_64                 78/79
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : tuned-2.10.0-6.el7.noarch                                  79/79
    k8s-worker-lx02:  
    k8s-worker-lx02: 
    k8s-worker-lx02: Installed:
    k8s-worker-lx02:   kernel.x86_64 0:3.10.0-957.12.1.el7                                           
    k8s-worker-lx02: 
    k8s-worker-lx02: Updated:
    k8s-worker-lx02:   NetworkManager.x86_64 1:1.12.0-10.el7_6                                       
    k8s-worker-lx02:   NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6                                 
    k8s-worker-lx02:   NetworkManager-team.x86_64 1:1.12.0-10.el7_6                                  
    k8s-worker-lx02:   NetworkManager-tui.x86_64 1:1.12.0-10.el7_6                                   
    k8s-worker-lx02:   dbus.x86_64 1:1.10.24-13.el7_6                                                
    k8s-worker-lx02:   dbus-libs.x86_64 1:1.10.24-13.el7_6                                           
    k8s-worker-lx02:   device-mapper.x86_64 7:1.02.149-10.el7_6.7                                    
    k8s-worker-lx02:   device-mapper-libs.x86_64 7:1.02.149-10.el7_6.7                               
    k8s-worker-lx02:   glibc.x86_64 0:2.17-260.el7_6.4                                               
    k8s-worker-lx02:   glibc-common.x86_64 0:2.17-260.el7_6.4                                        
    k8s-worker-lx02:   iproute.x86_64 0:4.11.0-14.el7_6.2                                            
    k8s-worker-lx02:   kernel-tools.x86_64 0:3.10.0-957.12.1.el7                                     
    k8s-worker-lx02:   kernel-tools-libs.x86_64 0:3.10.0-957.12.1.el7                                
    k8s-worker-lx02:   libblkid.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-worker-lx02:   libgcc.x86_64 0:4.8.5-36.el7_6.2                                              
    k8s-worker-lx02:   libgomp.x86_64 0:4.8.5-36.el7_6.2                                             
    k8s-worker-lx02:   libmount.x86_64 0:2.23.2-59.el7_6.1                                           
    k8s-worker-lx02:   libsmartcols.x86_64 0:2.23.2-59.el7_6.1                                       
    k8s-worker-lx02:   libssh2.x86_64 0:1.4.3-12.el7_6.2                                             
    k8s-worker-lx02:   libstdc++.x86_64 0:4.8.5-36.el7_6.2                                           
    k8s-worker-lx02:   libuuid.x86_64 0:2.23.2-59.el7_6.1                                            
    k8s-worker-lx02:   nss-pem.x86_64 0:1.0.3-5.el7_6.1                                              
    k8s-worker-lx02:   openssl.x86_64 1:1.0.2k-16.el7_6.1                                            
    k8s-worker-lx02:   openssl-libs.x86_64 1:1.0.2k-16.el7_6.1                                       
    k8s-worker-lx02:   polkit.x86_64 0:0.112-18.el7_6.1                                              
    k8s-worker-lx02:   python.x86_64 0:2.7.5-77.el7_6                                                
    k8s-worker-lx02:   python-libs.x86_64 0:2.7.5-77.el7_6                                           
    k8s-worker-lx02:   python-perf.x86_64 0:3.10.0-957.12.1.el7                                      
    k8s-worker-lx02:   rsync.x86_64 0:3.1.2-6.el7_6.1                                                
    k8s-worker-lx02:   selinux-policy.noarch 0:3.13.1-229.el7_6.12                                   
    k8s-worker-lx02:   selinux-policy-targeted.noarch 0:3.13.1-229.el7_6.12                          
    k8s-worker-lx02:   shadow-utils.x86_64 2:4.1.5.1-25.el7_6.1                                      
    k8s-worker-lx02:   systemd.x86_64 0:219-62.el7_6.6                                               
    k8s-worker-lx02:   systemd-libs.x86_64 0:219-62.el7_6.6                                          
    k8s-worker-lx02:   systemd-sysv.x86_64 0:219-62.el7_6.6                                          
    k8s-worker-lx02:   tuned.noarch 0:2.10.0-6.el7_6.3                                               
    k8s-worker-lx02:   tzdata.noarch 0:2019a-1.el7                                                   
    k8s-worker-lx02:   util-linux.x86_64 0:2.23.2-59.el7_6.1                                         
    k8s-worker-lx02:   xfsprogs.x86_64 0:4.5.0-19.el7_6                                              
    k8s-worker-lx02: Complete!
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Loaded plugins: fastestmirror
    k8s-worker-lx02: Loading mirror speeds from cached hostfile
    k8s-worker-lx02:  * base: repos.del.extreme-ix.org
    k8s-worker-lx02:  * extras: repos.del.extreme-ix.org
    k8s-worker-lx02:  * updates: repos.del.extreme-ix.org
    k8s-worker-lx02: Resolving Dependencies
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package bind-utils.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-worker-lx02: --> Processing Dependency: bind-libs = 32:9.9.4-73.el7_6 for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: liblwres.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: libisccfg.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: libisccc.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: libisc.so.95()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: libdns.so.100()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: --> Processing Dependency: libbind9.so.90()(64bit) for package: 32:bind-utils-9.9.4-73.el7_6.x86_64
    k8s-worker-lx02: ---> Package docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx02: --> Processing Dependency: docker-common = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: docker-client = 2:1.13.1-96.gitb2f74b2.el7.centos for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: subscription-manager-rhsm-certificates for package: 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: ---> Package epel-release.noarch 0:7-11 will be installed
    k8s-worker-lx02: ---> Package net-tools.x86_64 0:2.0-0.24.20131004git.el7 will be installed
    k8s-worker-lx02: ---> Package ntp.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-worker-lx02: --> Processing Dependency: ntpdate = 4.2.6p5-28.el7.centos for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-28.el7.centos.x86_64
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed
    k8s-worker-lx02: ---> Package bind-libs.x86_64 32:9.9.4-73.el7_6 will be installed
    k8s-worker-lx02: ---> Package docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx02: ---> Package docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos will be installed
    k8s-worker-lx02: --> Processing Dependency: skopeo-containers >= 1:0.1.26-2 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: oci-umount >= 2:2.3.3-3 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: oci-systemd-hook >= 1:0.1.4-9 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: oci-register-machine >= 1:0-5.13 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: lvm2 >= 2.02.112 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: container-storage-setup >= 0.9.0-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: container-selinux >= 2:2.51-1 for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: atomic-registries for package: 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64
    k8s-worker-lx02: ---> Package ntpdate.x86_64 0:4.2.6p5-28.el7.centos will be installed
    k8s-worker-lx02: ---> Package subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos will be installed
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos will be installed
    k8s-worker-lx02: --> Processing Dependency: python-yaml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: python-setuptools for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx02: --> Processing Dependency: python-pytoml for package: 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_64
    k8s-worker-lx02: ---> Package container-selinux.noarch 2:2.95-2.el7_6 will be installed
    k8s-worker-lx02: --> Processing Dependency: policycoreutils-python for package: 2:container-selinux-2.95-2.el7_6.noarch
    k8s-worker-lx02: ---> Package container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7 will be installed
    k8s-worker-lx02: ---> Package containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos will be installed
    k8s-worker-lx02: ---> Package lvm2.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-worker-lx02: --> Processing Dependency: lvm2-libs = 7:2.02.180-10.el7_6.7 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: device-mapper-persistent-data >= 0.7.0-0.1.rc6 for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: liblvm2app.so.2.2(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libdevmapper-event.so.1.02(Base)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libaio.so.1(LIBAIO_0.4)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libaio.so.1(LIBAIO_0.1)(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: liblvm2app.so.2.2()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libdevmapper-event.so.1.02()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libaio.so.1()(64bit) for package: 7:lvm2-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: ---> Package oci-register-machine.x86_64 1:0-6.git2b44233.el7 will be installed
    k8s-worker-lx02: ---> Package oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6 will be installed
    k8s-worker-lx02: --> Processing Dependency: libyajl.so.2()(64bit) for package: 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64
    k8s-worker-lx02: ---> Package oci-umount.x86_64 2:2.3.4-2.git87f9237.el7 will be installed
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package PyYAML.x86_64 0:3.10-11.el7 will be installed
    k8s-worker-lx02: --> Processing Dependency: libyaml-0.so.2()(64bit) for package: PyYAML-3.10-11.el7.x86_64
    k8s-worker-lx02: ---> Package device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-worker-lx02: ---> Package device-mapper-persistent-data.x86_64 0:0.7.3-3.el7 will be installed
    k8s-worker-lx02: ---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed
    k8s-worker-lx02: ---> Package lvm2-libs.x86_64 7:2.02.180-10.el7_6.7 will be installed
    k8s-worker-lx02: --> Processing Dependency: device-mapper-event = 7:1.02.149-10.el7_6.7 for package: 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64
    k8s-worker-lx02: ---> Package policycoreutils-python.x86_64 0:2.5-29.el7_6.1 will be installed
    k8s-worker-lx02: --> Processing Dependency: setools-libs >= 3.3.8-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libsemanage-python >= 2.5-14 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: audit-libs-python >= 2.1.3-4 for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: python-IPy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libqpol.so.1(VERS_1.4)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libqpol.so.1(VERS_1.2)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libcgroup for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libapol.so.4(VERS_4.0)(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: checkpolicy for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libqpol.so.1()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: --> Processing Dependency: libapol.so.4()(64bit) for package: policycoreutils-python-2.5-29.el7_6.1.x86_64
    k8s-worker-lx02: ---> Package python-pytoml.noarch 0:0.1.14-1.git7dea353.el7 will be installed
    k8s-worker-lx02: ---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed
    k8s-worker-lx02: --> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch
    k8s-worker-lx02: ---> Package yajl.x86_64 0:2.0.4-4.el7 will be installed
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package audit-libs-python.x86_64 0:2.8.4-4.el7 will be installed
    k8s-worker-lx02: ---> Package checkpolicy.x86_64 0:2.5-8.el7 will be installed
    k8s-worker-lx02: ---> Package device-mapper-event.x86_64 7:1.02.149-10.el7_6.7 will be installed
    k8s-worker-lx02: ---> Package libcgroup.x86_64 0:0.41-20.el7 will be installed
    k8s-worker-lx02: ---> Package libsemanage-python.x86_64 0:2.5-14.el7 will be installed
    k8s-worker-lx02: ---> Package libyaml.x86_64 0:0.1.4-11.el7_0 will be installed
    k8s-worker-lx02: ---> Package python-IPy.noarch 0:0.75-6.el7 will be installed
    k8s-worker-lx02: ---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed
    k8s-worker-lx02: --> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-worker-lx02: --> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    k8s-worker-lx02: ---> Package setools-libs.x86_64 0:3.3.8-4.el7 will be installed
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
    k8s-worker-lx02: ---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed
    k8s-worker-lx02: --> Finished Dependency Resolution
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependencies Resolved
    k8s-worker-lx02: 
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02:  Package                 Arch   Version                           Repository
    k8s-worker-lx02:                                                                            Size
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Installing:
    k8s-worker-lx02:  bind-utils              x86_64 32:9.9.4-73.el7_6                 updates 206 k
    k8s-worker-lx02:  docker                  x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   18 M
    k8s-worker-lx02:  epel-release            noarch 7-11                              extras   15 k
    k8s-worker-lx02:  net-tools               x86_64 2.0-0.24.20131004git.el7          base    306 k
    k8s-worker-lx02:  ntp                     x86_64 4.2.6p5-28.el7.centos             base    549 k
    k8s-worker-lx02: Installing for dependencies:
    k8s-worker-lx02:  PyYAML                  x86_64 3.10-11.el7                       base    153 k
    k8s-worker-lx02:  atomic-registries       x86_64 1:1.22.1-26.gitb507039.el7.centos extras   35 k
    k8s-worker-lx02:  audit-libs-python       x86_64 2.8.4-4.el7                       base     76 k
    k8s-worker-lx02:  autogen-libopts         x86_64 5.18-5.el7                        base     66 k
    k8s-worker-lx02:  bind-libs               x86_64 32:9.9.4-73.el7_6                 updates 1.0 M
    k8s-worker-lx02:  checkpolicy             x86_64 2.5-8.el7                         base    295 k
    k8s-worker-lx02:  container-selinux       noarch 2:2.95-2.el7_6                    extras   39 k
    k8s-worker-lx02:  container-storage-setup noarch 0.11.0-2.git5eaf76c.el7           extras   35 k
    k8s-worker-lx02:  containers-common       x86_64 1:0.1.35-2.git404c5bd.el7.centos  extras   21 k
    k8s-worker-lx02:  device-mapper-event     x86_64 7:1.02.149-10.el7_6.7             updates 189 k
    k8s-worker-lx02:  device-mapper-event-libs
    k8s-worker-lx02:                          x86_64 7:1.02.149-10.el7_6.7             updates 188 k
    k8s-worker-lx02:  device-mapper-persistent-data
    k8s-worker-lx02:                          x86_64 0.7.3-3.el7                       base    405 k
    k8s-worker-lx02:  docker-client           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras  3.9 M
    k8s-worker-lx02:  docker-common           x86_64 2:1.13.1-96.gitb2f74b2.el7.centos extras   96 k
    k8s-worker-lx02:  libaio                  x86_64 0.3.109-13.el7                    base     24 k
    k8s-worker-lx02:  libcgroup               x86_64 0.41-20.el7                       base     66 k
    k8s-worker-lx02:  libsemanage-python      x86_64 2.5-14.el7                        base    113 k
    k8s-worker-lx02:  libyaml                 x86_64 0.1.4-11.el7_0                    base     55 k
    k8s-worker-lx02:  lvm2                    x86_64 7:2.02.180-10.el7_6.7             updates 1.3 M
    k8s-worker-lx02:  lvm2-libs               x86_64 7:2.02.180-10.el7_6.7             updates 1.1 M
    k8s-worker-lx02:  ntpdate                 x86_64 4.2.6p5-28.el7.centos             base     86 k
    k8s-worker-lx02:  oci-register-machine    x86_64 1:0-6.git2b44233.el7              extras  1.1 M
    k8s-worker-lx02:  oci-systemd-hook        x86_64 1:0.1.18-3.git8787307.el7_6       extras   34 k
    k8s-worker-lx02:  oci-umount              x86_64 2:2.3.4-2.git87f9237.el7          extras   32 k
    k8s-worker-lx02:  policycoreutils-python  x86_64 2.5-29.el7_6.1                    updates 456 k
    k8s-worker-lx02:  python-IPy              noarch 0.75-6.el7                        base     32 k
    k8s-worker-lx02:  python-backports        x86_64 1.0-8.el7                         base    5.8 k
    k8s-worker-lx02:  python-backports-ssl_match_hostname
    k8s-worker-lx02:                          noarch 3.5.0.1-1.el7                     base     13 k
    k8s-worker-lx02:  python-ipaddress        noarch 1.0.16-2.el7                      base     34 k
    k8s-worker-lx02:  python-pytoml           noarch 0.1.14-1.git7dea353.el7           extras   18 k
    k8s-worker-lx02:  python-setuptools       noarch 0.9.8-7.el7                       base    397 k
    k8s-worker-lx02:  setools-libs            x86_64 3.3.8-4.el7                       base    620 k
    k8s-worker-lx02:  subscription-manager-rhsm-certificates
    k8s-worker-lx02:                          x86_64 1.21.10-3.el7.centos              updates 207 k
    k8s-worker-lx02:  yajl                    x86_64 2.0.4-4.el7                       base     39 k
    k8s-worker-lx02: 
    k8s-worker-lx02: Transaction Summary
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Install  5 Packages (+34 Dependent packages)
    k8s-worker-lx02: 
    k8s-worker-lx02: Total download size: 31 M
    k8s-worker-lx02: Installed size: 103 M
    k8s-worker-lx02: Downloading packages:
    k8s-worker-lx02: --------------------------------------------------------------------------------
    k8s-worker-lx02: Total                                              5.1 MB/s |  31 MB  00:06     
    k8s-worker-lx02: Running transaction check
    k8s-worker-lx02: Running transaction test
    k8s-worker-lx02: Transaction test succeeded
    k8s-worker-lx02: Running transaction
    k8s-worker-lx02:   Installing : libaio-0.3.109-13.el7.x86_64                                1/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64       2/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : yajl-2.0.4-4.el7.x86_64                                     3/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                  4/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64         5/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            6/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                      7/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : device-mapper-persistent-data-0.7.3-3.el7.x86_64            8/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           9/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch     10/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-ipaddress-1.0.16-2.el7.noarch                       11/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 32:bind-libs-9.9.4-73.el7_6.x86_64                         12/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libyaml-0.1.4-11.el7_0.x86_64                              13/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : PyYAML-3.10-11.el7.x86_64                                  14/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : audit-libs-python-2.8.4-4.el7.x86_64                       15/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   16/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           17/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-backports-1.0-8.el7.x86_64                          18/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch   19/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-setuptools-0.9.8-7.el7.noarch                       20/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libsemanage-python-2.5-14.el7.x86_64                       21/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : ntpdate-4.2.6p5-28.el7.centos.x86_64                       22/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : setools-libs-3.3.8-4.el7.x86_64                            23/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-pytoml-0.1.14-1.git7dea353.el7.noarch               24/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   25/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : python-IPy-0.75-6.el7.noarch                               26/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : checkpolicy-2.5-8.el7.x86_64                               27/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   28/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : autogen-libopts-5.18-5.el7.x86_64                          29/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libcgroup-0.41-20.el7.x86_64                               30/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : policycoreutils-python-2.5-29.el7_6.1.x86_64               31/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 2:container-selinux-2.95-2.el7_6.noarch                    32/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     33/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64     34/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            35/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : ntp-4.2.6p5-28.el7.centos.x86_64                           36/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : 32:bind-utils-9.9.4-73.el7_6.x86_64                        37/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : epel-release-7-11.noarch                                   38/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : net-tools-2.0-0.24.20131004git.el7.x86_64                  39/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : device-mapper-persistent-data-0.7.3-3.el7.x86_64            1/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libcgroup-0.41-20.el7.x86_64                                2/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch    3/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:docker-client-1.13.1-96.gitb2f74b2.el7.centos.x86_64      4/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-event-1.02.149-10.el7_6.7.x86_64            5/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : autogen-libopts-5.18-5.el7.x86_64                           6/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : container-storage-setup-0.11.0-2.git5eaf76c.el7.noarch      7/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:lvm2-2.02.180-10.el7_6.7.x86_64                           8/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-setuptools-0.9.8-7.el7.noarch                        9/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : subscription-manager-rhsm-certificates-1.21.10-3.el7.cen   10/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : net-tools-2.0-0.24.20131004git.el7.x86_64                  11/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:container-selinux-2.95-2.el7_6.noarch                    12/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:oci-umount-2.3.4-2.git87f9237.el7.x86_64                 13/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : checkpolicy-2.5-8.el7.x86_64                               14/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : epel-release-7-11.noarch                                   15/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : ntp-4.2.6p5-28.el7.centos.x86_64                           16/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:device-mapper-event-libs-1.02.149-10.el7_6.7.x86_64      17/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-IPy-0.75-6.el7.noarch                               18/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:docker-common-1.13.1-96.gitb2f74b2.el7.centos.x86_64     19/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-pytoml-0.1.14-1.git7dea353.el7.noarch               20/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:oci-systemd-hook-0.1.18-3.git8787307.el7_6.x86_64        21/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : setools-libs-3.3.8-4.el7.x86_64                            22/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 2:docker-1.13.1-96.gitb2f74b2.el7.centos.x86_64            23/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : ntpdate-4.2.6p5-28.el7.centos.x86_64                       24/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libsemanage-python-2.5-14.el7.x86_64                       25/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-backports-1.0-8.el7.x86_64                          26/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:oci-register-machine-0-6.git2b44233.el7.x86_64           27/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 32:bind-utils-9.9.4-73.el7_6.x86_64                        28/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:containers-common-0.1.35-2.git404c5bd.el7.centos.x86_6   29/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : yajl-2.0.4-4.el7.x86_64                                    30/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 1:atomic-registries-1.22.1-26.gitb507039.el7.centos.x86_   31/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : audit-libs-python-2.8.4-4.el7.x86_64                       32/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libyaml-0.1.4-11.el7_0.x86_64                              33/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libaio-0.3.109-13.el7.x86_64                               34/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 32:bind-libs-9.9.4-73.el7_6.x86_64                         35/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : python-ipaddress-1.0.16-2.el7.noarch                       36/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : policycoreutils-python-2.5-29.el7_6.1.x86_64               37/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : PyYAML-3.10-11.el7.x86_64                                  38/39
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : 7:lvm2-libs-2.02.180-10.el7_6.7.x86_64                     39/39
    k8s-worker-lx02:  
    k8s-worker-lx02: 
    k8s-worker-lx02: Installed:
    k8s-worker-lx02:   bind-utils.x86_64 32:9.9.4-73.el7_6                                           
    k8s-worker-lx02:   docker.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                               
    k8s-worker-lx02:   epel-release.noarch 0:7-11                                                    
    k8s-worker-lx02:   net-tools.x86_64 0:2.0-0.24.20131004git.el7                                   
    k8s-worker-lx02:   ntp.x86_64 0:4.2.6p5-28.el7.centos                                            
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependency Installed:
    k8s-worker-lx02:   PyYAML.x86_64 0:3.10-11.el7                                                   
    k8s-worker-lx02:   atomic-registries.x86_64 1:1.22.1-26.gitb507039.el7.centos                    
    k8s-worker-lx02:   audit-libs-python.x86_64 0:2.8.4-4.el7                                        
    k8s-worker-lx02:   autogen-libopts.x86_64 0:5.18-5.el7                                           
    k8s-worker-lx02:   bind-libs.x86_64 32:9.9.4-73.el7_6                                            
    k8s-worker-lx02:   checkpolicy.x86_64 0:2.5-8.el7                                                
    k8s-worker-lx02:   container-selinux.noarch 2:2.95-2.el7_6                                       
    k8s-worker-lx02:   container-storage-setup.noarch 0:0.11.0-2.git5eaf76c.el7                      
    k8s-worker-lx02:   containers-common.x86_64 1:0.1.35-2.git404c5bd.el7.centos                     
    k8s-worker-lx02:   device-mapper-event.x86_64 7:1.02.149-10.el7_6.7                              
    k8s-worker-lx02:   device-mapper-event-libs.x86_64 7:1.02.149-10.el7_6.7                         
    k8s-worker-lx02:   device-mapper-persistent-data.x86_64 0:0.7.3-3.el7                            
    k8s-worker-lx02:   docker-client.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-worker-lx02:   docker-common.x86_64 2:1.13.1-96.gitb2f74b2.el7.centos                        
    k8s-worker-lx02:   libaio.x86_64 0:0.3.109-13.el7                                                
    k8s-worker-lx02:   libcgroup.x86_64 0:0.41-20.el7                                                
    k8s-worker-lx02:   libsemanage-python.x86_64 0:2.5-14.el7                                        
    k8s-worker-lx02:   libyaml.x86_64 0:0.1.4-11.el7_0                                               
    k8s-worker-lx02:   lvm2.x86_64 7:2.02.180-10.el7_6.7                                             
    k8s-worker-lx02:   lvm2-libs.x86_64 7:2.02.180-10.el7_6.7                                        
    k8s-worker-lx02:   ntpdate.x86_64 0:4.2.6p5-28.el7.centos                                        
    k8s-worker-lx02:   oci-register-machine.x86_64 1:0-6.git2b44233.el7                              
    k8s-worker-lx02:   oci-systemd-hook.x86_64 1:0.1.18-3.git8787307.el7_6                           
    k8s-worker-lx02:   oci-umount.x86_64 2:2.3.4-2.git87f9237.el7                                    
    k8s-worker-lx02:   policycoreutils-python.x86_64 0:2.5-29.el7_6.1                                
    k8s-worker-lx02:   python-IPy.noarch 0:0.75-6.el7                                                
    k8s-worker-lx02:   python-backports.x86_64 0:1.0-8.el7                                           
    k8s-worker-lx02:   python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    
    k8s-worker-lx02:   python-ipaddress.noarch 0:1.0.16-2.el7                                        
    k8s-worker-lx02:   python-pytoml.noarch 0:0.1.14-1.git7dea353.el7                                
    k8s-worker-lx02:   python-setuptools.noarch 0:0.9.8-7.el7                                        
    k8s-worker-lx02:   setools-libs.x86_64 0:3.3.8-4.el7                                             
    k8s-worker-lx02:   subscription-manager-rhsm-certificates.x86_64 0:1.21.10-3.el7.centos          
    k8s-worker-lx02:   yajl.x86_64 0:2.0.4-4.el7                                                     
    k8s-worker-lx02: Complete!
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Created symlink from /etc/systemd/system/multi-user.target.wants/ntpd.service to /usr/lib/systemd/system/ntpd.service.
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: * Applying /usr/lib/sysctl.d/00-system.conf ...
    k8s-worker-lx02: net.bridge.bridge-nf-call-ip6tables = 0
    k8s-worker-lx02: net.bridge.bridge-nf-call-iptables = 0
    k8s-worker-lx02: net.bridge.bridge-nf-call-arptables = 0
    k8s-worker-lx02: * Applying /usr/lib/sysctl.d/10-default-yama-scope.conf ...
    k8s-worker-lx02: kernel.yama.ptrace_scope = 0
    k8s-worker-lx02: * Applying /usr/lib/sysctl.d/50-default.conf ...
    k8s-worker-lx02: kernel.sysrq = 16
    k8s-worker-lx02: kernel.core_uses_pid = 1
    k8s-worker-lx02: net.ipv4.conf.default.rp_filter = 1
    k8s-worker-lx02: net.ipv4.conf.all.rp_filter = 1
    k8s-worker-lx02: net.ipv4.conf.default.accept_source_route = 0
    k8s-worker-lx02: net.ipv4.conf.all.accept_source_route = 0
    k8s-worker-lx02: net.ipv4.conf.default.promote_secondaries = 1
    k8s-worker-lx02: net.ipv4.conf.all.promote_secondaries = 1
    k8s-worker-lx02: fs.protected_hardlinks = 1
    k8s-worker-lx02: fs.protected_symlinks = 1
    k8s-worker-lx02: * Applying /usr/lib/sysctl.d/99-docker.conf ...
    k8s-worker-lx02: fs.may_detach_mounts = 1
    k8s-worker-lx02: * Applying /etc/sysctl.d/99-sysctl.conf ...
    k8s-worker-lx02: * Applying /etc/sysctl.d/k8s.conf ...
    k8s-worker-lx02: net.bridge.bridge-nf-call-ip6tables = 1
    k8s-worker-lx02: net.bridge.bridge-nf-call-iptables = 1
    k8s-worker-lx02: * Applying /etc/sysctl.conf ...
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Loaded plugins: fastestmirror
    k8s-worker-lx02: Loading mirror speeds from cached hostfile
    k8s-worker-lx02:  * base: repos.del.extreme-ix.org
    k8s-worker-lx02:  * epel: repos.del.extreme-ix.org
    k8s-worker-lx02:  * extras: repos.del.extreme-ix.org
    k8s-worker-lx02:  * updates: repos.del.extreme-ix.org
    k8s-worker-lx02: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx02: Importing GPG key 0xA7317B0F:
    k8s-worker-lx02:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-worker-lx02:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-worker-lx02:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx02: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx02: Resolving Dependencies
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package kubeadm.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx02: --> Processing Dependency: kubernetes-cni >= 0.7.5 for package: kubeadm-1.14.1-0.x86_64
    k8s-worker-lx02: --> Processing Dependency: cri-tools >= 1.11.0 for package: kubeadm-1.14.1-0.x86_64
    k8s-worker-lx02: ---> Package kubectl.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx02: ---> Package kubelet.x86_64 0:1.14.1-0 will be installed
    k8s-worker-lx02: --> Processing Dependency: socat for package: kubelet-1.14.1-0.x86_64
    k8s-worker-lx02: --> Processing Dependency: conntrack for package: kubelet-1.14.1-0.x86_64
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package conntrack-tools.x86_64 0:1.4.4-4.el7 will be installed
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.1)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_cttimeout.so.1(LIBNETFILTER_CTTIMEOUT_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_cthelper.so.0(LIBNETFILTER_CTHELPER_1.0)(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_queue.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_cttimeout.so.1()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: --> Processing Dependency: libnetfilter_cthelper.so.0()(64bit) for package: conntrack-tools-1.4.4-4.el7.x86_64
    k8s-worker-lx02: ---> Package cri-tools.x86_64 0:1.12.0-0 will be installed
    k8s-worker-lx02: ---> Package kubernetes-cni.x86_64 0:0.7.5-0 will be installed
    k8s-worker-lx02: ---> Package socat.x86_64 0:1.7.3.2-2.el7 will be installed
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package libnetfilter_cthelper.x86_64 0:1.0.0-9.el7 will be installed
    k8s-worker-lx02: ---> Package libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7 will be installed
    k8s-worker-lx02: ---> Package libnetfilter_queue.x86_64 0:1.0.2-2.el7_2 will be installed
    k8s-worker-lx02: --> Finished Dependency Resolution
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependencies Resolved
    k8s-worker-lx02: 
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02:  Package                    Arch       Version             Repository      Size
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Installing:
    k8s-worker-lx02:  kubeadm                    x86_64     1.14.1-0            kubernetes     8.7 M
    k8s-worker-lx02:  kubectl                    x86_64     1.14.1-0            kubernetes     9.5 M
    k8s-worker-lx02:  kubelet                    x86_64     1.14.1-0            kubernetes      23 M
    k8s-worker-lx02: Installing for dependencies:
    k8s-worker-lx02:  conntrack-tools            x86_64     1.4.4-4.el7         base           186 k
    k8s-worker-lx02:  cri-tools                  x86_64     1.12.0-0            kubernetes     4.2 M
    k8s-worker-lx02:  kubernetes-cni             x86_64     0.7.5-0             kubernetes      10 M
    k8s-worker-lx02:  libnetfilter_cthelper      x86_64     1.0.0-9.el7         base            18 k
    k8s-worker-lx02:  libnetfilter_cttimeout     x86_64     1.0.0-6.el7         base            18 k
    k8s-worker-lx02:  libnetfilter_queue         x86_64     1.0.2-2.el7_2       base            23 k
    k8s-worker-lx02:  socat                      x86_64     1.7.3.2-2.el7       base           290 k
    k8s-worker-lx02: 
    k8s-worker-lx02: Transaction Summary
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Install  3 Packages (+7 Dependent packages)
    k8s-worker-lx02: 
    k8s-worker-lx02: Total download size: 56 M
    k8s-worker-lx02: Installed size: 256 M
    k8s-worker-lx02: Downloading packages:
    k8s-worker-lx02: Public key for 53edc739a0e51a4c17794de26b13ee5df939bd3161b37f503fe2af8980b41a89-cri-tools-1.12.0-0.x86_64.rpm is not installed
    k8s-worker-lx02: warning: /var/cache/yum/x86_64/7/kubernetes/packages/53edc739a0e51a4c17794de26b13ee5df939bd3161b37f503fe2af8980b41a89-cri-tools-1.12.0-0.x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 3e1ba8d5: NOKEY
    k8s-worker-lx02: --------------------------------------------------------------------------------
    k8s-worker-lx02: Total                                              1.1 MB/s |  56 MB  00:50     
    k8s-worker-lx02: Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx02: Importing GPG key 0xA7317B0F:
    k8s-worker-lx02:  Userid     : "Google Cloud Packages Automatic Signing Key <gc-team@google.com>"
    k8s-worker-lx02:  Fingerprint: d0bc 747f d8ca f711 7500 d6fa 3746 c208 a731 7b0f
    k8s-worker-lx02:  From       : https://packages.cloud.google.com/yum/doc/yum-key.gpg
    k8s-worker-lx02: Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx02: Importing GPG key 0x3E1BA8D5:
    k8s-worker-lx02:  Userid     : "Google Cloud Packages RPM Signing Key <gc-team@google.com>"
    k8s-worker-lx02:  Fingerprint: 3749 e1ba 95a8 6ce0 5454 6ed2 f09c 394c 3e1b a8d5
    k8s-worker-lx02:  From       : https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    k8s-worker-lx02: Running transaction check
    k8s-worker-lx02: Running transaction test
    k8s-worker-lx02: Transaction test succeeded
    k8s-worker-lx02: Running transaction
    k8s-worker-lx02:   Installing : socat-1.7.3.2-2.el7.x86_64                                  1/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     2/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   3/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : kubectl-1.14.1-0.x86_64                                     4/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    5/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : conntrack-tools-1.4.4-4.el7.x86_64                          6/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : kubernetes-cni-0.7.5-0.x86_64                               7/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : kubelet-1.14.1-0.x86_64                                     8/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : cri-tools-1.12.0-0.x86_64                                   9/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Installing : kubeadm-1.14.1-0.x86_64                                    10/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : cri-tools-1.12.0-0.x86_64                                   1/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libnetfilter_cthelper-1.0.0-9.el7.x86_64                    2/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kubectl-1.14.1-0.x86_64                                     3/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libnetfilter_cttimeout-1.0.0-6.el7.x86_64                   4/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : libnetfilter_queue-1.0.2-2.el7_2.x86_64                     5/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kubeadm-1.14.1-0.x86_64                                     6/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kubelet-1.14.1-0.x86_64                                     7/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : kubernetes-cni-0.7.5-0.x86_64                               8/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : socat-1.7.3.2-2.el7.x86_64                                  9/10
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : conntrack-tools-1.4.4-4.el7.x86_64                         10/10
    k8s-worker-lx02:  
    k8s-worker-lx02: 
    k8s-worker-lx02: Installed:
    k8s-worker-lx02:   kubeadm.x86_64 0:1.14.1-0 kubectl.x86_64 0:1.14.1-0 kubelet.x86_64 0:1.14.1-0
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependency Installed:
    k8s-worker-lx02:   conntrack-tools.x86_64 0:1.4.4-4.el7                                          
    k8s-worker-lx02:   cri-tools.x86_64 0:1.12.0-0                                                   
    k8s-worker-lx02:   kubernetes-cni.x86_64 0:0.7.5-0                                               
    k8s-worker-lx02:   libnetfilter_cthelper.x86_64 0:1.0.0-9.el7                                    
    k8s-worker-lx02:   libnetfilter_cttimeout.x86_64 0:1.0.0-6.el7                                   
    k8s-worker-lx02:   libnetfilter_queue.x86_64 0:1.0.2-2.el7_2                                     
    k8s-worker-lx02:   socat.x86_64 0:1.7.3.2-2.el7                                                  
    k8s-worker-lx02: 
    k8s-worker-lx02: Complete!
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: inline script
    k8s-worker-lx02: Created symlink from /etc/systemd/system/multi-user.target.wants/kubelet.service to /usr/lib/systemd/system/kubelet.service.
==> k8s-worker-lx02: Running provisioner: shell...
    k8s-worker-lx02: Running: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/vagrant-shell20190509-32249-1lneyf.sh
    k8s-worker-lx02: This is worker
    k8s-worker-lx02: Loaded plugins: fastestmirror
    k8s-worker-lx02: Loading mirror speeds from cached hostfile
    k8s-worker-lx02:  * base: repos.del.extreme-ix.org
    k8s-worker-lx02:  * epel: repos.del.extreme-ix.org
    k8s-worker-lx02:  * extras: repos.del.extreme-ix.org
    k8s-worker-lx02:  * updates: repos.del.extreme-ix.org
    k8s-worker-lx02: Resolving Dependencies
    k8s-worker-lx02: --> Running transaction check
    k8s-worker-lx02: ---> Package sshpass.x86_64 0:1.06-2.el7 will be installed
    k8s-worker-lx02: --> Finished Dependency Resolution
    k8s-worker-lx02: 
    k8s-worker-lx02: Dependencies Resolved
    k8s-worker-lx02: 
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02:  Package           Arch             Version              Repository        Size
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Installing:
    k8s-worker-lx02:  sshpass           x86_64           1.06-2.el7           extras            21 k
    k8s-worker-lx02: 
    k8s-worker-lx02: Transaction Summary
    k8s-worker-lx02: ================================================================================
    k8s-worker-lx02: Install  1 Package
    k8s-worker-lx02: Total download size: 21 k
    k8s-worker-lx02: Installed size: 38 k
    k8s-worker-lx02: Downloading packages:
    k8s-worker-lx02: Running transaction check
    k8s-worker-lx02: Running transaction test
    k8s-worker-lx02: Transaction test succeeded
    k8s-worker-lx02: Running transaction
    k8s-worker-lx02:   Installing : sshpass-1.06-2.el7.x86_64                                    1/1
    k8s-worker-lx02:  
    k8s-worker-lx02:   Verifying  : sshpass-1.06-2.el7.x86_64                                    1/1
    k8s-worker-lx02:  
    k8s-worker-lx02: 
    k8s-worker-lx02: Installed:
    k8s-worker-lx02:   sshpass.x86_64 0:1.06-2.el7                                                   
    k8s-worker-lx02: Complete!
    k8s-worker-lx02: Warning: Permanently added '192.168.56.105' (ECDSA) to the list of known hosts.
    k8s-worker-lx02: [preflight] Running pre-flight checks
    k8s-worker-lx02: [preflight] Reading configuration from the cluster...
    k8s-worker-lx02: [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
    k8s-worker-lx02: [kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.14" ConfigMap in the kube-system namespace
    k8s-worker-lx02: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    k8s-worker-lx02: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    k8s-worker-lx02: [kubelet-start] Activating the kubelet service
    k8s-worker-lx02: [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
    k8s-worker-lx02: 
    k8s-worker-lx02: This node has joined the cluster:
    k8s-worker-lx02: * Certificate signing request was sent to apiserver and a response was received.
    k8s-worker-lx02: * The Kubelet was informed of the new secure connection details.
    k8s-worker-lx02: 
    k8s-worker-lx02: Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
```

