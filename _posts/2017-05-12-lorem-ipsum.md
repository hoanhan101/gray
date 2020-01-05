---
layout: post
title: Remaining essentially unchanged
description: Lorem Ipsum is simply dummy text
summary: Lorem Ipsum is simply dummy text.
tags: [css]
---

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

```css
.♫ { background: #222; color: #FFF; } 
.ಠ_ಠ { background: #ccc; color: #fff; }
```

Sample go:
```go
/*
	count.go counts the number of files in given directories.
	Since one file contains one problem, the program's output can also
	tell how many questions that we have completed so far.
*/

package main

import (
	"fmt"
	"os"
	"path/filepath"
	"text/tabwriter"
)

func main() {
	// format in tab-separated columns with a tab stop of 8.
	w := new(tabwriter.Writer)
	w.Init(os.Stdout, 0, 8, 0, '\t', 0)

	total := 0
	directories := []string{"ctci", "gtci", "interviewcake", "leetcode", "other"}

	for _, dir := range directories {
		n := countFiles(dir)
		fmt.Fprintf(w, "%v\t%v\n", dir, n)

		total += n
	}

	fmt.Fprintf(w, "-------------\t--\n")
	fmt.Fprintf(w, "total\t%v\n", total)
	w.Flush()
}

func countFiles(dir string) int {
	counter := 0

	err := filepath.Walk(dir,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if dir != path {
				counter++
			}
			return nil
		})

	if err != nil {
		fmt.Println(err)
	}

	return counter
}
```

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

```css
input[type="text"]:focus { outline: none; }
```

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
