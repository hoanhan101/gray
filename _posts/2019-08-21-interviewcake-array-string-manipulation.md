---
layout: post
title: Interview Cake's Array and string manipulation
summary: Merge meeting times, Reverse string in place, Reverse words, Merge sorted arrays
categories: Tech
tags: [interviewcake, algorithm]
---

### 1. Given a list of unsorted, independent meetings, returns a list of a merged one.

Example:
```
- Input: []meeting{ {1, 2}, {2, 3}, {4, 5} }
  Output: []meeting{ {1, 3}, {4, 5} }
- Input: []meeting{ {1, 5}, {2, 3} }
  Output: []meeting{ {1, 5} }
```

Approach:
```
- Sort the list in ascending order so that meetings that might need to be
  merged are next to each other.
- Can merge two meetings together if the first one's end time is greater or
  or equal than the second one's start time.
```

Cost:
```
- O(nlogn) time, O(n) space.
- Because we sort all meeting first, the runtime is O(nlogn). We create a new
  list of merged meeting times, so the space cost is O(n).
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/merge_meetings_test.go)

### 2. Given a list of string, reverse its order.

Example:
```
- Input: []string{"a", "b", "c", "d"}
  Output: []string{"d", "c", "b", "a"}
```

Approach:
```
- Use two pointers approach to swap two values on both ends as we move toward
  the middle.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/reverse_string_test.go)

### 3. Given a list of string that is made up of word but in reverse, return the correct order in-place.

Example:
```
- Input: []string{"w", "o", "r", "l", "d", "", "h", "e", "l", "l", "o", "", "s", "a", "y"}
  Output: []string{"s", "a", "y", "", "h", "e", "l", "l", "o", "", "w", "o", "r", "l", "d"}
```

Approach:
```
- Similar to reversing string, use the same idea to reverse all the characters
  in the list first so that we could have a list of words in the right order, not
  its characters.
- Iterate through the list again and reverse its characters.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/reverse_word_test.go)


### 4. Merge two sorted arrays.

Example:
```
- Input: []int{1, 3, 5}, []int{2, 4, 6}
  Output: []int{1, 2, 3, 4, 5, 6}
- Input: []int{1, 3, 5}, []int{2, 4, 6, 7}
  Output: []int{1, 2, 3, 4, 5, 6, 7}
```

Approach:
```
- Since these arrays are sorted, can use two pointers approach to iterate
  through both of them and append the smaller value to a new merged list at
  each step.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/merge_sorted_arrays_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
