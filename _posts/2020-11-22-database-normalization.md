---
layout: post
title: Step by Step Database Normalization
summary: Walkthrough an example of normalization from 1NF to 3NF
category: System-design-notes
tags: [architecture, database, normalization]
---

## Definitions

Database normalization is the process of structuring a relational database with a series of Normal Forms (NF) in order to:
- Reduce data redundancy, eliminate useless data.
- Improve data integrity, make sure data is logically stored, ensure its dependencies make sense.

## Normal Forms

There are at least 6 NFs, ranging for 1NF to 6NF, and couple of other forms in between. Informally, a relational database is often considered "normalized" if it meets 3NF.

## Example walkthrough

Assume our initial table look like this:

```
| book_id | title            | author    | author_nationality | format    | price | subject         | pages | publisher | publisher_country |
| ------- | ---------------- | --------- | ------------------ | --------- | ----- | --------------- | ----- | --------- | ----------------- |
| 1       | Understand SQL   | John Doe  | Canada             | E-book    | 10    | SQL, Database   | 200   | Amazon    | US                |
| 2       | Understand SQL   | John Doe  | US                 | Paperback | 30    | SQL, Database   | 200   | Amazon    | US                |
| 3       | Understand NoSQL | John Snow | US                 | Paperback | 35    | NoSQL, Database | 200   | Amazon    | US                |
```

### First Normal Form (1NF)

To satisfy 1NF, the values in each column of a table must be atomic or must not contain repeating groups of data.

In our table, `subject` contains multiple values which mean it doesn't comply. To fix it, we can separate them into a single table:

```
| subject_id | subject  |
| ---------- | -------- |
| 1          | SQL      |
| 2          | NoSQL    |
| 3          | Database |

| book_id | subject_id |
| ------- | ---------- |
| 1       | 1          |
| 1       | 3          |
| 2       | 1          |
| 2       | 3          |
| 3       | 2          |
| 3       | 3          |
```

### Second Normal Form (2NF)

To satisfy 2NF, no field should only be partially dependent on any candidate key in the table.

In our table, `price` depends on `format`. To fix it, we can separate them into a single table:

```
| book_id | format     | price |
| ------- | ---------- | ----- |
| 1       | E-book     | 10    |
| 2       | Paperback  | 30    |
| 3       | Paperback  | 35    |
```

### Third Normal Form (3NF)

To satisfy 3NF, columns should depend only upon the primary key of the table. It means that any column that is not related to the primary should be moved out, and potentially into its own table.

That said, we can move `author`, `author_nationality` into a table, `publisher` and `publisher_country` into a table as well. This results in our final version as follow:

```
| book_id | title            | pages | 
| ------- | ---------------- | ----- |
| 1       | Understand SQL   | 200   |
| 2       | Understand SQL   | 200   |
| 3       | Understand NoSQL | 200   |

| book_id | author_id | 
| ------- | --------- |
| 1       | 1         | 
| 2       | 1         |
| 3       | 2         |

| author_id | name      | nationality |
| --------- | --------- | ----------- |
| 1         | John Doe  | Canada      |
| 2         | John Snow | US          |

| book_id | publisher_id |
| ------- | ------------ |
| 1       | 1            |
| 2       | 1            |
| 3       | 1            |

| publisher_id | name   | country |
| ------------ | ------ | ------- |
| 1            | Amazon | US      |

| book_id | format     | price |
| ------- | ---------- | ----- |
| 1       | E-book     | 10    |
| 2       | Paperback  | 30    |
| 3       | Paperback  | 35    |

| book_id | subject_id |
| ------- | ---------- |
| 1       | 1          |
| 1       | 3          |
| 2       | 1          |
| 2       | 3          |
| 3       | 2          |
| 3       | 3          |

| subject_id | subject  |
| ---------- | -------- |
| 1          | SQL      |
| 2          | NoSQL    |
| 3          | Database |
```

## Conclusion

Even though normalization is a design goal, it's not always practical. As we can see from the example above, before normalizing it, it has more readability and usability in a sense that it's easier for us to view and query all the data with simple commands. After normalizing it, querying the same things requires JOIN queries, which can sometimes result in performance hit. That said, it really depends on our unique use cases to make trade-off among scalability, readability, and performance.

<hr>
**References:**
- <https://www.dreamincode.net/forums/topic/179103-relational-database-design-normalization/>
- <https://en.wikipedia.org/wiki/Database_normalization>
