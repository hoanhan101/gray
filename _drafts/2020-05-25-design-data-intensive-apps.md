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
- Storage and retrieval.
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
