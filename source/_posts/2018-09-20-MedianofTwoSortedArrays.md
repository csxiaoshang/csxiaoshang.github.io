---
layout: post
title:  "4. Median of Two Sorted Arrays"
date:   2018-09-20 10:04:36
categories: leetcode
tags: learning Array
---



## Question: There are two sorted arrays nums1 and nums2 of size m and n respectively.Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).You may assume nums1 and nums2 cannot be both empty.

这道题比较简单，就是讲两个数组合并下然后排序，找中位数就可以了

<!--more-->

```java
class Solution {
	public static double findMedianSortedArrays(int[] nums1,int[] nums2) {
		int[] shuzu=Arrays.copyOf(nums1,nums1.length+nums2.length);
		System.arraycopy(nums2, 0, shuzu, nums1.length, nums2.length);
		Arrays.sort(shuzu);
		int num=nums1.length+nums2.length;
		double count=0;
		if(num%2==0) {
			 count=(double)(shuzu[num/2-1]+shuzu[num/2])/2;
		}else {
			count=(double)shuzu[(num-1)/2];
		}
		return count;
	}
	}
```