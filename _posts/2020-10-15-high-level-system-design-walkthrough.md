---
layout: post
title: High Level System Design Walkthrough
summary: From requirements clarifications to component design of a Photo/Video Sharing Service, File Hosting Service and Chat Service.
category: System-design-notes
tags: [architecture, system, design]
---

<h2> Table of Contents </h2>

* TOC
{:toc}

<hr>

## Photo/Video Sharing Service

Photo/Video Sharing Service lets users upload photos/videos and share them with other users.

**Similar services**
- Instagram
- Youtube
- Netflix

**Requirements clarifications**
- Functional requirements:
  - Users can upload, view, like/dislike, comment, download photos/videos.
  - Photos/videos stats are recorded: numbers of likes/dislike, views, etc.
  - Users can upload as many photos/videos as they like.
  - Users can search for photos/videos titles, and other usernames.
  - Users can follow other users.
  - Users can have a News Feed consisting of recent photos/videos from all of their following users.
- System requirements:
  - The system should be highly reliable as any uploaded photo/video should never be lost.
  - Consistency can take a hit in the interest of availability. It's fine if an user doesn't see a photo/video or new changes for a while.
  - The system should be read-heavy as low latency is expected while viewing photos/videos.

**Component Design**
![Photo/Video Sharing Service's Component Design](/assets/images/sd-photo-video-sharing-service.png)

- Image Hosting Service uses Object Storage Service to store actual photos/videos and Metadata Storage to store metadata information about the photos/videos.
  - Each uploaded photo/video will be pushed to a Queue to be dequeued later for encoding, thumbnail generation, and storage.
  - Each uploaded photo/video will be run against a matching algorithm (e.g., Block Matching, Phase Correlation, etc.) to find duplications. Then we can either stop the upload to use the existing copy or intelligently divide the it into smaller chunks and upload the missing parts.
- Object Storage Service uses distributed file storages such as HDFS or S3.
- Metadata Storage uses SQL databases as we need to store photos/videos metadata as well as their owners and followers.
- There are 2 ways we can partition metadata information in this case:
  - Partitioning based on User's ID so that all photos/videos of a user is on the same shard. Different issues with this approach include:
    - Some users have a lot of photos/videos compared to others, thus making the distribution unbalanced.
    - All photos/videos of a user might not fit on on shard, thus making distributing onto different shards resource-expensive.
    - Storing all photos/videos of a user on a shard makes the user's shard a single point of failure.
  - Partitioning based on Photo/Video's ID will fix all above problems, though we have to query all partitions to find photos/videos of a user and aggregate them, which can result in higher latencies.
    - To improve performance, we can introduce cache to store hot photos/videos in front of partitions.
    - To have a more intelligent cache, we can go with 80/20 rule where 20% photos/videos generating 80% read traffic, we can try to cache 20% of daily read volume from each shard.
- To create a New Feed for a given user, we need to fetch the latest photos/videos of one following users.
  - One way to do so is to pre-generate users' New Feeds continuously and storing them in a separate table. Whenever a request comes, we will query that table.
  - We can pull the New Feeds on a regular basis or whenever they need it. However, new data might not be shown until a request is issued.
  - We can maintain Long Poll requests for receiving updates, though there will be a performance hit for users who have millions of followers.
  - We can also adopt a hybrid approach where we only maintain Long Poll requests for users who has a small number of followers.
- Cache Service can be added to cache metadata informations/hot database rows.
- CDN is also be used so that photos/videos can be served faster and more cost effective.

## File Hosting Service

File Hosting Service enables users to store data on remote servers that are accessible through the Internet.

**Similar services**
- Dropbox
- Google Drive

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
![File Sharing Service's Component Design](/assets/images/sd-file-sharing-service.png)

- Client Application monitors user's local workspace and syncs all files with our remote Storage Service. It can be broken into 3 parts as follows:
  - Chunk Service is responsible for splitting/reconstructing files into/from smaller chunks. It retries only failed chunks as well as uploads only updated chunks, thus saving bandwidth and synchronization time.
  - Metadata Storage keeps track of all the files, their versions, location in the file system.
  - Management Service monitors the local workspace, distributes work load to Chunk Service, updates Metadata Storage about the modified changes, and communicates with the remote Synchronization Service on the uploading/downloading changes as well as communicating with other Client Applications (Web, Mobile, Desktop).
- Synchronization Service notifies clients about different changes for synchronization and applies these changes to them. It also takes advantages of Chunk Service to intelligently upload/download only updated bits of files.
- Since the system is read and write heavy as the Synchronization Service has to deal with a high number of clients pulling/pushing at the same time, a Message Queue is introduced to balance its load.
- Metadata Storage keeps metadata of files, their owners and followers in a database of choice.
  - A relational database is more preferable as it natively supports ACID properties, which is critical in our case.
- Block Storage stores chunks of files uploaded by user.
- Cache Service can be added to cache hot chunks.

## Chat Service

Chat Service lets users chat with their friends both from their phones and its website.

**Similar services**
- Messenger

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
![Chat Service's Component Design](/assets/images/sd-chat-service.png)

- To efficiently send/receive messages, a client can keep a connection with Chat Service using WebSocket.
  - Chat Servers are the building block of Chat Service. They handle all users' requests, read/write from the database. Depending on the load, we can scale up by adding more Chat Servers when needed.
  - To maintain the sequencing of the messages, Chat Service can keep a increasing sequence/version number with every message for each client.
  - To keep track of user's online/offline status, Chat Service can broadcast online status of a user to other relevant users.
  - To enable group chat functionality, we can define a group chat object that maintain a list of users in a separate table in the database.
  - If an user/receiver is offline, Chat Service can store the message and retry sending it once the receiver connects. Alternatively, Chat Service can talk to Notification Service to handle the delivery process and enable push notification on user's devices.
- Load Balancer tells us which Chat Server holds the connection to which user by holding a map of users' ID to their Chat Servers.
  - It assigns each user to a Chat Server based on the hash of their user's ID.
  - It forwards users' messages to their Chat Servers.
- Storage Service uses HBase database for several reasons:
  - Since we have a huge number of small messages that needed to be written in the database as well as query them sequentially in range, HBase is a good choice as it supports a very high rate of small updates and fetching a range of records quickly.
  - Relational database like MySQL or NoSQL like MongoDB is not a good fit because we can't afford to read/write every time user receives/sends a message.
- We can partition based on the hash of user's ID so that all messages of a user are on the same database. This also makes it fast to fetch chat history of any user.
- We can cache a few recent messages in a few recent conversations of each user. Since all user's messages are on one shard, the cache should also be on the same machine too.

## One more thing

Let me know if you have any question/thought/feedback in the comment section below.

<hr>
**References:**
- <https://www.educative.io/courses/grokking-the-system-design-interview>
