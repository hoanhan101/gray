---
layout: post
title: Grokking the Coding Interview's Tree breath first search
summary: Binary tree level order traversal, Reverse level order traversal, Zigzag traversal, Level averages, Minimum depth, Maximum depth, Level order successor
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Given a binary tree, populate the values of all nodes of each level from left to right in separate sub-arrays.

Example:
```
- Input:
      1
	2   3
  4       5
  Output: []interface{}{[]interface{}{1}, []interface{}{2, 3}, []interface{}{4, 5}}
```

Approach:
```
- Start by pushing the root node to the queue.
- Keep iterating until the queue is empty.
- At each step,
  - send the front of the queue and dequeue it
  - enqueue its left and right child
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/level_order_traversal_test.go)

### 2. Given a binary tree, populate the values of all nodes of each level in reverse order in separate sub-arrays.

Example:
```
- Input:
      1
	2   3
  4       5
  Output: []interface{}{[]interface{}{4, 5}, []interface{}{2, 3}, []interface{}{1}}
```

Approach:
```
- Similar to level order reversal problem, except we append the current level's
  value at the beginning of the output list.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/reverse_level_order_traversal_test.go)

### 3. Given a binary tree, populate the values of all nodes of each level in a zigzag order in separate sub-arrays.

Example:
```
- Input:
      1
	2   3
  4       5
  Output: [][]interface{}{[]interface{}{1}, []interface{}{3, 2}, []interface{}{4, 5}}
```

Approach:
```
- Start by pushing the root node to a queue.
- Keep iterating until the queue is empty.
- At each step,
  - use a linked list to push front or back depending on the zigzag direction
  - enqueue its left and right child
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/zigzag_traversal_test.go)

### 4. Given a binary tree, populate an array to represent the averages of all of its levels.

Example:
```
- Input:
      1
	2   3
  4       5
  Output: []float64{1, 2.5, 4.5}
```

Approach:
```
- Similar to level order traversal problem, except we keep track of the sum
  at each level and return the average in the end.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/level_avg_test.go)

### 5. Given a binary tree, find the minimum depth, aka the number of nodes along the shortest path from the root node to the nearest leaf node.

Example:
```
- Input:
      1
	2   3
  4       5
        6   7
      8
  Output: 3
```

Approach:
```
- Similar to level order traversal problem, except we keep track of the minimum
  depth at each level
- Return it immediately once we find the leaf node.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/min_depth_test.go)

### 6. Given a binary tree, find the maximum depth.

Example:
```
- Input:
      1
	2   3
  4       5
        6   7
      8
  Output: 5
```

Approach:
```
- Similar to minimum depth problem, we will keep traversing for all
  levels, incrementing our maximum depth instead of returning as
  soon as we find a leaf node.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/max_depth_test.go)

### 7. Given a binary tree and a node, find the level order successor of the given node. The level order successor is the node that appears right after the given node in the level order traversal.

Example:
```
- Input: target=6, tree=
      1
	2   3
  4       5
        6   7
      8
  Output: 6
```

Approach:
```
- Similar to level order traversal problem, except we will not keep
  track of all the levels.
- Instead, we keep inserting the child node to the queue and return
  the next node as soon as we find the target.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/level_order_successor_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
