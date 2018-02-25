# CentOS

官方镜像地址：https://hub.docker.com/_/centos/

https://github.com/docker-library/docs/tree/master/centos

获取：
```
docker pull centos
```

## CentOS

CentOS 是一个基于 RedHat Linux 提供的可自由使用源代码的企业级 Linux 发行版本。每个版本的 CentOS 都会获得十年的支持（通过安全更新方式）。 新版本的 CentOS 大约每两年发行一次，而每个版本的 CentOS 会定期（大概每六个月）更新一次，以便支持新的硬件。 这样，建立一个安全、低维护、稳定、高预测性、高重复性的 Linux 环境。 CentOS 是 Community Enterprise Operating System 的缩写。

### 支持的tag

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


### centos68

仓库地址：https://github.com/CentOS/sig-cloud-instance-images/tree/f32666d2af356ed6835942ed753a4970e18bca94/docker

### centos7

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


## 如何使用这个镜像？

### 持续构建

标签daocloud.io/centos:latest总是指向了最新的可用版本。

CentOS 项目会对所有活跃操作系统版本进行定期的更新，这些镜像会每月更新或者针对紧急情况立刻更新。这些持续构建的镜像只会打上主版本标签，比如：
```
docker pull daocloud.io/centos:6

docker pull daocloud.io/centos:7
```

### 小版本标签

除此之外，还会根据操作系统厂商提供的不同版本提供包括小版本的镜像。请注意，这些小版本的镜像一旦推出就不会更新了。 如果您选择这些镜像，强烈推荐您在 Dockerfile 里包括RUN yum -y update && yum clean all， 否则有可能会有安全隐患。 这些镜像的使用方式如下：
```
docker pull daocloud.io/centos:5.11
```

## 包管理

默认情况下，为了减小镜像的尺寸，在构建 CentOS 镜像时用了yum的nodocs选项。 如果您安装一个包后发现文件缺失，请在/etc/yum.conf中注释掉tsflogs=nodocs并重新安装您的包。

## systemd 整合

>仅针对CentOS7及以上。

当前，因为 systemd 要求 CAPSYSADMIN 权限，从而得到了读取主机 cgroup 的能力，CentOS7 中已经用 fakesystemd 代替了 systemd 来解决依赖问题。 如果您仍然希望使用 systemd，可用参考下面的 Dockerfile：
```
FROM daocloud.io/centos:7
MAINTAINER "you" <your@email.here>
ENV container docker
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i ==
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
```

上面这个Dockerfile首先删除了 fakesystemd 并且安装了 systemd。然后您就可以构建基础镜像了。
```
docker build --rm -t local/c7-systemd .
```

### 一个包含 systemd 的应用容器示例

为了使用像上面那样包含 systemd 的容器，你需要创建一个类似下面的Dockerfile：
```
FROM local/c7-systemd
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
EXPOSE 80
CMD ["/usr/sbin/init"]
```

构建镜像:
```
docker build --rm -t local/c7-systemd-httpd
```

### 运行一个包含 systemd 的应用容器

为了运行一个包含 systemd 的容器，您需要使用--privileged选项， 并且挂载主机的 cgroups 文件夹。 下面是运行包含 systemd 的 httpd 容器的示例命令：
```
docker run --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-httpd
```

## 支持的Docker版本

这个镜像在 Docker 1.7.0 上提供最佳的官方支持，对于其他老版本的 Docker（1.0 之后）也能提供基本的兼容。

