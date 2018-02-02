FROM daocloud.io/ubuntu:16.04

MAINTAINER linuxidc "yujc@52fhy.com"

RUN apt-get -y update && apt-get install -y language-pack-en-base && locale-gen en_US.UTF-8 && \
	apt-get -y install software-properties-common && LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php &&  \
	apt-get -y update && \
	apt-get -y install vim git wget curl zlib1g-dev && \
	apt-get install php7.1 php7.1-pdo  php7.1-pdo-mysql php7.1-mysql php7.1-mysqli php7.1-fpm php7.1-curl php7.1-xml php7.1-mcrypt php7.1-json php7.1-gd php7.1-mbstring php7.1-sockets php7.1-memcache php7.1-memcached php7.1-redis php7.1-xdebug php7.1-yac php7.1-phalcon  php7.1-msgpack   php7.1-tidy php7.1-propro php7.1-mongodb && \
	apt-get install php7.1-dev 
	
RUN pecl install seaslog && \ 
	pecl install swoole  && \
	echo "extension=seaslog.so" > /etc/php/7.1/cli/php.ini && \
	echo "extension=seaslog.so" > /etc/php/7.1/fpm/php.ini && \
	echo "extension=swoole.so" > /etc/php/7.1/cli/php.ini && \
	echo "extension=swoole.so" > /etc/php/7.1/fpm/php.ini 
	
RUN wget http://nginx.org/download/nginx-1.12.2.tar.gz && \
	tar -zxvf nginx-1.12.2.tar.gz  && cd nginx-1.12.2 && \
	./configure \
		--prefix=/usr/local/nginx \
		--with-http_stub_status_module  \
		--with-http_realip_module \
		--with-http_sub_module \
		--with-pcre && \
	make && make install && \
	ln -sf /usr/local/nginx/sbin/nginx /usr/sbin  && mkdir -p /run/php && cd -
	
ADD ./run.sh /run.sh
RUN chmod 755 /run.sh

CMD /run.sh && tail -f

EXPOSE 80
EXPOSE 9000


# docker build -t php71-fpm-nginx:1.0 .
