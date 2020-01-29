---
layout: post
title: Interview Cake's Trees and Graphs
summary: Balanced binary tree, Binary search tree checker, 2nd largest item in a binary search tree, Graph coloring
category: Master-Coding-Interview-Challenges
tags: [interviewcake, algorithm]
---

### 1. Given a binary tree, determine if it is "superbalanced" - the difference between the depths of any two leaf nodes is no greater than 1.

Example:
```
- Input:
         1
      2     3
    4   5      7
          6  8   9
                   10
  Output: false
  Even though this tree is balanced by definition, it is not "superbalanced".
```

Approach:
```
- Use a depth-first walk through the tree and keep track of the depth as we
  go.
- Every time we found a leaf with a new depth, there are two ways that the
  tree could be unbalanced:
   - There are more than 2 different leaf depths.
   - There are exactly 2 depths but they are more than 1 apart.
```

Cost:
```
- O(n) time, O(n) space.
- The worst case is that we have to iterate all nodes in the tree so the time
  complexity is O(n). For space complexity, we have to keep track of the all
  the nodes at every depth. Hence, it is O(n).
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/balanced_binary_tree_test.go)

### 2. Given a binary tree, determine if it is a binary search tree.

Example:
```
- Input:
          5
      3       8
    2   4   7   9
  1               11
  Output: true, because for each node, its value is greater than all values in
  the left subtree and less than all values in the right one.
```

Approach:
```
- Use a depth-first walk through the tree and validate each node as we go.
- If a node appears in the left subtree, it must be less than its ancestor and
  vice versa.
- Instead of keeping track of every ancestor to check the inequalities, just
  need to check the largest number it must be greater than and the smallest one
  it must be less than, aka lower bound and upper bound.
```

Cost:
```
- O(n) time, O(n) space.
- The worst case is that we have to iterate all nodes in the tree so the time
  complexity is O(n). For space complexity, we have to keep track of the lower
  bound and upper bound as we traverse the tree via a stack. Hence, the worst
  case is O(n).
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/binary_search_tree_test.go)

### 3. Given a binary search tree, find the 2nd largest item.

Example:
```
- Input:
          5
      3       8
    2   4   7   9
  1               11
  Output: 9
- Input:
           5
      3        8
    2   4   7     16
                11
              9   12
  Output: 12
```

Approach:
```
- The largest item in a binary search tree is the rightmost item. Can
  simply traverse down the tree recursively to find one.
- The 2nd largest item could be the parent of the largest but it's not
  necessary since the largest could have a left subtree and there might exist
  one there.
- Still, the second largest one when the largest has a left subtree is basically
  the largest one in that left subtree.
```

Cost:
```
- O(h) time, O(1) space, where h is the height of the tree.
- If the tree is balanced, the time complexity is (Olgn). Otherwise, it's O(n).
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/2nd_largest_item_bst_test.go)


### 4. Given an undirected graph, with maximum degree d, find a graph coloring using at most d + 1 colors. Assume that there is no node with a loop.

Example:
```
- For a graph with degree 3, we could use at most 4 colors.
```

Approach:
```
- Use a greedy approach to iterate over the graph and assign each node the
  first non-taken color that we found.
```

Cost:
```
- O(m) time and O(d) space, where m is sum of all the nodes and edges, d is
  the number of all colors.
- Even though it seems like we have an outer and inner loop, we carefully walk
  through the graph one node at a time and stop checking for colors as soon as
  we found one that is non-taken.
- About the space complexity, it makes sense that we have to store all
  available colors in the worst case. Hence it takes up O(d) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/graph_coloring_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mailing list here →](https://tinyletter.com/hoanhan)
