---
layout: post
title: LeetCode's Linked List
summary: Merge sorted linked list, Add two numbers, Swap nodes in pairs
tags: [leetcode, algorithm]
---

### 1. Merge two sorted linked lists and return it as a new list.

Example:
```
- Input: 1 -> 3-> 5 & 2 -> 4-> 6
  Output: 1 -> 2-> 3 -> 4 -> 5 -> 6
```

Approach:
```
- Traverse both list at the same time, compare their values at each step and
  add the smaller one to a new list.
```

Cost:
```
- O(n|m) time, O(n+m) space where n and m are lengths of these two linked lists.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/merge_sorted_linked_list_test.go)

### 2. Given two linked lists representing two non-negative number, add them together and return it as a linked list.

Assumption:
```
- The digits are stored in reverse order.
- Each node contains a single digit.
```

Example:
```
- Input: (1 -> 6 -> 4) + (2 -> 4-> 1)
  Output: (3 -> 0 -> 6)
```

Approach:
```
- Traverse both lists and keep track of the sum and carry for each
  digit.
```

Cost:
```
- O(n|m) time, O(m|n) space where m and m are lengths of these two lists.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/add_two_numbers_test.go)

### 3. Given a linked list, swap every two adjacent nodes and return its head.

Assumption:
```
- If the length of the linked list is odd, the last node should not be swapped.
- The solution should use constant space.
```

Example:
```
- Input: 1 -> 3-> 5 -> 2 -> 4-> 6
  Output: 3 -> 1-> 2 -> 5 -> 6 -> 4
- Input: 1 -> 3-> 5 -> 2 -> 4
  Output: 3 -> 1-> 2 -> 5 -> 4
```

Approach:
```
- Traverse the list and swap the nodes pairwise by adjusting where it's pointing next.
```

Cost:
```
- O(n) time, O(1) space where n is the length of a linked list.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/swap_nodes_in_pairs_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
