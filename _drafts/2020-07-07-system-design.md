---
layout: post
title: System Design Case Studies
summary: Let's design Youtube, Dropbox, Facebook, Instagram, Uber, TinyURL and so on.
category: System-design-notes
tags: [architecture, system, design]
---

## URL Shortening service

Functional requirements:
- Given a URL, return a shorter and unique alias link.
- Users can make custom links.
- Short links will expire after a default timespan.
- Users can specify the expiration time.

System requirements:
- The system should be highly available to prevent dead-end redirection.
- Redirection should happen in real-time with minimal latency.
- Shorten links shouldn't be guessable.
- The system should provide analytics such as the number of times a redirection happens,...

Database consideration:
- Each record is small.
- There are no relationships between records other than storing which user created a URL.
- The system is read-heavy.
-> A NoSQL store is a good option.

Algorithm design:
- One way to generate unique key is to compute a unique hash of the URL directly. To keep it short, we can hash the URL with an increasing sequence number to prevent key duplication given the same URL. Can also hash it with a user id though that requires an user to either sign in or provide a unique key if not signed in.
- Another way is to generate unique keys beforehand so that we don't have to worry about duplications or collisions.

**Component Design:**
![URL Shortener's Component Design](/assets/images/sd-url-shortener.png)

Consideration and trade-off:
- Load balancers can be added at 3 places: between clients and application servers, between application servers and databases, between application servers and cache servers.

Partitioning scheme:
- Range-based partitioning where URLs are stored in separate partitions based on the first letter of the hash key. The problem is that it can lead to unbalanced partitions.
- Hash-based partitioning where URLs are stored based their hashes over the number of servers, aka consistent hashing.

Cache:
- Use existing caching  server like Memcached.
- Can also replicate caching servers to distribute load between them.
- Whenever there's a cache miss, servers would be hitting databases. 

Telemetry

<hr>
**References:**
- <https://www.educative.io/courses/grokking-the-system-design-interview>
