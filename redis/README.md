# Redis

仓库官网：https://registry.hub.docker.com/_/redis/

获取：
```
docker pull redis
docker pull daocloud.io/library/redis
docker pull hub.c.163.com/library/redis
```

版本：

- 3.2.9 (latest)
- 3.2.9-alpine
- 3.2.0
- 3.2.0-alpine
- 3.0
- 3.0-alpine
- 4.0.0
- 4.0.0-alpine
- 2.8.6
- ...


Redis 是一个开源，基于内存的高性能 key-Value 数据库, 可用作数据库，高速缓存和消息队列代理。它支持字符串、哈希表、列表、集合、有序集合，位图，hyperloglogs 等数据类型。内置复制、Lua脚本、LRU收回、事务以及不同级别磁盘持久化功能，同时通过 Redis Sentinel 提供高可用，通过 Redis Cluster 提供自动分区。

## 启动一个Redis实例
```
$ docker run --name some-redis -d redis
```

这个镜像包含EXPOSE 6379 (Redis默认端口)，所以可以通过link容器的方式访问Redis(具体参考连接到Redis)

## 启动Redis持久化功能
```
$ docker run --name some-redis -d redis redis-server --appendonly yes
```

当开启了Redis的持久化功能，Redis会将数据储存到 VOLUME /data，我们可以通过 `--volumes-from some-volume-container` 或者`-v /docker/host/dir:/data`参数，将数据保存到主机，具体参考docs.docker volumes

关于更多Redis持久化功能请参考 http://redis.io/topics/persistence

## 从另一个容器连接到Redis
```
$ docker run --name some-app --link some-redis:redis -d application-that-uses-redis
```

## 通过redis-cli
```
$ docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
```

## 使用redis.conf配置文件

可以创建Dockerfile包含redis.conf 例如
```
FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
```

也可以通过docker run指定redis.conf
```
$ docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf
```
