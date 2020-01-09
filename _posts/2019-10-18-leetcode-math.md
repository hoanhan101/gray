---
layout: post
title: LeetCode's Math
summary: Reverse integer, Plus one, Palindrome number
categories: Tech
tags: [leetcode, algorithm]
---

### 1. Given a 64-bit integer, reverse its digits.

Assumption:
```
- Negative numbers are also valid.
- Must handle the case where the reversed integer is overflow.
```

Example:
```
- Input: 123
  Output: 321
- Input: -123
  Output: -321
- Input: 8085774586302733229 Output: 0
  Explanation: The reversed integer 9223372036854775808 overflows by 1 so we return 0.
```

Approach:
```
- Use modulo by 10 to get a digit at ones' place of the input and
  dividing by 10 to shift it to the right (eliminate the ones' place).
```

Cost:
```
- O(m) time, O(1) space, where m is log10 of the input.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/reverse_integer_test.go)

### 2. Given a number represented as an array of digits, plus one to the number.

Assumption:
```
- The input are non-negative.
- The digits are stored such that the most significant digit is at the head of the list.
- The number does not contain leading zeros.
```

Example:
```
- Input: []int{1, 2, 5}
  Output: []int{1, 2, 6}
- Input: []int{1, 2, 9}
  Output: []int{1, 3, 0}
- Input: []int{1, 9, 9}
  Output: []int{2, 0, 0}
```

Approach:
```
- Iterate through the list from right to left and add 1 to the current digit accordingly.
  - If the current digit is less than 9, add 1 and update it.
  - Otherwise, set it to 0.
- If all the digits are 9, append an 0 in the end and update the first digit to 1.
```

Cost:
```
- O(n) time, O(1) space, where n is the length of the list.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/plus_one_test.go)

### 3. Determine whether an integer is a palindrome.

Assumption:
```
- Do this without extra space.
- Define negative integers as non-palindrome.
```

Example:
```
- Input: 101
  Output: true
- Input: 106
  Output: false
```

Approach:
```
- Use two-pointer approach where one starts at the first digit and one starts
  at the last digit, have them walk toward the middle and compare them at each
  step.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/leetcode/palindrome_number_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
