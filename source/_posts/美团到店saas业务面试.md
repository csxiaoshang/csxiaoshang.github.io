---
title: 美团到店Saas业务部门面试
date: 2020-03-19 11:39:20
categories: 面试
tags: 美团
---
- 一面
    - HashSet的实现;如何判断不重复;插入数据是头插入还是尾插入
        同样要遍历比较key，为啥要采用头插入
        <!--more-->
    - 多线程了解吗;x打印值的范围为多少；如何是打印值为200，有几种方法
```java
        public class Test implements Runnable{
        static int x;
        @override
        public void run(){
          for(int i=0;i<100;i++){
          x++;
}
}
     public static void main(String[] args){
         Test test = new Test();
         new Tread(test).start();
         new Tread(test).start();
         system.out.println(x);
     }
  }
```
    - condition和barrier原理是什么
    - AQS是干什么用的;wait notify和park　unPark区别;AQS为何是双向链表;如何是实现公平锁和非公平锁
    - 两个线程交替打印"A" "B"  
```java
public class Test implement Runnable{
    ReentrantLock lock = new ReenTrantLock();
    Condition condition = lock.condition();
    public void run1(){
        while(true){
            // condition
               system.out.println("A");
            // condition
        }
    }
    public void run1(){
                while(true){
            // condition
               system.out.println("B");
            // condition
        }
    }
    public static void main(String[] args){
        Test test = new Test();
        new Thread((test) -> {        while(true){
            // condition
               system.out.println("A");
            // condition
        }}).start();
        new Thread(() -> {                while(true){
            // condition
               system.out.println("B");
            // condition
        }}).start();
    }
}


// AtomicInteger

public static void main(String[] args){
    public volatile AtomicInteger count = new AtomicInteger(1);
    new Thread((count)->{
        while(true){
            if(count == 1){
                               system.out.println("A");
                count.getAndIncrement();
            }
        }
    }).start();
    new Thread((count)->{
        while(true){
            if(count == 2){
                system.out.println("B");
                count.getAndDec();
            }
        }
    }).start();
}
 ```
    - 二叉树前序遍历非递归实现，后序遍历非递归实现
 ```
// pre

public void solution(TreeNode node ){
    LinkedList<TreeNode> stack = new LinkedList<>();
    if(node == null){
        return;
    }
    stack.push(node);
    // visit node;
    while(!stack.isEmpty()){
        TreeNode tem = stack.peak();
        if(tem.left!=null){
            // visit tem.left;
            stack.push(tem.left);
            tem.left == null;
        }else{
            stack.pop();
            if(tem.right!=null){  
                // visit tem.right
                stack.push(tem.right);
            }
        }
    }
}
```
    - 订单表为何使用自增id作为主键为何不适用uuid
    - 数据库如何回滚;多个事务如何访问数据，多个事务如何保证访问数据是安全的;
    - x > x + 1　程序员角度什么情况下会发生