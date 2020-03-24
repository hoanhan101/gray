---
layout: post
title: A Brief History of Scaling LinkedIn
summary: How they started in 2003, had 2700 members the first week until 2015 when they served more then 350 millions members
category: System-design-notes
tags: [microservices, linkedin]
---

- Started as a single monolithic application, Leo, that hosted various pages, handled business logic and connected to a handful of databases
- Needed to manage a network of member connections and scale independent of Leo so built a new system for their member graph
  - Used Java RPC for communication, Apache Lucene for search capabilities
- Introduced replica DBs as the site grew
  - To keep replica DBs in sync, built data capture system, Databus, then open-sourced it
- Observed that Leo was often going down in production, difficult for the team to troubleshoot, recover, release new code
  - Killed Leo
  - Broke it up into many small services
    - Frontend: fetch data models from different domains, presentation logic
    - Mid-tier: provide API access to data models and add more layer of cache (memcache/couchbase/Voldemort)
    - Backend: provide consistent access to its database
- Developed data pipelines for streaming and queueing data that later became Apache Kafka
  - Empowered Hadoop jobs
  - Built realtime analytics
  - Improved monitoring and alerting
- In 2011, kicked off an internal initiative, Inversion
  - Paused on feature development 
  - Focused on improving tooling and deployment, infrastructure, and developer productivity
- Got rid of Jave RPC because it was inconsistent across team as well as tightly coupled and built Rest.li for a more scalable RESTful architecture
- Since fetching many types of different data and making hundreds of downstream calls made the "call graph" difficult to manage, the team grouped multiple services together to allow a single access API
  - Had a specific team optimize the block
- Scaled to 3 main data centers and multiple PoP around the globe in 2015
- Developed an offline workflow using Hadoop to precompute data insights
- Rethought frontend approach
  - Added client template, Dust.js, to the mix
  - Cached templates in CDNs and browsers
  - Adapted BigPipe and Play Framework for an async experience
- Introduced multiple tiers of proxies, Apache Traffic Server, HAProxy, to handle load balancing, data center pinning, security, intelligent routing, server side rendering,...
- Utilized optimized hardware, advanced memory and system tuning, and newer Java runtimes


<br>
**References:**
- [https://engineering.linkedin.com/architecture/brief-history-scaling-linkedin](https://engineering.linkedin.com/architecture/brief-history-scaling-linkedin)
