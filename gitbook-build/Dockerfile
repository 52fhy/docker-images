FROM daocloud.io/library/node:10.21.0-alpine3.11

# https://dashboard.daocloud.io/packages/6564230d-84b5-4789-90f9-98c298ab071b
# https://juejin.im/post/6866073251295002638

RUN  npm install gitbook-cli -g --registry https://registry.npm.taobao.org/
EXPOSE 4000
CMD ["gitbook", "serve"]
