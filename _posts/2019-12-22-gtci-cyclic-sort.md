---
layout: post
title: Grokking the Coding Interview's Cyclic sort
summary: Cyclic sort, Missing number, Missing numbers, Find duplicate, Find duplicates, Find corrupt pair
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Cyclic sort

Given an array containing n objects where each object, when created,
was assigned a unique number from 1 to n based on their creation sequence.
This means that the object with sequence number 3 was created just before
the object with sequence number 4.

Write a function to sort the objects in-place on their creation sequence
number in O(n) and without any extra space.

Example:
```
- Input: []int{6, 3, 5, 2, 4, 1}
  Output: []int{1, 2, 3, 4, 5, 6}
```

Approach:
```
- Use the fact that we are given a range of 1-n, can try placing each number at
  its correct index in the array, say 1 at 0, 2 at 1, 3 at 2 and so on.
- Iterate through the array and if the current number is not at the correct index,
  swap it with the number at its correct index.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/cyclic_sort_test.go)

### 2. Given an array containing n numbers taken from the range 1 to n. It can have duplicates. Find all those missing numbers.

Example:
```
- Input: []int{2, 3, 1, 8, 2, 3, 5, 1}
  Output: []int{4, 6, 7}
```

Approach:
```
- Similar to missing number problem, can rearrange the array using cyclic
  sort.
- Those that do not have the correct indices are the missing ones.
```

Cost:
```
- O(n) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/missing_number_test.go)

### 3. Given an array containing n distinct numbers taken from the range 0 to n. Since the array has only n numbers out of the total n+1 numbers, find the missing number.

Example:
```
- Input: []int{4, 0, 3, 1}
  Output: 2
```

Approach:
```
- Sort the array using the cyclic sort first.
- The one that does not have the correct index is the missing one.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/missing_numbers_test.go)

### 4. Given an array containing n+1 numbers taken from the range 1 to n. It has only one duplicate number but can be repeated over time. Find that one.

Example:
```
- Input: []int{1, 4, 4, 3, 2}
  Output: 4
```

Approach:
```
- Similar to missing number problem, can place each number on its correct
  index.
- If while swapping the number with its index both the numbers being swapped
  are same, we have found the duplicate.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/duplicate_test.go)

### 5. Given an array containing n numbers taken from the range 1 to n. It can have some duplicates. Find all those numbers.

Example:
```
- Input: []int{5, 4, 7, 2, 3, 5, 3}
  Output: []int{3, 5}
```

Approach:
```
- Similar to missing number problem, can rearrange the array using cyclic
  sort.
- Those that do not have the correct indices are the duplicate ones.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/duplicates_test.go)

### 6. Given an array containing n+1 numbers taken from the range 1 to n. One of the numbers got duplicated which also resulted in one number going missing. Find these numbers.

Example:
```
- Input: []int{3, 1, 2, 5, 2}
  Output: []int{2, 4}
```

Approach:
```
- Similar to finding duplicates problem, can place each number on its correct
  index.
- The one is not at its correct index is the duplicate and its index itself
  is the missing number.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/corrupt_pair_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
