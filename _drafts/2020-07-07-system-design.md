---
layout: post
title: High-Level System Design Experiment
summary: Learn system design by redesigning Youtube, Dropbox, Facebook, Messenger, Instagram, Uber, Pastebin, TinyURL and so on.
category: System-design-notes
tags: [architecture, system, design]
---

## URL Shortener

**Requirements clarifications**
- Functional requirements:
  - Given a URL, return a shorter and unique alias link.
  - Users can make custom links.
  - Short links will expire after a default timespan.
  - Users can specify the expiration time.
- System requirements:
  - The system should be highly available to prevent dead-end redirection.
  - Redirection should happen in real-time with minimal latency.
  - Shorten links shouldn't be guessable.
  - The system should provide analytics such as the number of times a redirection happens,...

**Component Design**
![URL Shortener's Component Design](/assets/images/sd-url-shortener.png)

- Key Generation Service generates an unique key for a given URL.
  - One way to do so is to compute a unique hash of the URL directly. We can hash the URL with an increasing sequence number to prevent key duplication given the same URL. We can also hash it with a user id though that requires an user to either sign in or provide a unique key if not signed in.
  - Another way is to generate unique keys beforehand so that we don't have to worry about duplications or collisions.
- A NoSQL database is a good option in this case for several reasons:
  - Each record in the database is small as it only holds the URL mapping and its owner.
  - There are no relationships between records.
  - The system is read-heavy.
  - It's easier to scale.
- In order to store billions of URL in the database, we can partition it in either ways:
  - Range-based partitioning where URLs are stored in separate partitions based on the first letter of the hash key. The problem is that it can lead to unbalanced partitions.
  - Hash-based partitioning where URLs are stored based their hashes over the number of servers, aka consistent hashing.
- Cleaning Service is a lightweight service that runs periodically to clean up expired links in the database and cache.
- Load Balancers can be added between clients and application servers as well as between application servers and databases to increase the service load.
- Cache Service can use existing caching server like Memcached to cache URLs that are frequently accessed.
  - We can also replicate caching servers to distribute load between them.
  - Whenever there's a cache miss, servers would be hitting databases. 
- Separate analytic tools can be used to track the number of times a short link has been used, users' locations, browsers, web page that refers the click, and so on.

<hr>
**References:**
- <https://www.educative.io/courses/grokking-the-system-design-interview>
