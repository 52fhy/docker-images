# docker-images

本仓库为自定义及收藏的一些镜像，方便使用。包含PHP5、PHP7开发环境等镜像。


## Docker常用命令

``` bash
# 下载镜像
docker pull IMAGE[:TAG]
docker pull daocloud.io/centos:6.8

# 查看已下载镜像列表
docker images [-a]

# 给镜像添加标签
docker tag  IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
dcoker tag daocloud.io/centos:6.8 centos:6.8

# 删除镜像：必须先删除依赖该镜像的容器才能删除镜像
docker rmi [OPTIONS] IMAGE [IMAGE...]

# 创建并运行容器
docker run [OPTIONS] IMAGE [COMMOND] [ARG...]
docker run -it daocloud.io/centos:6.8 /bin/bash

# 启动容器
docker start CONTAINER_ID

# 停止容器
docker stop CONTAINER_ID 

# 删除容器
docker rm CONTAINER_ID 

# 执行容器内命令
docker exec [-d] [-i] [-t] CONTAINER_ID  [COMMOND] [ARG...]
docker exec -it 4b5634aaef69 /bin/bash
docker exec 4b5634aaef69 ps -ef
docker exec 4b5634aaef69 nginx -s reload

# 导出镜像
docker save [OPTIONS] IMAGE [IMAGE...]
docker save -o ubuntu_latest.tar ubuntu:latest

# 导入镜像
docker load --input ubuntu_latest.tar
docker load < ubuntu_latest.tar
```

## 镜像仓库

- https://hub.docker.com/explore/
- https://dashboard.daocloud.io/
- https://c.163.com/

## 镜像加速器

1、加速器 DaoCloud - 业界领先的容器云平台  
https://www.daocloud.io/mirror#accelerator-doc

2、镜像加速 | Docker 中国  
https://www.docker-cn.com/registry-mirror

## 学习资料

1、Docker - 随笔分类 - 飞鸿影~ - 博客园  
http://www.cnblogs.com/52fhy/category/895062.html

