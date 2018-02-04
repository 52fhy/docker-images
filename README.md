# docker-images

���ֿ�Ϊ�Զ��弰�ղص�һЩ���񣬷���ʹ�á�����PHP5��PHP7���������Ⱦ���


## Docker��������

``` bash
# ���ؾ���
docker pull IMAGE[:TAG]
docker pull daocloud.io/centos:6.8

# �鿴�����ؾ����б�
docker images [-a]

# ��������ӱ�ǩ
docker tag  IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
dcoker tag daocloud.io/centos:6.8 centos:6.8

# ɾ�����񣺱�����ɾ�������þ������������ɾ������
docker rmi [OPTIONS] IMAGE [IMAGE...]

# ��������������
docker run [OPTIONS] IMAGE [COMMOND] [ARG...]
docker run -it daocloud.io/centos:6.8 /bin/bash

# ��������
docker start CONTAINER_ID

# ֹͣ����
docker stop CONTAINER_ID 

# ɾ������
docker rm CONTAINER_ID 

# ִ������������
docker exec [-d] [-i] [-t] CONTAINER_ID  [COMMOND] [ARG...]
docker exec -it 4b5634aaef69 /bin/bash
docker exec 4b5634aaef69 ps -ef
docker exec 4b5634aaef69 nginx -s reload

# ��������
docker save [OPTIONS] IMAGE [IMAGE...]
docker save -o ubuntu_latest.tar ubuntu:latest

# ���뾵��
docker load --input ubuntu_latest.tar
docker load < ubuntu_latest.tar
```

## ����ֿ�

- https://hub.docker.com/explore/
- https://dashboard.daocloud.io/
- https://c.163.com/

## ���������

1�������� DaoCloud - ҵ�����ȵ�������ƽ̨  
https://www.daocloud.io/mirror#accelerator-doc

2��������� | Docker �й�  
https://www.docker-cn.com/registry-mirror

## ѧϰ����

1��Docker - ��ʷ��� - �ɺ�Ӱ~ - ����԰  
http://www.cnblogs.com/52fhy/category/895062.html

