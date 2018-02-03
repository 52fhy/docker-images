# docker-images

官方镜像地址：https://hub.docker.com/_/centos/

https://github.com/docker-library/docs/tree/master/centos

## 获取
```
docker pull centos
```

## 支持的tag

-	[`latest`, `centos7`, `7` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/79db851f4016c283fb3d30f924031f5a866d51a1/docker/Dockerfile)
-	[`centos6`, `6` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/4ab2be41cc943b7d34e3c3ac15164b9d7706dce8/docker/Dockerfile)
-	[`centos7.4.1708`, `7.4.1708` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/66add29c188e42d4d855f4d4acdb2b73d547edb6/docker/Dockerfile)
-	[`centos7.3.1611`, `7.3.1611` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/5bbaef9f60ab9e3eeb61acec631c2d91f8714fff/docker/Dockerfile)
-	[`centos7.2.1511`, `7.2.1511` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/a3c59bd4e98a7f9c063d993955c8ec19c5b1ceff/docker/Dockerfile)
-	[`centos7.1.1503`, `7.1.1503` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/bc561dfdd671d612dbb9f92e7e17dd8009befc44/docker/Dockerfile)
-	[`centos7.0.1406`, `7.0.1406` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/f1d1e0bd83baef08e257da50e6fb446e4dd1b90c/docker/Dockerfile)
-	[`centos6.9`, `6.9` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/4f329fe087b0152df26344cecee9ba30b03b1a7b/docker/Dockerfile)
-	[`centos6.8`, `6.8` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/f32666d2af356ed6835942ed753a4970e18bca94/docker/Dockerfile)
-	[`centos6.7`, `6.7` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/d0b72df83f49da844f88aabebe3826372f675370/docker/Dockerfile)
-	[`centos6.6`, `6.6` (*docker/Dockerfile*)](https://github.com/CentOS/sig-cloud-instance-images/blob/8911843d9a6cc71aadd81e491f94618aded94f30/docker/Dockerfile)


## centos68

仓库地址：https://github.com/CentOS/sig-cloud-instance-images/tree/f32666d2af356ed6835942ed753a4970e18bca94/docker

## centos7

仓库地址：https://github.com/CentOS/sig-cloud-instance-images/tree/79db851f4016c283fb3d30f924031f5a866d51a1/docker

## 加速镜像

### daocloud.io

https://www.daocloud.io/

1. 在 terminal 中登录 docker login daocloud.io
2. 输入 docker pull 并复制粘贴以下镜像地址
```
daocloud.io/library/centos:latest
daocloud.io/library/centos:centos6.6
daocloud.io/library/centos:6.8
daocloud.io/library/centos:7.1.1503
daocloud.io/library/centos:7.2.1511
```

### 网易

https://c.163yun.com/hub

```
hub.c.163.com/library/centos:latest
hub.c.163.com/library/centos:6.8
hub.c.163.com/library/centos:7.2.1511
```

网易修改版：（yum 源更换为网易源，并安装了常用软件 openssh-server、supervisor、vim、tar、wget、curl、rsync、bzip2、iptables、tcpdump、less、telnet、net-tools、lsof、sysstat、cron。）
https://c.163yun.com/hub#/m/repository/?repoId=1055


### 阿里云

https://dev.aliyun.com/search.html

需要登录使用。