---
layout: post
title: 7 sorting algorithms
summary: The 7 sorting algorithms that we're  going to cover are Bubble Sort, Selection Sort, Insertion Sort, Merge Sort, Quicksort, Heapsort, Counting Sort.
tags: [algorithm, sorting]
---

Here are 7 sorting algorithms implementations in Go that we are going to cover in this post:
1. Bubble Sort
2. Selection Sort
3. Insertion Sort
4. Merge Sort
5. Quicksort
6. Heapsort
7. Counting Sort

### Bubble Sort

**Approach:**

Repeatedly swap the adjacent elements if they are in the wrong order in the
array, one item at a time.

**Solution:**

```go
func bubbleSort(in []int) {
	length := len(in)

	// for each element in the list, check it with almost every other element.
	for i := 0; i < length; i++ {
		// since the last i element is already in place, only iterate through
		// the item before the last one.
		for j := 0; j < length-i-1; j++ {
			// swap the adjacent elements if they are not in ascending order.
			if in[j] > in[j+1] {
				common.Swap(in, j, j+1)
			}
		}
	}
}
```


### Selection Sort

TODO
