---
title: Java容器
date: 2020-01-30 21:12:39
categories: Java
tags: Java
---

## 一、概览

容器主要包括Collection和Map两种，Collection存储着对象的集合，Map存储着键值对(两个对象)的映射表

### Collection

#### 1.Set

- TreeSet：基于红黑树实现，支持有序性操作，例如根据一个范围查找元素的操作
- HashSet：基于哈希表实现，不支持有序性操作
- LinkedHashSet：具有HashSet的查找效率，内部使用双向链表维护元素的插入顺序

#### 2.List

- ArrayList：基于动态数组实现，支持随机访问
- Vector：和ArrayList相似，但它是线程安全的
- LinkedList：基于双向链表实现，只能顺序访问。LinkedList还可以用作栈、队列和双向队列。
<!--more-->

#### 3.Queue

- LinkedList ： 可用作双向队列
- PriorityQueue：基于堆实现，可用作优先队列

### Map

- TreeMap：基于红黑树实现
- HashMap：基于哈希表实现
- HashTable：和HashMap相似，但它是线程安全的，但是一般不使用它，使用ConcurrentHashMap效率更高，因为引入了分段锁
- LinkedHashMap：使用双向链表来维护元素的顺序，顺序为插入顺序或者最近最少使用（LRU）顺序

## 二、容器中的设计模式

### 迭代器模式

Collection继承了Iterable接口，其中的iterator()方法能够产生一个Iterator对象，通过这个对象可以遍历Collection中的元素。

### 适配器模式

java.util.Arrays#asList()可以把数组类型转换为List类型。

## 三、源码分析

### ArrayList

#### 1.概览

ArrayList基于数组实现，所以支持快速随机访问，RandomAccess接口标志该类支持快速随机访问。
数组默认大小为10。

#### 2.扩容

添加元素时使用ensureCapacityInternal()来保证容量足够，如果不够，扩容。
新容量大小为旧容量大小的1.5倍。
<br>
扩容操作需调用Arrays.copyOf()把原数组整个复制到新数组中，这个操作代价很高，因此最好在创建 ArrayList 对象时就指定大概的容量大小，减少扩容操作的次数。

#### 3.Fail-fast

modCount用来记录ArrayList结构发生变化的次数，在进行序列化或者迭代的时候，需要
比较前后modCount是否改变，若改变了需要抛出ConcurrentModificationException异常.

### Vector

#### 1.同步

使用synchronized进行同步

#### 2.比较

因为使用synchronized同步，所以开销要比ArrayList大一些


在使用方面，可使用Collections.synchronizedList()和CopyOnWriteArrayList代替

### CopyOnWriteArrayList

#### 1.读写分离

CopyOnWriteArrayList写操作时，加锁，将原有数组元素拷贝到一个新的数组中，写入元素，将原有数组指向新的数组，释放锁
读操作在原有数组中，读写分离，互不影响

CopyOnWriteArrayList 存在内存占用和数据不一致性问题
所以它不适合内存敏感以及对实时性要求高的场景

### LinkedList

基于双向链表实现

和ArrayList的区别可以归结为数组和链表的区别

### HashMap

#### 1.存储结构

内部维护一个Node类型的数组，作为hash表；Node数据结构包含4个字段，有key、value、next指针、int型hash值

数组的每一个位置被当做一个桶，一个桶存放一个链表。

#### 2.拉链法的工作原理

哈希表为解决hash冲突有开放地址法和链地址法。比较来说，链地址法更适合于大规模数据和不确定性数据的存储，处理冲突简单且不易出现堆积问题，节省空间
- 确定hash桶数组索引位置
key值取哈希值时采用高位运算使得hash值的高位通常也能参与到计算hash表值中，使用与运算代替取模提高一定的效率。
- HashMap的put方法
JDK 1.7 之前使用头插法、JDK 1.8 使用尾插法
![](https://awps-assets.meituan.net/mit-x/blog-images-bundle-2016/d669d29c.png)
- 扩容机制
在hash表容量扩大为两倍时，在rehash时有了一定的优化，在数组位置上只有一个元素时，rehash赋值到新的hash表；有多个元素时，根据扩容的位为1或0，进行优化

#### 3.参看链接
[Java 8系列之重新认识HashMap](https://tech.meituan.com/2016/06/24/java-hashmap.html)
[HashMap 相关面试题及其解答](https://www.jianshu.com/p/75adf47958a7)
#### 注意
(1) 扩容是一个特别耗性能的操作，所以当程序员在使用HashMap的时候，估算map的大小，初始化的时候给一个大致的数值，避免map进行频繁的扩容。

(2) 负载因子是可以修改的，也可以大于1，但是建议不要轻易修改，除非情况非常特殊。

(3) HashMap是线程不安全的，不要在并发的环境中同时操作HashMap，建议使用ConcurrentHashMap。

(4) JDK1.8引入红黑树大程度优化了HashMap的性能。

(5) 还没升级JDK1.8的，现在开始升级吧。HashMap的性能提升仅仅是JDK1.8的冰山一角。

    Q：HashMap，LinkedHashMap，TreeMap 有什么区别？
    
    A：HashMap 参考其他问题；
    LinkedHashMap 保存了记录的插入顺序，在用 Iterator 遍历时，先取到的记录肯定是先插入的；遍历比 HashMap 慢；
    TreeMap 实现 SortMap 接口，能够把它保存的记录根据键排序（默认按键值升序排序，也可以指定排序的比较器）
    
    Q：HashMap 和 HashTable 有什么区别？
    
    A：①、HashMap 是线程不安全的，HashTable 是线程安全的；
    ②、由于线程安全，所以 HashTable 的效率比不上 HashMap；
    ③、HashMap最多只允许一条记录的键为null，允许多条记录的值为null，而 HashTable 不允许；
    ④、HashMap 默认初始化数组的大小为16，HashTable 为 11，前者扩容时，扩大两倍，后者扩大两倍+1；
    ⑤、HashMap 需要重新计算 hash 值，而 HashTable 直接使用对象的 hashCode
    

### ConcurrentHashMap

[jdk1.7版本的ConcurrentHashMap解析](https://www.ibm.com/developerworks/cn/java/java-lo-concurrenthashmap/)
[HashMap？ConcurrentHashMap？相信看完这篇没人能难住你！](https://blog.csdn.net/weixin_44460333/article/details/86770169)
