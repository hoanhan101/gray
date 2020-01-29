---
layout: post
title: LeetCode's Binary tree
summary: Validate binary search tree, Maximum depth of binary tree, Minimum depth of binary tree, Balanced binary tree, Binary tree maximum path sum
category: Master-Coding-Interview-Challenges
tags: [leetcode, algorithm]
---

### 1. Given a binary tree, determine if it is a valid binary search tree.

Approach:
```
- Traverse the tree and apply recursion to check at each step if:
  - the current node's value is greater than the lower bound
  - the current node's value is smaller than the upper bound
  - the current node's left child follows
  - the current node's left child follows
```

Cost:
```
- O(n) time and O(n) stack space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/valid_bst_test.go)

### 2. Given a binary tree, find its maximum depth.

Approach:
```
- The maximum depth of the current node is the greater of the max height of the left
  subtree and the right subtree plus one.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/max_depth_binary_tree_test.go)

### 3. Given a binary tree, find its minimum depth.

Approach:
```
- Similar to finding maximum depth, the minimum depth of the current node is
  the smaller of the min height of the left subtree and the right subtree plus one.
```

Cost:
```
- O(n) time, O(1) space where n is the length of a linked list.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/min_depth_binary_tree_test.go)

### 4. Given a binary tree, determine if it is height-balanced.

Approach:
```
- Calculate max depth for the left subtree and right subtree.
- If either the left subtree or right subtree is unbalanced, return right away.
```

Cost:
```
- O(n) time, O(n) stack space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/balanced_binary_tree_test.go)


### 5. Given a binary tree, find the maximum path sum.

Assumption:
```
- The path might start and end at any node in the tree.
- Assume the tree is non-empty.
- The node can contain negative number.
- The maximum path does not have to go though the root node.
```

Approach:
```
- At each node, the potential maximum path could be one of these cases:
  - max(left subtree) + node
  - max(right subtree) + node
  - max(left subtree) + max(right subtree) + node
  - the node itself
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/binary_tree_max_path_sum_test.go)


> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mailing list here →](https://tinyletter.com/hoanhan)
