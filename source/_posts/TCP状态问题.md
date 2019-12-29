---
title: TCP状态问题
date: 2019-12-27 11:10:46
categories: 网络
tags: TCP
---

#### TCP三次握手建立连接

- Client发送带有SYN和seq = x的包到Server;Client转为SYN_SENT
- Server返回SYN、ACK、ack = x +1和seq = y的包，Server从LISTEN切换到SYN_RCVD
- Client发送ACK、 ack = y +1和seq = x+1 的包，都转为ESTABLISHED

<!--more-->

三次握手的主要目的是：**信息对等和防止超时**。防止超时导致脏连接。
如果使用的是两次握手建立连接，假设有这样一种场景，客户端发送了第一个请求连接并且没有丢失，只是因为在网络结点中滞留的时间太长了，由于TCP的客户端迟迟没有收到确认报文，以为服务器没有收到，此时重新向服务器发送这条报文，此后客户端和服务器经过两次握手完成连接，传输数据，然后关闭连接。
此时此前滞留的那一次请求连接，网络通畅了到达了服务器，这个报文本该是失效的，但是，两次握手的机制将会让客户端和服务器再次建立连接，这将导致不必要的错误和资源的浪费。如果采用的是三次握手，就算是那一次失效的报文传送过来了，服务端接受到了那条失效报文并且回复了确认报文，但是客户端不会再次发出确认。由于服务器收不到确认，就知道客户端并没有请求连接。
                  



#### TCP四次挥手释放连接

- Client发送带有FIN和seq = x的包到Server，Client从ESTABLISHED转为FIN_WAIT_1
- Server发送带有Ack 、ack= x+1和seq = y的包到Client，Server进入到CLOSE_WAIT状态
- Client收到确认请求后，进入FIN_WAIT_2，等待服务器发送释放报文
- Server最后的数据发送完毕后，便发送释放报文，FIN = 1,ack = x+1 和 seq = w ,Server进入到LAST_ACK状态
- Client收到释放报文后，发出ACK、ack = w+1和seq = x+1，进入到TIME_WAIT状态。这是TCP连接还没有释放，必须等待2
MSL（最长报文段寿命）时间后，当Client撤销相应的TCB后，才进入CLOSED状态
- Server只要收到了客户端发出的确认，立即进入CLOSED状态。Server结束TCP连接的时间要比客户端早一些。
