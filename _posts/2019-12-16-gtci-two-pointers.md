---
layout: post
title: Grokking the Coding Interview's Two Pointers
summary: Pair with target sum, Remove duplicates, Squaring a sorted array, Dutch national flag problem
category: Master Coding Interview Challenges
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Given an array of sorted numbers and a target sum, find a pair in the array whose sum is equal to the given target.

Example:
```
- Input: []int{1, 2, 6, 8, 16, 26}, target=14
  Output: []int{2, 3}
  Explanation: 6 (index 2) + 8 (index 3) = 14
```

Approach:
```
- Have one pointer start at the beginning and one at the end of the array.
- At each step, see if the two pointers add up to the target sum and move
  them toward each other accordingly.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/pair_target_sum_test.go)

### 2. Given an array of sorted numbers and a target sum, find a pair in the array whose sum is equal to the given target.

Example:
```
- Input: []int{1, 2, 6, 8, 16, 26}, target=14
  Output: []int{2, 3}
  Explanation: 6 (index 2) + 8 (index 3) = 14
```

Approach:
```
- Have one pointer iterate the array and one placing non-duplicate number.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/remove_duplicates_test.go)

### 3. Given a sorted array, create a new array containing squares of all the number of the input array in the sorted order.

Assumption:
```
- The input can have negative numbers.
```

Example:
```
- Input: []int{-2, -1, 0, 1, 2}
  Output: []int{0, 1, 1, 4, 4}
```

Approach:
```
- The difficult part is to generate the output array with squares in sorted order because we have negative numbers and their squares are positive.
- Have one pointer start at the beginning and one at the end and let them
  move toward each other.
- At each step, whichever bigger will be added to the output array, from
  right to left.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/square_sorted_array_test.go)


### 4. Given an array containing 0s, 1s and 2s, sort the array in-place.

Example:
```
- Input: []int{1, 0, 2, 1, 0}
  Output: []int{0, 0, 1, 1, 2}
```

Approach:
```
- Have one pointer start at the beginning and the other at the end
  while iterating through the array.
- We will move all 0s before that start pointer and 2s after the end
  pointer so that all 1s would be between in the end.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/dutch_flag_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
