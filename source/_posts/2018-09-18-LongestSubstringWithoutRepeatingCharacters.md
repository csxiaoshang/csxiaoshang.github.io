---
layout: post
title:  "3.Longest Substring Without Repeating Characters"
date:   2018-09-18 13:12:20
categories: leetcode
tags: learning set
---



## Question: Given a string, find the length of the longest substring without repeating characters.

这道题两个循环遍历找最大的子串也可以，但是那样会慢一些，这里借助set的性质处理的这道题，感觉还可以用KMP算法，等回头做了再贴上来

<!--more-->

```java
	class Solution {
    public int lengthOfLongestSubstring(String s) {
        	int len=s.length();
		int ans=0;
		Set<Character> se=new HashSet<Character>();
		for(int i=0,j=0;j<len;) {
			if(!se.contains(s.charAt(j))) {
				se.add(s.charAt(j));
				j++;
				ans=Math.max(ans, j-i);
			}
			else {
				se.remove(s.charAt(i));
				i++;
			}
		}
		return ans;
    }
	}
```