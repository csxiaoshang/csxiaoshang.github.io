---
layout: post
title:  "20.Valid Parentheses"
date:   2018-09-17 23:02:20
categories: leetcode
tags: learning
---

>这是一道比较简单的堆栈题目，但是本人很少用java写程序做题，做题的过程中出了很多错误，也上网百度了下，算是完成了
```
	public boolean isValid(String s) {
		Stack<Character> stack=new Stack<Character>();
		for(int i=0;i<s.length();i++){
			char ch=s.charAt(i);
			switch (ch) {
			case '(':
			case '[':
			case '{':
				stack.push(ch);
				break;
			case ')':
				if((stack.isEmpty())||stack.peek()!='(')
					return false;
				else
					stack.pop();
				break;
			case ']':
				if((stack.isEmpty())||stack.peek()!='[')
					return false;
				else
					stack.pop();
				break;
			case '}':
				if((stack.isEmpty())||stack.peek()!='}')
					return false;
				else
					stack.pop();
				break;
			default:
				break;
			}
		}
		if(!stack.isEmpty())
			return false;
		return true;
	}
```