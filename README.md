手順

```
vag box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box
vag init centos64
```

* 26行目を変更
```
  config.vm.network "private_network", ip: "192.168.33.20"
```
```
vag ssh-config --host harmony >> ~/.ssh/config
```
