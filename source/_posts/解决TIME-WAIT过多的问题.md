---
title: 解决TIME_WAIT过多的问题
date: 2020-02-09 22:48:30
categories: 网络
tags: TCP
---

- TIME_WAIT产生原因
一般在是TCP断开连接时，主动断开的一方会进入到TIME_WAIT的状态。此状态
会保留2MSL时间（30s 1min 2min不等）
<br>
在web应用中，基于TCP的http短连接通常由Server端先断开连接，往往Server端会产生TIME_WAIT连接记录，
在高并发的应用中，此状态的连接较多。

- 解决办法
配置文件中写入 net.ipv4.tcp_tw_recycle=1  　表示开启TCP连接中TIME-WAIT sockets的快速回收

-参考连接
[解决TIME_WAIT过多造成的问题](https://www.cnblogs.com/dadonggg/p/8778318.html)
<br>
[阿里ECS/Linux大量TIME_WAIT解决方案](https://blog.csdn.net/hemin1003/article/details/82963558)