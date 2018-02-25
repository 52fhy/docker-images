
# php56-fpm-centos68

基于 centos:6.8 镜像。

php5.6的开发环境。包含：

- CentOS 6.8
- PHP 5.6.33
- php-fpm
- Nginx 1.12.2
- Redis 3.2.6

包含的PHP附加扩展：

- swoole 1.10.1
- phpredis 3.1.2
- yar 1.2.5

相关目录：

- php根目录：/usr/local/php/
- php可执行程序目录：/usr/local/php/bin/、/usr/local/php/sbin/
- php配置目录：/usr/local/php/etc/
- nginx根目录：/usr/local/nginx/
- nginx可执行程序目录：/usr/local/nginx/sbin/
- nginx配置目录：/usr/local/nginx/conf/

## 如何使用

1、首次使用需要先编译成镜像：

``` bash
cp -rf ../php70-fpm-centos68/*gz ./
docker build -t php56-fpm-centos68 .
```
或者执行bulid.sh。

编译需要30分钟左右。实际视机器性能而定。

如果不能COPY当前目录的已下载文件，那么可以指定 Dockerfile_online ：
``` bash
docker build -t php56-fpm-centos68 -f  Dockerfile_online .
```
该Dockerfile会联网下载所需要的资源。

2、编译完成后可以创建容器了。默认会自动启动Nginx、php-fpm服务：

``` bash
docker run -d --name yphp -p 80:80 -p 9000:9000 -v /work/:/work/ php56-fpm-centos68
docker ps
```

其中`-v /work/:/work/`指定将本机的`/work`目录挂载到容器内的`/work`目录。建议挂载。本机的`/work`目录必须存在。

`docker ps`看到的内容：

```
CONTAINER ID 	IMAGE    		COMMAND 	CREATED 		STATUS 			PORTS 										NAMES
db13127cb76b php56-fpm-centos68  "/run.sh"   1 second ago  Up 1 second   0.0.0.0:80->80/tcp, 0.0.0.0:9000->9000/tcp   yphp
```
表名容器正则运行。如果`STATUS`是Exit(1)则说明容器异常退出，如果Exit(0)说明容器只执行了命令就立即退出了。
可以使用`docker logs db13127cb76b` 查看容器具体退出情况。db13127cb76b是某个容器ID（CONTAINER ID）。
如果是Exit(0)可能是没有维持住后台运行，建议在命令加入`tail -f`这种可以一直运行的命令。

3、如果想自行配置php.ini、nginx.conf，可以将配置目录映射到宿主机：
``` bash 
docker run -d --name yphp -p 80:80 -p 9000:9000 \
	-v /work/:/work/  \
	-v "/work/yphp/php/etc/":/usr/local/php/etc/  \
	-v "/work/yphp/nginx/conf/":/usr/local/nginx/conf/  \
	-v "/work/yphp/nginx/logs/":/usr/local/nginx/logs/  \
	php56-fpm-centos68 
```

其中`/work/yphp`是本地宿主机的一个目录，里面包含php和nginx的配置，目录结构：
```
/work/yphp/
|--nginx
	|--conf
		|--nginx.conf
		|--vhost
|--php
	|--etc
		|--php.ini
		|--php-fpm.d
			|--www.conf
```
如果不想对每个配置都进行映射，也可以指定需要映射的配置文件：
```bash
docker run -d --name yphp -p 80:80 -p 9000:9000 \
	-v /work/:/work/  \
	-v "/work/yphp/php/etc/php.ini":/usr/local/php/etc/php.ini  \
	-v "/work/yphp/nginx/conf/nginx.conf":/usr/local/nginx/conf/nginx.conf  \
	-v "/work/yphp/nginx/conf/vhost/":/usr/local/nginx/conf/vhost/  \
	-v "/work/yphp/nginx/logs/":/usr/local/nginx/logs/  \
	php56-fpm-centos68
```

>注意：由于这里覆盖了php.ini，所以想要开启第三方扩展的话，想要提前在php.ini里追加：
```
extension=redis.so
extension=swoole.so
extension=yar.so
```

或者启动后追加然后重启容器里的php-fpm：
``` bash
docker exec 容器ID killall php-fpm
docker exec 容器ID php-fpm
```

4、如果不需要一开始就运行服务，想进入容器自行启动，可以直接进入容器：
``` bash
docker run -it --name yphp -v /work/:/work/ php56-fpm-centos68 /bin/bash
```

退出容器使用exit。

5、想对当前容器打包为镜像，方便后续使用：（需要先停止容器）
``` bash
# 从容器生成镜像
# -m 加一些改动信息，-a 指定作者相关信息，db13127cb76b这一串为容器id，再后面为新镜像的名字
docker commit -m "create images" -a "52fhy"  db13127cb76b  php56-fpm-centos68:yphp_v1 

# 导出镜像
docker save -o yphp.tar php56-fpm-centos68:yphp_v1

# 导入镜像
docker load --input yphp.tar
```

导出的镜像可以压缩以节约空间。

6、增加PHP扩展  

有下面几种方法，只要编译出了.so文件就简单了。以演示xdebug为例：

1) 如果已经编译好了.so文件，直接复制到挂载目录(例如`/work`)。使用`docker exec -it 容器ID /bin/bash`进入容器，通过`php-config`可以看到扩展所在目录，复制到该目录，修改php.ini，追加`zend_extension=xdebug.so`，重启php-fpm即可。

>注：一般扩展都是`extension=xxx.so`，xdebug特殊。

2) 需要先进入容器，使用`pecl install xdebug`自动编译生成.so文件。会自动复制到扩展目录。修改php.ini重启php-fpm生效。

3) pecl如果提示找不到该扩展，则使用源码编译。例如：
``` bash
git clone https://github.com/xdebug/xdebug.git
cd xdebug/
git checkout xdebug_2_5
phpize 
./configure 
make
make install
```

>注：php5.6只能使用2.5及以下版本xdebug。

一般可以在pecl.php.net找到源码。例如：http://pecl.php.net/package/xdebug 。编译方法差不多：
``` bash
wget http://pecl.php.net/get/xdebug-2.5.5.tgz \
    && tar xzf xdebug-2.5.5.tgz && cd xdebug-2.5.5/ \
	&& phpize \
    && ./configure \
    && make && make install
```





