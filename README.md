# marshalsec-docker
`marshalsec`的`docker`镜像构建文件

## 测试截图
![](http://pic.scriptboy.cn/20200406173519.png)

## 开始构建
命令`docker build --build-arg EXPNAME=ExportObject --build-arg PORT=1389 --build-arg MSSWAY=rmi --build-arg JAVAVER=1.6 -t marshalsec .`可以很轻松的构建出一个默认`1.6`版本的`rmi`服务，或使用`./run_marshalsec_jndi_server.sh`。

参数说明：
- `EXPNAME`：`exp`文件的名称，不含`java`后缀，默认`ExportObject`
- `PORT`：暴露的端口号，默认`1389`
- `MSSWAY`：`rmi`和`ldap`二选一，注意大小写，默认`rmi`
- `JAVAVER`：编译向下兼容的版本，默认`1.6`，最高`1.8`

构建镜像名称为`marshalsec`，启动容器和镜像同名！

## 简单使用

将自己的`payload`文件放在`./exp`目录下，修改`run_marshalsec_jndi_server.sh`中`EXPNAME`参数指定你的`payload`名称。

## 复杂操作

在`container`中`/exp/`目录下可以找到几乎所有文件，`marshalsec`源文件目录在`/marshalsec/`下。

进入镜像：`docker exec -it marshal /bin/bash`。

## 常见问题

- `maven`如何自定义镜像加速源？

  修改`./settings.xml`中的`mirrors`节点，默认使用`huawei`源。

- 其他问题？
  
  可以在`issue`提问，或到[blog1](https://scriptboy.cn)或[blog2](https://www.cnblogs.com/lxmwb)评论区提问。

## 项目引用
- [marshalsec](https://github.com/mbechler/marshalsec)