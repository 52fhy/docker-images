
# gitbook-build-template

gitbook构建镜像，基于node:10.21.0-alpine3.11构建。生成的新镜像包含有gitbook命令。

> gitbook已不再更新，使用最新版node会报错，推荐使用10.21.0版本。

使用该镜像编译markdown前无需执行`gitbook install`，因为已经内置了一份book.json配置，镜像本身已经执行过`gitbook install`了。适用于当前镜像book.json插件已经满足需求，不再需要增加插件的情况。

> 使用时需要使用`WORKDIR`命令切换到指定路径：`/home/build`，原因是gitbook插件已经安装到该目录了。

本镜像附带的book.json插件对于大部分情况已经适用了，使用该镜像能大大加快Markdow文件编译速度。


镜像使用示例：
``` Dockerfile
FROM node:10.21.0-alpine3.11-gitbook-build-template AS builder
WORKDIR /home/build
COPY . .
RUN  gitbook build

FROM nginx:1.13.0-alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /home/build/_book/ ./
# COPY --from=builder /home/build/conf/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
```

