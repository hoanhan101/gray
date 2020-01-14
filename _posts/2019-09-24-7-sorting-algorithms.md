---
layout: post
title: 7 sorting algorithms
summary: Bubble Sort, Selection Sort, Insertion Sort, Merge Sort, Quicksort, Heapsort, Counting Sort
category: Master-Coding-Interview-Challenges
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

## Bubble Sort

Approach:
```
Repeatedly swap the adjacent elements if they are in the wrong order in the
array, one item at a time.
```

Cost:
```
O(n^2) time and O(1) space.
```

Solution:
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

## Selection Sort

Approach:
```
Repeatedly select the next smallest element from the unsorted array and move it
to the front.
```

Cost:
```
O(n^2) time and O(1) space.
```

Solution:
```go
func selectionSort(in []int) {
	minIndex := 0
	for i := 0; i < len(in)-1; i++ {
		minIndex = i
		// find the minimum in the rest of the array.
		for j := i + 1; j < len(in); j++ {
			if in[j] < in[minIndex] {
				minIndex = j
			}
		}

		// swap the minimum value with the first value.
		common.Swap(in, i, minIndex)
	}
}
```

## Insertion Sort

Approach:
```
Insert elements from an unsorted array into a sorted subsection of the
array, one item at a time.
```

Cost:
```
O(n^2) time and O(1) space.
```

Solution:
```go
func insertionSort(in []int) {
	// iterate through the list from position 1.
	for i := 1; i < len(in); i++ {
		// shift each one to the left by swapping it with the one before until
		// it's in the right spot.
		current := in[i]
		j := i - 1

		for j >= 0 && current < in[j] {
			in[j+1] = in[j]
			j--
		}

		in[j+1] = current
	}
}
```

## Merge Sort

Approach:
```
Split the input in half, recursively sorts each half, then merge the
sorted halves back together.
```

Cost:
```
O(nlogn) time and O(n) space.
```

Solution:
```go
func mergeSort(in []int) []int {
	// base case
	if len(in) <= 1 {
		return in
	}

	// split the input in half.
	middleIndex := len(in) / 2
	left := in[:middleIndex]
	right := in[middleIndex:]

	// sort each half.
	leftSorted := mergeSort(left)
	rightSorted := mergeSort(right)

	// merge the sorted halves.
	return mergeSortedArray(leftSorted, rightSorted)
}

func mergeSortedArray(a1, a2 []int) []int {
	out := []int{}

	// keep two "pointer" at index 0 and move up accordingly as one get
	// merged in.
	i, j := 0, 0
	for i < len(a1) && j < len(a2) {
		if a1[i] < a2[j] {
			out = append(out, a1[i])
			i++
		} else {
			out = append(out, a2[j])
			j++
		}
	}

	// if we get here, one array must have bigger size than the other. could
	// figure out which one is it then copy the rest of its to our final one.
	if i < len(a1) {
		out = append(out, a1[i:]...)
	}

	if j < len(a2) {
		out = append(out, a2[j:]...)
	}

	return out
}
```

## Quicksort

Approach:
```
Recursively divide the input into two smaller arrays around a pivot, where
one half has items smaller than the pivot, other half has items bigger than
the pivot.
```

Cost:
```
O(nlogn) time and O(nlogn) space.
```

Solution:
```go
func quicksort(in []int, start, end int) {
	if start < end {
		// pi is the pivot/partition index.
		pi := partition(in, start, end)

		// sort the items before and after partition.
		quicksort(in, start, pi-1)
		quicksort(in, pi+1, end)
	}
}

func partition(in []int, start, end int) int {
	pivot := in[end]

	left := start
	right := end - 1

	for left <= right {
		// keep going until we find something on the left that belongs to the
		// right.
		for left <= end && in[left] < pivot {
			left++
		}

		// keep going until we find something on the right that belongs to the
		// left.
		for right >= start && in[right] >= pivot {
			right--
		}

		// by swapping the item at left and right index, we move the item that
		// is smaller than the pivot to the left half and vice versa.
		if left < right {
			common.Swap(in, left, right)
		} else {
			// once the partition is finished, move the pivot back to its final
			// position by swapping the item at left and end index.
			common.Swap(in, left, end)
		}
	}

	return left
}
```

## Heapsort

Approach:
```
Similar to selection sort, repeatedly choose the largest item and move it to
the end of the array using a max heap.
```

Cost:
```
O(nlogn) time and O(1) space.
```

Solution:
```go
func heapsort(in []int) {
	heapify(in)

	size := len(in)
	for size > 0 {
		// repeatedly remove the largest item.
		largest := removeLargest(in, size)

		// update the heap size.
		size--

		// store the removed value at the end of the list.
		in[size] = largest
	}
}

// heapify transform the input into a max heap.
func heapify(in []int) {
	for i := len(in) - 1; i > -1; i-- {
		bubbleDown(in, len(in), i)
	}
}

// bubbleDown allow larger values to reach the top.
func bubbleDown(heap []int, heapSize int, index int) {
	for index < heapSize {
		// fast-calculate the children left and right index.
		left := index*2 + 1
		right := index*2 + 2

		// stop if there is no child node.
		if left >= heapSize {
			break
		}

		// find the larger index
		larger := left
		if right < heapSize && heap[left] < heap[right] {
			larger = right
		}

		// if the current item is larger than both children, we're done.
		// if not, swap with the larger child.
		if heap[index] < heap[larger] {
			common.Swap(heap, index, larger)
		} else {
			break
		}
	}
}

// removeLargest remove and return the largest item from the heap.
func removeLargest(heap []int, heapSize int) int {
	// largest item is at the top of our max heap.
	largest := heap[0]

	// move the last item into the root position.
	heap[0] = heap[heapSize-1]

	// bubble down from the root to restore the heap.
	bubbleDown(heap, heapSize-1, 0)

	return largest
}
```

## Counting Sort

Approach:
```
Iterate through the input, count the number of times each item occurs, use
these counts to compute each item's index in the final sorted array.
```

Cost:
```
O(n) time and O(n) space.
```

Solution:
```go
func countingSort(in []int, max int) []int {
	// utilize max value to create a fix-sized list of item counts.
	counts := make([]int, max+1)
	out := make([]int, 0)

	// populate the array where its indices represent items themselves and
	// its values represent how many time the item appears.
	for _, item := range in {
		counts[item]++
	}

	// iterate through the counts and add the item to the output list.
	for i := 0; i < len(counts); i++ {
		count := counts[i]

		for j := 0; j < count; j++ {
			out = append(out, i)
		}
	}

	return out
}
```

> For more coding problems, please visit
  [https://github.com/hoanhan101/algo](https://github.com/hoanhan101/algo).

> If you're interested in getting updates for such content like these, consider
  joining my [mail list here →](https://tinyletter.com/hoanhan)
