---
title: 阿里巴巴ihome团队面试
date: 2020-03-03 20:33:18
categories: 面试
tags: alibaba
---
#### 一面

- 自我介绍
- 中间件比赛、负载均衡算法　使用什么java组件，底层怎么实现的，业界有哪些负载均衡算法以及优缺点
- springboot springcloud 了解和使用经验,使用到springcloud哪些模块
- 让你自己实现rpc，讲解下思路
    - 将注册中心分离开使用请求方式注册发现服务，使用spring resttemplate发送请求调用提供者服务
<!--more-->
- http协议是哪层协议，协议组成
- 不使用现有http组件请求
    socket serverSocket  
- 异步非堵塞如何使用
    换成socketChannel serverSocketChannnel可以完成非堵塞，异步还需要返回句柄
- 为什么能完成非堵塞功能
    selector 不用等待io写，到达请求后分配线程处理
- 这一块是用操作系统还是jvm来完成
    操作系统　fd epoll
- 对jvm了解吗
- 垃圾回收原理
- springbean 放在内存哪块区域
- springbean 一般是单例吗　可以是多例吗
- bean会一直存在spring 容器里吗
- spring在后台开发中作用
- mysql索引有哪些
- mysql实现join b+树索引和hash索引有什么区别
    不清楚
- 说说b+树，为什么使用B+树索引
- mysql表上建的索引有哪些
- 不是主键索引是什么索引，二级索引了解过吗
    不清楚
- 事务中了解过吗
- 都完成都不完成属于数据库哪个特性，还有哪些特性
- 数据隔离性都有哪些级别，都有什么问题
- 数据库挂掉了如何恢复,什么机制
- 实习中收获比较大的事情
- 爱奇艺怎么样
- ihome团队了解过，做的是和马生鲜业务，排斥来杭州吗
- 有哪些要问我的吗？(你看我这边技术栈还有哪些要补充的,技术上需要再深入的地方，可否给些建议?)