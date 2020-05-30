---
layout: post
title: Martin Kleppmann, Designing Data-Intensive Applications
summary: Principles and the practicalities of data systems and how to build data-intensive applications.
category: System-design-notes
tags: [architecture]
---

### Foundation of data systems

- Reliable, scalable, maintainable applications.
  - Reliability means continuing to work correctly, even when things go wrong. Common faults and preventions include:
    - Hardware faults: hard disks crash, blackout, incorrect network configuration,...
      - Add redundancy to individual hardware components to reduce the failure rate.
      - As long as we can restore a backup onto a new machine quickly, the downtime is not fatal.
    - Software faults: bug, out of shared resources, unresponsive service, cascading failure,...
      - There's no quick solution other than thorough testing, measuring, monitoring, analyzing.
    - Human errors: design error, configuration error,...
      - Enforce good design, good practice and training.
      - Decouple the places where people make the most mistake.
      - Automate testing: unit test, integration test, end-to-end test.
      - Allow quick recovery rollback strategy.
      - Set up detials monitoring
  - Scalability describes a system's ability to cope with increased load.
    - Describing load: requests per second, read/write radio, active users, cache hit rate,...
    - Describing performance:
      - When you increase a load parameter, keep system resources unchanged, how is performance affected?
      - When you increase a load parameter, how much do you increase the resources if you want to keep performance unchanged?
    - Approaches for coping with load:
      - Scaling up (vertical scaling): move to a more powerful machine.
      - Scaling out (horizontal scaling): distribute the load across different machines.
  - Maintainability focuses on 3 design principles:
    - Operability: make it easy for operation teams to keep the system running smoothly.
      - Provide monitoring system health.
      - Support for automation and integration tools.
      - Have Good documentation.
    - Simplicity: make it easy for new engineers to understand the system.
      - Provide good abstraction layers that allow us to extract parts of a large system into well-defined, reusable components.
    - Evolvability: make it easy for engineers to make changes.
      - Follow agile approach.
- Data models and query languages.
  - Data started out being represented as one big tree, though it wasn't good for representing many-to-many relationships models, so the relational model was invented.
  - However, some applications didn't fit well into the relational model, non-relational NoSQL was born:
    - Document database: self-contained documents, rare relationships between one model and another.
    - Graph database: anything is related to everything.
- Storage and retrieval.
  - Data structres that power your database:
    - Hash indexes:
      - Basically key-value pairs where each key is mapped to a byte offset in the data file.
      - Can also split it into smaller chunks/segments for easy storing.
      - Even though it's easy to understand and implement, it has memory constrains that the hash table must fit in memory. Also range queries are not efficient since hashed keys are not put next to each other.
    - Sorted String Table (SSTable) and Log-Structured Merge-Tree (LSM-trees):
      - SSTable maintains a list of key-value pairs that is sorted by key.
      - The table can also be split into smaller segments and merging is simple as it is sorted.
      - Maintaining a sorted structure on disk is possible, though keeping it in memory is easy as we can use a tree data structure such as Red-Black trees or AVL trees (memtable).
      - If the database crashes, memtable might be lost though we can keep a separate log for it, inspired by LSM-tree indexing structure.
    - B-trees:
      - Like SSTables, B-trees keep key-value pairs sorted by key, which allows efficient key-value lookups and range queries.
      - Instead of breaking down the database into variable-size segments and always writing sequentially, B-trees break into fixed-size blocks/pages and reading/writing one page at a time.
- Encoding and evolution.

### Distributed data

- Replication.
- Partitioning.
- Transactions.
- The trouble with distributed systems
- Consistency and consensus

### Derived data

- Batch processing.
- Stream processing.

<hr>
**References:**
- <https://www.goodreads.com/book/show/23463279-designing-data-intensive-applications>
