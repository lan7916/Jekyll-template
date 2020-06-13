---
layout: post 
title: "LeetCode分类题解"
thumb: /img/in-post/thumbs/wiki.png
category: wiki
tags:  "LeetCode"
---
# 说明
本文主要是将[14种分类题解](https://hackernoon.com/14-patterns-to-ace-any-coding-interview-question-c5bb3357f6ed)进行翻译。这篇博文主要讲了14中类型的LeetCode的题解问题，本文也是在此基础上进行了翻译而已。同时如果要看具体的题目和题解，可以查看本人写的所有分类问题的题目解答-[LeetCode分类题解](http://leetcode-gitbook.znfang.ml/)

# 数组
此类型的题目，没有固定的模式，只能看自己的经验

其中每道题都存在一种暴力解法，如果实在没有更好的解法，可以尝试暴力解法

## 经典题目(英文)
- [First Missing Positive](https://leetcode.com/problems/first-missing-positive)
- [Rotate Image](https://leetcode.com/problems/rotate-image)
- [Spiral Matrix](https://leetcode.com/problems/spiral-matrix)
- [Set Matrix Zeroes](https://leetcode.com/problems/set-matrix-zeroes)
- [Word Search](https://leetcode.com/problems/word-search)
- [Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence)
- [Single Number](https://leetcode.com/problems/single-number)
- [Contains Duplicate](https://leetcode.com/problems/contains-duplicate)
- [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self)
- [Missing Number](https://leetcode.com/problems/missing-number)
- [Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)
- [Find All Duplicates in an Array](https://leetcode.com/problems/find-all-duplicates-in-an-array)
- [Find All Numbers Disappeared in an Array](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array)
- [Circular Array Loop](https://leetcode.com/problems/circular-array-loop)
- [Shortest Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray)
- [Number of Matching Subsequences](https://leetcode.com/problems/number-of-matching-subsequences)

# 滑动窗口
## 知识原理
一般从第一个元素开始，一直往右一个一个元素移动，滑动窗口的可以固定，也可以变换，如图所示

![滑动窗口原理](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-8i6d3wi0)

## 主要题解
- 用来执行数组或链表上某个区间(窗口)上的操作
- 输入是线性结构，如，链表，数组，字符串，求最长/最短字符串或者某些特定长度的要求

## 经典题目(英文)
- [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters)
- [Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words)
- [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring)
- [Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum)
- [Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum)
- [Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement)
- [Permutation in String](https://leetcode.com/problems/permutation-in-string)
- [Count Unique Characters of All Substrings of a Given String](https://leetcode.com/problems/count-unique-characters-of-all-substrings-of-a-given-string)
- [Fruit Into Baskets](https://leetcode.com/problems/fruit-into-baskets)
- [Minimum Number of K Consecutive Bit Flips](https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips)

# 双指针
## 知识原理
- 两个指针朝左右两个方向移动，直到他们其中有一个或者两个满足条件

![base](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-x4da3w5y)

## 题目辨析
- 排好序的数组或者链表中寻找一些组合满足某种限制条件，这种组合可能是一对数，三个数或者一个子数组

## 经典题目(英文)
- [Two Sum](https://leetcode.com/problems/two-sum)
- [Container With Most Water](https://leetcode.com/problems/container-with-most-water)
- [3Sum](https://leetcode.com/problems/3sum)
- [3Sum Closest](https://leetcode.com/problems/3sum-closest)
- [Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water)
- [Sort Colors](https://leetcode.com/problems/sort-colors)
- [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring)
- [Remove Duplicates from Sorted List](https://leetcode.com/problems/remove-duplicates-from-sorted-list)
- [Subarray Product Less Than K](https://leetcode.com/problems/subarray-product-less-than-k)
- [Backspace String Compare](https://leetcode.com/problems/backspace-string-compare)
- [Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array)

# 快慢指针
## 知识原理
又叫龟兔赛跑，两个指针在数组或链表上的移动速度不一样，如图

![base](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-suft3wtu)

## 题目辨析
- 问题需要处理环上的问题，比如环形链表和环形数组
- 需要知道链表长度或某个特别位置的信息

### 用快慢指针不用双指针
- 单链表上不能往回移动，判断链表是否是回文需要用到快慢指针

## 经典题目
- [Add Two Numbers](https://leetcode.com/problems/add-two-numbers)
- [Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list)
- [Remove Duplicates from Sorted List](https://leetcode.com/problems/remove-duplicates-from-sorted-list)
- [Linked List Cycle](https://leetcode.com/problems/linked-list-cycle)
- [Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii)
- [Reorder List](https://leetcode.com/problems/reorder-list)
- [Sort List](https://leetcode.com/problems/sort-list)
- [Remove Linked List Elements](https://leetcode.com/problems/remove-linked-list-elements)
- [Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list)
- [Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list)

# 区间合并
## 知识原理
用来处理有区间重叠问题，这个方法很高效，主要知识原理就看图了

![base](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-8mh13wm9)

## 题解辨析
- 需要产生一堆相互之间没有交集区间的时候
- 重叠区间的时候

## 经典题目
- [Merge Intervals](https://leetcode.com/problems/merge-intervals)
- [Insert Interval](https://leetcode.com/problems/insert-interval)
- [Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals)
- [Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons)
- [Task Scheduler](https://leetcode.com/problems/task-scheduler)
- [Interval List Intersections](https://leetcode.com/problems/interval-list-intersections)

# 循环排序
## 知识原理
用来处理数组中的数值限定在一定的区间问题。

主要原理是遍历数组中的元素，如果当前这个数它不在其应该在的位置，就把它和应该在的那个位置交换一下。

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-t8i13wdp)

## 题解辨析
- 涉及到排序好的数组，而且数值一般满足于一定的区间
- 排序好或者翻转过的数组中，寻找丢失的/重复的/最小的元素

## 经典题目
- Cyclic Sort
- Find the Missing Number
- Find all Missing Numbers
- Find the Duplicate Number
- Find all Duplicate Numbers

# 链表翻转
## 知识原理
翻转链表的某个节点，通常要求原地操作，不使用额外的空间

主要原理就是用多个指针去定义变量，然后进行翻转。

通常需要保存处理当前节点的上一个节点，不然反转就会丢失链表信息，指向前一个节点后，需要更新当前节点和上一个节点位置，进行下一次遍历

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-gekl3wfd)

## 题解辨析
- 链表反转且原地操作

## 经典题目
- [Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs)
- [Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group)
- [Rotate List](https://leetcode.com/problems/rotate-list)
- [Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii)
- [Reverse Linked List](https://leetcode.com/problems/reverse-linked-list)
- [Odd Even Linked List](https://leetcode.com/problems/odd-even-linked-list)

# 广度优先搜索
## 知识原理
主要用于树的广度优先搜索。借助于队列数据结构，从而保证树的节点按照他们的层数打印出来(也就是层序遍历)。每一层执行完，才会进行到下一层。

主要操作是，把根节点加入到队列中，然后不断遍历直到队列为空。每一次循环中，把队列首部的节点拿出来，然后对其进行必要的操作，在删除节点时，左右子节点都会压入队列

## 题解辨析
- 遍历树，且需要按层操作的方式

## 经典题目(英文)
- [Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal)
- [Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal)
- [Binary Tree Level Order Traversal II](https://leetcode.com/problems/binary-tree-level-order-traversal-ii)
- [Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree)
- [Populating Next Right Pointers in Each Node](https://leetcode.com/problems/populating-next-right-pointers-in-each-node)
- [Populating Next Right Pointers in Each Node II](https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii)
- [Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view)
- [Number of Islands](https://leetcode.com/problems/number-of-islands)
- [Average of Levels in Binary Tree](https://leetcode.com/problems/average-of-levels-in-binary-tree)
- [All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree)

# 深度优先搜索
## 知识原理
主要用于树的深度优先搜索来遍历树。可以使用递归或者栈来记录遍历过程中访问过的父节点。

从根节点开始，如果该节点不是子叶节点，需要做以下事情
- 区别先处理根节点(前序遍历)，处理子节点之间处理根节点(中序),还是最后处理根节点(后序)
- 递归处理当前节点的子节点

## 题解辨析
- 需要按前中后序遍历树
- 如果该问题的解一般离叶子节点比较近

## 经典题目(英文)
- [Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree)
- [Same Tree](https://leetcode.com/problems/same-tree)
- [Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree)
- [Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal)
- [Path Sum](https://leetcode.com/problems/path-sum)
- [Path Sum II](https://leetcode.com/problems/path-sum-ii)
- [Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum)
- [Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree)
- [Word Search II](https://leetcode.com/problems/word-search-ii)
- [Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree)
- [Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst)
- [Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree)
- [Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree)
- [Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree)
- [Path Sum III](https://leetcode.com/problems/path-sum-iii)
- [Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree)
- [Subtree of Another Tree](https://leetcode.com/problems/subtree-of-another-tree)
- [Merge Two Binary Trees](https://leetcode.com/problems/merge-two-binary-trees)
- [Maximum Binary Tree](https://leetcode.com/problems/maximum-binary-tree)
- [Maximum Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree)

# 回溯算法
## 知识原理
主要用于树的深度优先搜索时，如果不满足条件，需要回溯的方式，一般采用递归的方式进行

主要的思路是先不管满足不满足条件，把其中可能的结果压入，等到单个递归结束时，需要把之前的压入的弹出即可

## 题解辨析
- 求解的问题，可能存在多个分支，但不确定是哪个分支有解

## 经典题目(英文)
- [Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number)
- [Generate Parentheses](https://leetcode.com/problems/generate-parentheses)
- [Sudoku Solver](https://leetcode.com/problems/sudoku-solver)
- [Combination Sum](https://leetcode.com/problems/combination-sum)
- [Combination Sum II](https://leetcode.com/problems/combination-sum-ii)
- [Permutations](https://leetcode.com/problems/permutations)
- [Permutations II](https://leetcode.com/problems/permutations-ii)
- [N-Queens](https://leetcode.com/problems/n-queens)
- [Combinations](https://leetcode.com/problems/combinations)
- [Subsets](https://leetcode.com/problems/subsets)
- [Subsets II](https://leetcode.com/problems/subsets-ii)
- [Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning)
- [Combination Sum III](https://leetcode.com/problems/combination-sum-iii)
- [Target Sum](https://leetcode.com/problems/target-sum)
- [Letter Case Permutation](https://leetcode.com/problems/letter-case-permutation)

# 双堆问题
## 知识原理
把数字分成两半，小的数字放在一起，大的数字放在一起，双堆模式就能高效解决此类问题，一般最大堆和最小堆是常用的两个结构

## 主要题解
- 优先队列和计划安排问题上有奇效
- 数组中找最大/最小/中位数
- 二叉树数据结构中也有应用

## 经典例题
- [Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)
- [sliding window median](https://leetcode.com/problems/sliding-window-median)

# 子集问题
## 知识原理
主要是涉及到排列和组合问题。子集问题讲的是用BFS来处理这些问题。

处理步骤结合实例讲解如下：给一组数字[1,5,3]
- 从空集合开始
- 把第一个数加入到之前已经存在的集合中
- 把第二个数加到之前的集合中
- 再把第三个数加入到之前的集合中

具体图解如下

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-hemg3w8d)

## 主要题解
- 求数字的排列组合

## 经典例题
- Subsets
- Subsets With Duplicates
- Permutations 
- String Permutations by changing case
- Balanced Parentheses
- Unique Generalized Abbreviations

# 二分搜索
## 知识原理
主要用于排序好的数组、链表或者矩阵，去寻找特定的元素。

这种模式的步骤是这样的：
- 算出左右端点的中点 middle = (start + end) / 2.
- 如果要找的目标刚好和中点所在的位置数值相等，直接返回
- 如果不相等，两种移动方式，目标比中点值小，end = middle - 1； 否则 start = middle + 1

原理如图

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-kxno3wrs)


## 题解辨析
- 求解排序问题的查找

## 经典题目(英文)
- [Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array)
- [Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix)
- [Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii)
- [Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array)
- [Find Peak Element](https://leetcode.com/problems/find-peak-element)
- [Count of Range Sum](https://leetcode.com/problems/count-of-range-sum)
- [Find Smallest Letter Greater Than Target](https://leetcode.com/problems/find-smallest-letter-greater-than-target)
- [Binary Search](https://leetcode.com/problems/binary-search)
- [Peak Index in a Mountain Array](https://leetcode.com/problems/peak-index-in-a-mountain-array)

# TOK-K
## 知识原理
最佳数据结构就是堆，Java中叫做优先队列

- 根据题目要求，将K个元素插入到最大堆或者最小堆
- 遍历剩下的还没访问的元素，如果当前出来到的这个元素比堆顶元素大，那把堆顶元素先删除，再加当前元素进去

原理如下

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-uuow3wb1)

## 主要题解
- 求最大/最小/最频繁的前k个元素
- 排序去找一个特定的数

## 经典题目
- [Kth Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array)
- [Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst)
- [Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements)
- [Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency)
- [Course Schedule III](https://leetcode.com/problems/course-schedule-iii)
- [Find K Closest Elements](https://leetcode.com/problems/find-k-closest-elements)
- [Reorganize String](https://leetcode.com/problems/reorganize-string)
- [Maximum Frequency Stack](https://leetcode.com/problems/maximum-frequency-stack)
- [K Closest Points to Origin](https://leetcode.com/problems/k-closest-points-to-origin)

# 多路归并
## 知识原理
解决涉及到多组排序好的数组问题。

每当你的输入是K个排序好的数组，可以用堆来遍历其中所有数组中的元素。将每个数组中最小的压入到堆，从而得到全局最小值，拿到全局最小值后，再从该元素所在的数组中取下一个元素压入堆。如此处理完所有的元素

解题步骤：
1. 把每个数组中的第一个元素都加入最小堆中
2. 取出堆顶元素（全局最小），将该元素放入排好序的结果集合里面
3. 将刚取出的元素所在的数组里面的下一个元素加入堆
4. 重复步骤2，3，直到处理完所有数字

原理如下

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-4hwy3w8x)

## 主要题解
- 输入是排序好的数组、链表或者矩阵
- 合并多个排好序的集合，或者找集合中第K小的元素

## 经典题目
- [Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists)
- [Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists)
- [Find K Pairs with Smallest Sums](https://leetcode.com/problems/find-k-pairs-with-smallest-sums)
- [Kth Smallest Element in a Sorted Matrix](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix)
- [Smallest Range Covering Elements from K Lists](https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists)

# 动态规划
## 知识原理
动态规划问题主要是要求得子问题。即最重要的两个点

1. 初始值
2. 状态转移方程。dp[i]与dp[i-1]甚至dp[i-2]之间的关系


## 主要题解
- 下一个输出依赖上一个输出
- 求最优解

## 经典题目
- [Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring)
- [Maximum Subarray](https://leetcode.com/problems/maximum-subarray)
- [Jump Game](https://leetcode.com/problems/jump-game)
- [Unique Paths](https://leetcode.com/problems/unique-paths)
- [Climbing Stairs](https://leetcode.com/problems/climbing-stairs)
- [Decode Ways](https://leetcode.com/problems/decode-ways)
- [Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock)
- [Word Break](https://leetcode.com/problems/word-break)
- [Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray)
- [House Robber](https://leetcode.com/problems/house-robber)
- [House Robber II](https://leetcode.com/problems/house-robber-ii)
- [Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence)
- [Range Sum Query - Immutable](https://leetcode.com/problems/range-sum-query-immutable)
- [Best Time to Buy and Sell Stock with Cooldown](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown)
- [Coin Change](https://leetcode.com/problems/coin-change)
- [Counting Bits](https://leetcode.com/problems/counting-bits)
- [Combination Sum IV](https://leetcode.com/problems/combination-sum-iv)
- [Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum)
- [Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings)
- [Number of Longest Increasing Subsequence](https://leetcode.com/problems/number-of-longest-increasing-subsequence)
- [Partition to K Equal Sum Subsets](https://leetcode.com/problems/partition-to-k-equal-sum-subsets)

# 拓扑排序
## 知识原理
用来寻找一种线性的顺序，这些元素之间有依赖性。比如事件B依赖于事件A，那么A在拓扑排序中排在B的前面

解题顺序如下：
1. 初始化
    - 借助于hashmap将图保存成邻接表的形式
    - 找到所有的起点，用hashmap来帮助记录每个点的入度
2. 创建图
    - 利用输入，把图建好，然后遍历一遍图，将入度信息记录在hashmap中
3. 找到所有的起点
    - 所有入度为0的节点，都是有效的起点，而且我们将他们都加入到一个队列中
4. 排序
    - 对于每个起点，执行以下步骤
    1. 把它加入到结果的顺序中
    2. 将其在图中的孩子节点取到
    3. 将其孩子的入度减1
    4. 如果孩子的入度为0，则改孩子为起点，将其加入队列
    - 重复上述过程，直到队列为空

原理如图

![原理图](https://hackernoon.com/photos/G9YRlqC9joZNTWsi1ul7tRkO6tv1-ve1473wvg)

## 主要题解
- 待解决的问题需要处理无环图
- 以一种有序的秩序更新输入元素
- 需要处理的输入遵循某种特定的顺序

## 经典题目
- [Course Schedule](https://leetcode.com/problems/course-schedule)
- [Course Schedule II](https://leetcode.com/problems/course-schedule-ii)
- [Minimum Height Trees](https://leetcode.com/problems/minimum-height-trees)

# 图论算法
## 知识原理
图论算法主要是深度优先搜索和广度优先搜索，其大部分的解决方法都与树类似，具体不多展开

## 题解辨析
- 明显就是图论的算法题


## 经典题目
- [Clone Graph](https://leetcode.com/problems/clone-graph)
- [Number of Islands](https://leetcode.com/problems/number-of-islands)
- [Course Schedule](https://leetcode.com/problems/course-schedule)
- [Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow)
