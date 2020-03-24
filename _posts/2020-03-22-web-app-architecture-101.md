---
layout: post
title: Web Application Architecture 101
summary: A comprehensive insight into the web application architecture including client-server, peer to peer decentralized architecture, microservices, and so on
category: System-design-notes
tags: [architecture]
---

- Tiers 
  - A tier is a logical separation of components in an application or service - database, backend app, user interface, messaging, caching
  - Single tier: user interface, backend business logic, database reside in the same machine
    - Pros: no network latency
    - Cons: hard to maintain once is shipped
  - Two-tier: client (user interface, business logic) & server (database)
    - Communication happens over the HTTP protocol (request-response model & stateless)
    - REST API takes advantage of the HTTP methodologies to establish communication between the client and the server
  - Three-tier: user interface, application logic, database reside in different machines
  - N-tier: more than 3 components involved - cache, message queues, load balancers,...
    - Single Responsibility Principle: a component has only a single responsibility 
    - Separation of concerns: keep components separate, make them reusable
- Scalability
  - Ability to withstand increased workload without sacrificing the latency
  - Latency an be divided into 2 parts:
    - Network latency: amount of time the network takes to send data packet from point A to B
    - Application latency: amount of time the application takes to process a user request
  - Type of scalability
    - Vertical scaling/scaling up: adding more power to server
      - Pros: not a lot of overhead on monitoring, operating and maintaining
      - Cons: single point of failure
    - Horizontal scaling/scaling out: adding more hardware to the existing resource pool
      - Pros: cheaper, better fault-tolerance
      - Cons: managing server is hard, writing distributed computing program is also challenging
  - Common bottlenecks that hurt scalability
    - Database latency
    - Poor application architecture
    - Not caching wisely
    - Inefficient configuration and load balancing
    - Adding business logic to the database
    - Badly written code
  - Common strategies to improve and test the scalability
    - Profiling
    - Cache wisely
    - Use a CDN
    - Compress data
    - Avoid unnecessary round trips between client and sever
    - Run load & stress tests
- High Availability
  - Ability to stay online despite having failures at the infrastructural level in real-time
  - Common reasons for system failures
    - Software crashes
    - Hardware crashes
    - Human error
    - Planned downtime
  - A common way to add more availability is to have redundancy - duplicating the components & keeping them on standby to take over in case the active instances go down
- Monolithic & Microservices
  - Monolithic: entire application code in a single codebase
    - Pros: simple to develop, test, deploy as everything resides in one repo
    - Cons:
      - Continuous deployment means re-deploying the entire application
      - Single point of failure
      - Hard to scale


<br>
**References:**
- [https://www.educative.io/courses/web-application-software-architecture-101](https://www.educative.io/courses/web-application-software-architecture-101)
