---
layout: post
title: Interview Cake's Hashing problems
summary: In-flight entertainment, Permutation palindrome, Word cloud data, Topscores
category: Master Coding Interview Challenges
tags: [interviewcake, algorithm]
---

### 1. Given a list of movie lengths and a total flight length, determine if there exist two movies that add up to the total length.

Example:
```
- Input: list=[]int{2, 3, 4}, length=6
  Output: true, because there exists 2 and 4 that add up to 6
```

Approach:
```
- Could use hashmap to keep track of movie lengths that we've seen so far and
  look it up as we iterate through the list.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/inflight_test.go)

### 2. Given a string, check if its permutation is a palindrome.

Example:
```
- Input: "ivicc"
  Output: true
- Input: "civic"
  Output: true
```

Approach:
```
- To determine if a permutation is a palindrome, need to check if each
  character in the string appears an even number of times, allowing for
  only one character to appear an odd time, that is the middle one.
- Could use a hashmap store the characters and their number of occurrences.
```

Cost:
```
- O(n) time, O(1) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/permutation_palindrome_test.go)

### 3. Given a sentence (string), return its word count map.

Example:
```
- Input: "Cliff finished his cake and paid the bill. Bill finished his cake at the edge of the cliff."
  Output: map[string]int{"cliff": 1, "Cliff": 1, "finished": 2, "his": 2, "cake": 2, "and": 1, "paid": 1, "the": 3, "bill": 1, "Bill": 1, "at": 1, "edge": 1, "of": 1}
```

Approach:
```
- First get rid of special characters, then use a hashmap to keep counts of words
  as we iterate through the string.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/word_cloud_test.go)


### 4. Given an unsorted list scores (integer) and a highest possible score (integer), return a sorted list utilizing that fact.

Example:
```
- Input: []int{37, 89, 41, 65, 91, 53}, 100
  Output: []int{91, 89, 65, 53, 41, 37}
```

Approach:
```
- Utilize the highest score to allocate a fix-sized list ahead of time where
  where its indices represent the scores themselves and its values represent
  how many time these scores appear in the list.
```

Cost:
```
- O(n) time, O(n) space.
```

[Link to solution →](https://github.com/hoanhan101/algo/blob/master/interviewcake/top_scores_test.go)

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
