---
layout: post
title: LeetCode's Array/String
summary: Two sum I, II, Valid palindrome, Implement strstr(), Reverse words in string, Longest substring without repeating characters, Missing ranges, One edit distance
category: Master-coding-interview-challenges
tags: [leetcode, algorithm]
---

### 1. Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:
```
- Input: nums = []int{2, 5, 4}, target = 6
  Output: [0, 2] since nums[0] + nums[2] = 2 + 4 = 6
```

Approach:
```
- Use a hash map to store the value and its index as we iterate through the
  list.
- Within each iteration, look up the difference of target and the current
  value to see if we have seen that number.
- Simply return two cached indices once that condition meets.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/two_sum_i_test.go)

### 2. Given a sorted array of integers, return indices of the two numbers such that they add up to a specific target.

Example:
```
- Input: nums = []int{2, 3, 4}, target = 6
  Output: [0, 2] since nums[0] + nums[2] = 2 + 4 = 6
```

Approach:
```
- Since the array is sorted, can use two-pointer approach that has one point
  to the start of the list while the other point at the end and move the
  toward each other.
```

Cost:
```
- O(n) time and O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/two_sum_ii_test.go)

### 3. Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Example:
```
- Input: "A man, a plan, a canal: Panama"
  Output: true
- Input: "race a car"
  Output: false
```

Approach:
```
- Use two pointers approach that have one point to the start of the string and
  the other point at the end.
- Move them toward each other and compare if they're the same characters while
  skipping non-alphanumeric characters and ignoring cases.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/valid_palindrome_test.go)


### 4. Implement strstr() that finds the first occurrence of the substring needle in the string haystack. It returns -1 if needle is not part of the haystack.

Example:
```
- Input: haystack = "aaabacd", needle = "ba"
  Output: 3, because needle "ba" starts at index 3 in the haystack.
```

Approach:
```
- Scan the needle with the haystack from its first position and start matching
  all subsequent letters one by one.
- If one letter does not match, start again with the next position in the
  haystack.
```

Cost:
```
- O(nm) time, O(1) space, where n is the length of haystack while m is the
  length of needle.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/strstr_test.go)

### 5. Given a string, reverse it word by word.

Example:
```
- Input: "hard so be to have not does interview coding"
  Output: "coding interview does not have to be so hard"
```

Approach:
```
- Approach with a two-pass solution.
- The first pass is to split the string into an array of words separated by
  spaces.
- The second pass is to reverse the order of words in the array by using
  two-pointer approach: swap two values on both ends as we move toward the
  middle.
- Concatenate the values of ordered array to create a final string.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/reverse_words_string_test.go)

### 6. Given a string, find the length of the longest substring without repeating characters.

Example:
```
- Input: "abcabcbb"
  Output: 3
  Explanation: The longest substring is "abc" with the length of 3.
- Input: "bbbbb"
  Output: 1
  Explanation: The longest substring is "b" with the length of 1.
```

Approach:
```
- Iterate through the string and keep track of the maximum length of non-repeating
  characters using a hashmap that maps characters to their indices.
- Could skip characters immediately if we found a repeating character.
```

Cost:
```
- O(n) time, O(m) cost where m < n and  n is the length of the string.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/longest_substring_test.go)

### 7. Given a sorted integer array where the range of elements are [0, 99] inclusive, return its missing ranges.

Example:
```
- Input: []int{0, 1, 6, 16, 66, 99}
  Output: []string{"2-5", "7-15", "17-65", "67-98"}
- Input: []int{6, 16, 66}
  Output: []string{"0-5", "7-15", "17-65", "67-99"}
```

Approach:
```
- Keep two pointers where one is ahead of the other by 1 index.
- Iterate through the list, calculate the difference of two consecutive numbers
  in the list at each step and append it to a new list.
```

Cost:
```
- O(n) time, O(m) space, where m < n and n is the size of the input.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/missing_ranges_test.go)

### 8. Given two strings, determine if they are both one edit distance apart.

Example:
```
- Input: "abcde", "abXde"
  Output: true
  Explanation: Only "c" in S is replaced by "X" in T.
- Input: "abcde", "abcXde"
  Output: true
  Explanation: "X" is inserted between "c" and "d" in S to get T.
```

Approach:
```
- Use two-pointer approach to traverse both strings at the same time and
  keep track of count of difference characters.
```

Cost:
```
- O(n) time, O(1) space
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/one_edit_distance_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mailing list here →](https://tinyletter.com/hoanhan)
