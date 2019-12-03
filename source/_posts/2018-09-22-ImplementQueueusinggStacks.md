---
layout: post
title:  "232. Implement Queue using Stacks"
date:   2018-09-22 22:59:36
categories: leetcode
tags: stack
---



# Question: Implement the following operations of a queue using stacks.

  用两个栈就可以实现一个队列的操作，注意判断栈是否为空
  
```
	class MyQueue {
    /** Initialize your data structure here. */
     Stack<Integer> stack1=new Stack<>();
	Stack<Integer> stack2=new Stack<>();
    public MyQueue() {
       
    }
    
    public void push(int x) {
			while(!stack2.isEmpty())
				stack1.push(stack2.pop());
			stack1.push(x);
		}
		public int pop() {
			while(!stack1.isEmpty())
				stack2.push(stack1.pop());
			int x=stack2.pop();
			return x;
		}
		public int peek() {
			while(!stack1.isEmpty())
				stack2.push(stack1.pop());
			return stack2.peek();
		}
		public boolean empty() {
			if(stack1.isEmpty()&&stack2.isEmpty())
				return true;
			else
				return false;
		}
}
```