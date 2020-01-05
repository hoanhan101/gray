---
layout: post
title: Interview Cake's Greedy algorithms
summary: Apple stocks, Highest product of three, Product of all other numbers, In-place shuffle
tags: [interviewcake, algorithm]
---

### 1. Given a list of stock prices (integer) in chronological order, return the max profit from buying at earlier time and selling at later time.

Example:
```
- Input: []int{10, 7, 5, 8, 11, 9}
  Output: 6, because one can buy at 5 and sell at 11
```

Approach:
```
- Use a greedy approach to keep track of the minimum price and the maximum
  profit for each value while iterating through the list.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/apple_stocks_test.go)

### 2. Given a list of integers, return the highest product of three numbers.

Example:
```
- Input: []int{-10, -10, 1, 3, 2}
  Output: 300, because -10.-10.3 gives the highest product
```

Approach:
```
- Use a greedy approach to keep track of the current highest, current lowest,
  highest of three, highest of two and lowest of two for every value as we
  iterate through the list.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/highest_product_of_three_test.go)

### 3. Given a list of integers, return a corresponding list where every index holds the product of every other values except the value in that index. And, you can't use division!

Example:
```
- Input: []int{1, 7, 3, 4}
  Output: []int{84, 12, 28, 21}
```

Approach:
```
- Iterate through the list and at each step, calculate the product of all
  the integers before each index and the product of all the integers after
  each index.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/product_of_others_test.go)


### 4. Given a list of integers, shuffle its location in-place.

Example:
```
- Input: []int{1, 2, 3, 4, 5}
  Output: []int{2, 1, 4, 3, 5}
```

Approach:
```
- Iterate through the list, swap current value with a value in a randomized
  index that is between the current and last index.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/inplace_shuffle_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
