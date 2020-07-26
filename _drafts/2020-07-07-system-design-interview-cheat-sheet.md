---
layout: post
title: System Design Interview Cheat Sheet
summary: Learn system design by redesigning Youtube, Dropbox, Facebook, Messenger, Instagram, Uber, Pastebin, TinyURL and so on.
category: System-design-notes
tags: [architecture, system, design]
---

## URL Shortener

URL Shortener provides short aliases redirecting to long URLs.

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
  - One way to do so is to compute a unique hash of the URL directly. We can hash the URL with an increasing sequence number to prevent key duplication given the same URL. We can also hash it with an user's ID though that requires an user to either sign in or provide a unique key if not signed in.
  - Another way is to generate unique keys offline beforehand. Whenever we want to store a new link, just take one of the already generated keys and use it. That way, we don't have to worry about duplications or collisions.
- Key Storage uses a NoSQL database in this case for several reasons:
  - Each record in the database is small as it only holds the URL mapping and its owner.
  - There are no relationships between records.
  - The system is read-heavy.
  - It's easier to scale.
- In order to store billions of URL in the database, we can partition it in either ways:
  - Range-based partitioning where URLs are stored in separate partitions based on the first letter of the hash key. The problem is that it can lead to unbalanced partitions.
  - Hash-based partitioning where URLs are stored based their hashes over the number of servers, aka consistent hashing.
- Cleaning Service is a lightweight service that runs periodically to clean up expired links in the database and cache.
- Load Balancers can be added added between clients and application servers as well as between application servers and databases to increase the service load.
- Cache Service can be added to cache URLs that are frequently accessed.
- Separate analytic tools can be used to track the number of times a short link has been used, users' locations, browsers, web page that refers the click, and so on.

## Instagram

Instagram lets users upload photos and share them with other users.

**Requirements clarifications**
- Functional requirements:
  - Users can upload, view, like, comment on, download photos/videos.
  - Users can upload as many photos/videos as they like.
  - Users can search for photos/videos titles, other usernames.
  - Users can follow other users.
  - Users can have a News Feed consisting of recent photos from all of their following users.
- System requirements:
  - The system should be highly reliable as any uploaded photo/video should never be lost.
  - Consistency can take a hit in the interest of availability. It's fine if an user doesn't see a photo or new changes for a while.
  - The system should be read-heavy as low latency is expected while viewing photos/videos.

**Component Design**
![Instagram's Component Design](/assets/images/sd-instagram.png)

- Image Hosting Service uses Object Storage Service to store actual photos/videos and Metadata Storage to store metadata information about the photos/videos.
- Object Storage Service uses distributed file storages such as HDFS or S3.
- Metadata Storage uses SQL databases as we need to store photos/videos metadata as well as their owners and followers.
- There are 2 ways we can partition metadata information in this case:
  - Partitioning based on User's ID so that all photos/videos of a user is on the same shard. Different issues with this approach include:
    - Some users have a lot of photos/videos compared to others, thus making the distribution unbalanced.
    - All photos/videos of a user might not fit on on shard, thus making distributing onto different shards resource-expensive.
    - Storing all photos/videos of a user on a shard makes the user's shard a single point of failure.
  - Partitioning based on Photo/Video's ID will fix all above problems. One way to generate a unique photo/video's ID is to use a Key Generation Service as in the URL Shortener.
- To create a New Feed for a given user, we need to fetch the latest photos/videos of one following users.
  - One way to do so is to pre-generate users' New Feeds continuously and storing them in a separate table. Whenever a request comes, we will query that table.
  - We can pull the New Feeds on a regular basis or whenever they need it. However, new data might not be shown until a request is issued.
  - We can maintain Long Poll requests for receiving updates, though there will be a performance hit for users who have millions of followers.
  - We can also adopt a hybrid approach where we only maintain Long Poll requests for users who has a small number of followers.
- Cache Service can be added to cache metadata informations/hot database rows.
- CDN sits on top of the Object Storage Service so that photos/videos can be served faster and more cost effective.

## Dropbox

Dropbox enables users to store data on remote servers that are accessible through the Internet.

**Requirements clarifications**
- Functional requirements:
  - Users can upload, view, download their files from any device.
  - Users can share files with others.
  - Files are sync automatically among devices.
  - Large files are supported.
  - Offline editing is supported.
- System requirements:
  - The system should be highly reliable as any uploaded file should never be lost.
  - The system is both read and write heavy.

**Component Design**
![Dropbox's Component Design](/assets/images/sd-dropbox.png)

- Client Application monitors user's local workspace and syncs all files with our remote Storage Service. It can be broken into 3 parts as follows:
  - Chunk Service is responsible for splitting/reconstructing files into/from smaller chunks. It retries only failed chunks as well as uploads only updated chunks, thus saving bandwidth and synchronization time.
  - Metadata Storage keeps track of all the files, their versions, location in the file system.
  - Management Service monitors the local workspace, distributes work load to Chunk Service, updates Metadata Storage about the modified changes, and communicates with the remote Synchronization Service on the uploading/downloading changes as well as communicating with other Client Applications (Web, Mobile, Desktop).
- Synchronization Service notifies clients about different changes for synchronization and applies these changes to them. It also takes advantages of Chunk Service to intelligently upload/download only updated bits of files.
- Since the system is read and write heavy as the Synchronization Service has to deal with a high number of clients pulling/pushing at the same time, a message Queue is introduced to balance its load.
- Metadata Storage keeps metadata of files, their owners and followers in a database of choice.
  - A relational database is more preferable as it natively supports ACID properties, which is critical in our case.
- Block Storage stores chunks of files uploaded by user.
- Cache Service can be added to cache hot chunks.

## Messenger

Messenger lets users chat with their friends both from their phones and its website.

**Requirements clarifications**
- Functional requirements:
  - Users can have one-one-one conversations with others.
  - Users can others online/offline status.
  - Users can have almost real-time chat experience with minimum latency.
  - Users can chat in groups.
  - Users are notified of new messages when they are back online.
- System requirements:
  - The system should be highly reliable as chat history should never be lost.
  - The system is both read and write heavy.

**Component Design**
![Messenger's Component Design](/assets/images/sd-messenger.png)

- To efficiently send/receive messages, users can keep a connection with a Chat Service using WebSocket.
  - Chat Service contains a number of Chat Servers. Depending on the load, we can scale up by adding more Chat Servers when needed.
  - Chat Service maintains a map of user's ID and their connection objects to fasten the lookup and redirecting messages process.
  - If an user/receiver is offline, Chat Service can store the message and retry sending it once the receiver connects.
  - To maintain the sequencing of the messages, Chat Service can keep a increasing sequence/version number with every message for each client.
  - To keep track of user's online/offline status, Chat Service can broadcast online status of a user to other relevant users.
- Load Balancer tells us which Chat Server holds the connection to which user by holding a map of users' ID to their Chat Servers.
- Storage Service uses a HBase dabase for several reasons:
  - Since we have a huge number of small messages that needed to be written in the database as well as query them sequentially in range, HBase is a good choice as it supports a very high rate of small updates and fetching a range of records quickly.
  - Relational database like MySQL or NoSQL like MongoDB is not a good fit because we can't afford to read/write every time user receives/sends a message.

<hr>
**References:**
- <https://www.educative.io/courses/grokking-the-system-design-interview>
