---
layout: post
title:  "命令模式"
date:   2019-11-27 15:30:00
categories: 设计模式
tags: learning
---


- 命令模式

下图为命令模式类图
![](https://raw.githubusercontent.com/csxiaoshang/images/master/bolg/images20191127153840.png)
<br>
<br>
简单的看，命令模式实现了命令发起者和命令执行者的解耦，中间增加了一层调用者。
命令组合命令执行者，调用者中维护一个命令列表，并封装命令执行方法。命令发起者则将命令添加到命令调用者中。

<!--more--> 

```
class Client{
    putCommand(Command command,Receiver receiver);
}

class Invoker{
    List<Command> commandList;
    executeCommand(){
        commandList.forEach(command->command.execute());
    }
}

interface Command{
    execute();
}

class CommandA implements Command{
    Receiver receiver;
    execute(){
        receiver.action();
    }
}

class Receiver{
    action(){
        // 需要执行的业务逻辑
    }
}

```