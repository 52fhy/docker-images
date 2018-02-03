# dockerui

|[microbox/**dockerui**](https://registry.hub.docker.com/u/microbox/dockerui/)|16MB |`latest` `0.7.0` `0.5.0` `0.4.0`| 

## 获取
```
docker pull microbox/dockerui:latest
```

## 运行

```
docker run -d --restart=always -p 9009:9000 -v /var/run/docker.sock:/docker.sock microbox/dockerui:latest
```

Visit http://docker-ip:9009/ to see the WebUI for docker