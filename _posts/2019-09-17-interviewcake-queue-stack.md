---
layout: post
title: Interview Cake's Queues and Stacks
summary: Largest stack, A queue with two stacks, Parenthesis matching, Bracket validator
category: Master-Coding-Interview-Challenges
tags: [interviewcake, algorithm]
---

### 1. Implement a stack with a method getMax() that returns the largest element in the stack in O(1) time.

Approach:
```
- We use two stack implementation themselves: one holds all the items and the
  other holds all the maximum values after each push() and pop().
- That way, we could keep track of your maximum value up to date in constant
  time.
```

Cost:
```
- O(1) time, O(m) space where m is the number of operations performed on the
  stack.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/largest_stack_test.go)

### 2. Implement a queue with 2 stacks.

Approach:
```
- Use one stack for enqueuing item and the other to reverse the order them for
  dequeuing/popping item.
```

Cost:
```
- O(1) time, O(m) space m is the number of operations.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/queue_two_stacks_test.go)

### 3. Given a sentence as string, and the position of an opening parenthesis position, find the matching closing one position.

Example:
```
- Input: "I ((like) (nesting) parenthesis)", opening parenthesis position = 2
  Output: 31, because the matching parenthesis of the one in position 2 is at
  index 31.
```

Approach:
```
- Iterate through the string and keep a count of matching parenthesis at each
  step.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/parenthesis_matching_test.go)


### 4. Given a string, determine if its brackets are properly nested.

Example:
```
- Input: "{[]()}"
  Output: true
- Input: "{[(])}"
  Output: false
- Input: "{[}"
  Output: false
```

Approach:
```
- Use a stack to keep track of matching parenthesis as we iterate
  through the string.
```

Cost:
```
- O(n) time and O(n) space, where n is the number of operations.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/bracket_validator_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
