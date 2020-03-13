---
layout: post
title: Grokking the Coding Interview's Fast and Slow Pointers
summary: Linked list cycle, Start of a linked list cycle, Happy number, Middle of a linked list, Palindrome linked list, Reorder a linked list
category: Master-coding-interview-challenges
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Given the head of a singly linked list, write a function to determine if it contains a cycle.

Approach:
```
- Have a slow pointer move one step at a time while the fast one move
  2 steps at a time.
- If the linked list has a cycle, the fast pointer will catch the slow one.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/linked_list_cycle_test.go)

### 2. Given the head of a singly linked list, write a function to find the starting node of the cycle.

Approach:
```
- Similar to finding a cycle in a linked list problem, can also determine
  the start of its cycle and calculate length k of the cycle.
- Have one pointer at the beginning and one at kth node of the linked list.
- Move both of them until they meet at the start.of the cycle.
```

Cost:
```
- O(n) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/cycle_start_test.go)

### 3. Write an algorithm to determine if a number is happy.

Any number will be called a happy number if, after repeatedly replacing
it with a number equal to the sum of the square of all of its digits,
leads us to 1.

Example:
```
- Input: 19
  Output: true
  Explanation:
	  1^2 + 9^2 = 82
	  8^2 + 2^2 = 68
	  6^2 + 8^2 = 100
	  1^2 + 0^2 + 0^2 = 1
```

Approach:
```
- Since the process always end in a cycle, we can use a similar approach to
  finding a cycle in linked list problem.
- Once is cycle is found, check if it is stuck on 1.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/happy_number_test.go)


### 4. Given the head of a singly linked list, write a function to return the middle value.

Approach:
```
- Have a slow pointer move one step at a time while the fast one move
  2 steps at a time.
- Once the fast one reaches the end, the slow is in the middle.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/middle_list_test.go)

### 5. Given the head of a singly linked list, write a function to determine if it is a palindrome in constant space.

Approach:
```
- Find the middle of the linked list and reverse a half list
- After comparing the first half with the reversed half to check if it's
  a palindrome, revert to the half to original form.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/palindrome_list_test.go)

### 6. Given the head of a singly linked list, write a function to reorder it such that nodes from the second half are inserted alternately to the nodes from the first half in reverse order.

Approach:
```
- Similar to palindrome linked list problem, can also use a trick to
  reverse the second half and rearrange them in the required order
  using fast and slow pointers.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/reorder_list_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mailing list here →](https://tinyletter.com/hoanhan)
