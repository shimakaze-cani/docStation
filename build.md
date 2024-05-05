<!--
 * @Description: 
 * @version: 
 * @Author: cani
 * @Date: 2024-05-04 18:55:53
 * @LastEditors: cani
 * @LastEditTime: 2024-05-04 21:44:47
-->
# 部署mkdocs-meterial docker文档

使用docker方式部署，未能使用群晖DSM部署，可以下载但无法运行，缺少yml文件

#### 1. 使用ssh登录DSM
```
ssh xxx@server
```

使用docker命令即可部署，首先切换到/docker/mkdocs下
#### 2. 建立Dockerfile

内容如下：
```Dockerfile
FROM squidfunk/mkdocs-material
RUN pip install mkdocs-macros-plugin
RUN pip install mkdocs-glightbox
```
经使用ai查询后 docker pull后会将镜像保存在本地，Dockerfile在使用该镜像作为基镜像后会直接从本地拉取，所以有所帮助

#### 3. 建立镜像（使用Dockerfile）
使用docker build 命令使用 Dockerfile 创建镜像
``` shell
sudo docker build -t squidfunk/mkdocs-material .
```

#### 4. 运行容器
``` shell
sudo docker run --rm --name mkdocs -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material &
```
在上述命令中对容器命名