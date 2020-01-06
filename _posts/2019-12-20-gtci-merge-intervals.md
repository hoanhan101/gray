---
layout: post
title: Grokking the Coding Interview's Merge Intervals
summary: Merge intervals, Insert interval, Intervals intersection, Conflicting appointment
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Given a list of intervals, merge all the overlapping intervals to produce a list that has only mutually exclusive intervals.

Example:
```
- Input: []interval{ {1, 2}, {2, 3}, {4, 5} }
  Output: []interval{ {1, 3}, {4, 5} }
- Input: []interval{ {1, 5}, {2, 3} }
  Output: []interval{ {1, 5} }
```

Approach:
```
- Sort the list in ascending order so that intervals that might need to be
  merged are next to each other.
- Can merge two intervals together if the first one's end time is greater or
  or equal than the second one's start time.
```

Cost:
```
- O(nlogn) time, O(n) space.
- Because we sort all intervals first, the runtime is O(nlogn). We create a new
  list of merged interval times, so the space cost is O(n).
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/merge_intervals_test.go)

### 2. Given a list of non-overlapping intervals sorted by their start time, insert a given interval at the correct position and merge all necessary intervals to produce a list that has only mutually exclusive intervals.

Example:
```
- Input: []interval{ {1, 3}, {5, 7}, {8, 12} }, interval{4, 6}
  Output: []interval{ {1, 3}, {4, 7}, {8, 12} }
```

Approach:
```
- Since the list is sorted, can skip all the intervals where their end time is
  less than the new interval's start time.
- The merging process is similar to the one in merge interval problem.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/insert_interval_test.go)

### 3. Given two sorted lists of intervals, find the intersection between them.

Example:
```
- Input: []interval{ {1, 3}, {5, 6}, {7, 9} }, []interval{ {2, 3}, {5, 7} }
  Output: []interval{ {2, 3}, {5, 6}, {7, 7} }
```

Approach:
```
- Iterate through both list at the same time and check if two intervals
  are overlapping at each step.
- Opposite to the merging process, an overlapped interval has:
  - a bigger start between the two intervals
  - a smaller end between the two intervals
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/intervals_intersection_test.go)

### 4. Given a list of intervals, check if any of them is conflicting.

Example:
```
- Input: []interval{ {1, 2}, {2, 3}, {4, 5} }
  Output: false
- Input: []interval{ {1, 5}, {2, 3} }
  Output: true
```

Approach:
```
- Similar to merge intervals problem, need to return the true
  immediately if any of them is conflicting.
```

Cost:
```
- O(nlogn) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/conflict_appointment_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
