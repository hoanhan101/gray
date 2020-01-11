---
layout: post
title: Grokking the Coding Interview's Sliding Window
summary: Average of any contiguous subarray of size k, Maximum sum of any contiguous subarray of size k, Smallest subarray with a given sum, Longest substring with k distinct characters, Fruits into baskets
category: Master Coding Interview Challenges
tags: [grokking-the-coding-interview, algorithm]
---

### 1. Given an array, find the average of all contiguous subarrays of size k.

Example:
```
- Input: []int{1, 3, 2, 6, -1, 4, 1, 8, 2}, k=5
  Output: []int{2.2, 2.8, 2.4, 3.6, 2.8}
```

Approach:
```
- View each contiguous subarray as a sliding window of k elements.
- As we move to the next subarray, slide the window by one element to
  reuse the sum from previous array.
```

Cost:
```
- O(n) time, O(k) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/avg_subarray_test.go)

### 2. Given an array of positive numbers and a positive number k, find the maximum sum of any contiguous subarray of size k.

Example:
```
- Input: int{2, 1, 5, 1, 3, 2}, k=3
  Output: 9
  Explanation: Subarray with maximum sum is [5, 1, 3].
```

Approach:
```
- View each contiguous subarray as a sliding window of k elements.
- As we move to the next subarray, slide the window by one element to
  reuse the sum from previous array and update the maximum sum.
```

Cost:
```
- O(n) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/max_subarray_test.go)

### 3. Given an array of positive numbers and a positive number s, find the length of the smallest contiguous subarray whose sum is greater than or equal to s.

Example:
```
- Input: array=int{2, 1, 5, 2, 3, 2}, s=7
  Output: 2
  Explanation: Smallest subarray with a sum great than or equal to 7 is [5, 2]
  with length=2.
```

Approach:
```
- The difference between the previous problem and this one is that the size of
  the sliding window is not fixed.
- Can still use the similar strategy to add up elements until their sum is greater
  than equal to s and view them as our sliding window.
- Shrink the window until the window's sum is smaller than s again while keep
  updating the minimum length.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/valid_palindrome_test.go)


### 4. Given a string, find the length of the longest substring in it with no more than k distinct characters.

Example:
```
- Input: string="araaci", k=1
  Output: 2
  Explanation: Longest substring with no more than 1 distinct characters is "aa".
- Input: string="araaci", k=2
  Output: 4
  Explanation: Longest substring with no more than 2 distinct characters is "araa".
- Input: string="araaci", k=3
  Output: 5
  Explanation: Longest substring with no more than 3 distinct characters is "araac".
```

Approach:
```
- Use a hashmap to remember the frequency of each character we have seen.
- Insert characters until we have k distinct characters in the map to be consider a
  window.
- Shrink the window until there is no more k distinct characters in the map and keep
  updating the maximum window length at each step.
```

Cost:
```
- O(n) time, O(k) space where k is the number of characters in the map.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/longest_substring_k_distinct_test.go)

### 5. Given an array of characters where each character represents a fruit tree, you are given two baskets and your goal is to put maximum number of fruits in each basket.

Constraints:
```
- Each basket can have only one type of fruit.
- You can start with any tree, but once you have started you can’t skip a tree.
  You will pick one fruit from each tree until you cannot, i.e., you will stop
  when you have to pick from a third fruit type.
```

Example:
```
- Input: fruits=["apple", "orange", "coconut", "apple", "coconut"]
  Output: 3
  Explanation: Can put 2 "cocunut" in 1 basket and 1 "apple" in other from
  subarray ["coconut", "apple", "coconut"]
```

Approach:
```
- Similar to "longest substring with k distinct characters" with k=2.
```

Cost:
```
- O(n) time, O(k) space where k is the number of characters in the map.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/gtci/fruits_baskets_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
