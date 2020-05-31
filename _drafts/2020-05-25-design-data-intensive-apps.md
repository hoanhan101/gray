---
layout: post
title: Martin Kleppmann, Designing Data-Intensive Applications
summary: Principles and practicalities of data systems and how to build data-intensive applications.
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
  - Transactional processing or analytic?
    - The basic database access pattern is similar to processing business transaction (create, read, update, delete record), as known as online transaction processing (OLTP).
    - Since OLTP are expected to be highly available as they're critical to the operation of the business, they're reluctant to let business analysts run ad-hoc analytic queries.
    - A data warehouse is a separate database that analysts can query without affecting OLTP operations.
      - Data is extracted from OLTP databases, transformed into an analysis-friendly schema, cleaned up, and then loaded into the data warehouse.
      - A big advantage of using a separate data warehouse is that the data warehouse can be optimized for analytic access patterns.
      - 2 popular schemas that data are stored in are star schema, snowflake schema.
  - Column-oriented storage:
    - In most OLTP databases, storage is laid out in a row-oriented fashion: all the values from one row of a table are stored next to each other. In the column-oriented storage, all the values are stored from each column together instead.
    - Since the sequences of values for each column are often look repetitive (distinct values are small), they often lend themselves well to compression.
  - Aggregation:
    - Since data warehouse queries often involve an aggregate function, such as COUNT, SUM, AVG, MIN or MAX, we can cache these aggregated values that are used often.
    - One way of creating such a cache is a materialized view, while data cube is a special case.
- Encoding and evolution.
  - Formats for encoding data.
    - Many languages come with built-in support for encoding in-memory objects to byte sequences though they are not used because it's language-specific and don't show good performance.
    - JSON, XML are widely known, supported due to the fact that they are simple, can be used by many languages and have built-in support for web browser. However, there are a lot of ambiguity around the encoding of numbers and they also don't support binary encoding (compact, efficient encoding). Hence the development of MessagePack, BSON, BJSON, and so on.
    - Thrift and Protocol Buffers are binary encoding libraries that require a schema for any data that is encoded, that is clearly defined forward and backward compatibility semantics. They come with a code generation tool that produces classes that implement the schema in various programming languages.
    - There's is also a binary encoding library Avro that is good for processing large files as in Hadoop’s use cases.
  - Modes of data flow (from one process to anther).
    - Databases: the process writing to the database encodes the data, and the process reading from the database decodes it.
    - Calls to services, REST and RPC (gRPC): client encodes a request, server decodes the request and encodes a response, and client finally decodes the response.
    - Asynchronous message-passing (RabbitMQ, Apache Kafka): nodes send each other messages that are encoded by the sender and decoded by the recipient.

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
