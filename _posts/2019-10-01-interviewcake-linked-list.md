---
layout: post
title: Interview Cake's Linked Lists
summary: Delete node, Linked list has a cycle, Reverse a linked list, Kth to last node
category: Master-coding-interview-challenges
tags: [interviewcake, algorithm]
---

### 1. Delete a node from a singly-linked list, given only a pointer to that node.

Approach:
```
- Since we don't have access to the previous node, simply copy the value and
  pointer of the next node and copy them into the current node.
```

Cost:
```
- O(1) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/delete_node_test.go)

### 2. Determine if a singly-linked list has a cycle.

Approach:
```
- Keep two pointers starting at the first node such that: every time one moves
  one node ahead, the other moves 2 nodes ahead.
- If the linked list has a cycle, the faster one will catch up with the slow
  one. Otherwise, the faster one will each the end.
```

Cost:
```
- O(n) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/linked_list_cycle_test.go)

### 3. Reverse a linked list in-place.

Approach:
```
- Iterate through the list and point each node's next pointer to the previous item.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/reverse_linked_list_test.go)


### 4. Find the kth to last node in a linked list.

Example:
```
- Input: list = 1 -> 2 -> 3 -> 4 -> 5 -> 6, k = 2
  Output: 5, because 5 is the 2nd to the last node (6)
```

Approach:
```
- Use two pointers such that one starts at the beginning and the other one
  starts at k distance apart.
- Walk both at the same speed toward the end.
- When one hits the tail, the other one is on the target node.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/kth_to_last_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).
