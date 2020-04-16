---
layout: post
title: Serverless architecture with AWS Lamda
summary: Serverless overview, pricing models, AWS Lamda technical constraints
category: System-design-notes
tags: [serverless, aws, lamda]
---

- Basic:
  - Also called function-as-a-service
  - Let developers focus on writing function/business logic instead of focusing on managing server
- Benefits
  - Shorter time to market for new features
  - Reduced operational costs
- Notable services: AWS Lamda, Google Cloud Functions
- Pricing model:
  - Pay for actual usage, not reserved capacity - pay none if use none
  - Depends on
    - Maximum memory for a task
    - Time it spent executing one
- AWS Lamda technical constraints
  - No session affinity - don't get to decide about starting up, shutting down instances, or managing states in-memory state between two functions
  - Non-deterministic latency - some requests will need to wait for a Lamda instance to start
  - Execution time-limited to 15 minutes
  - No direct control over processing power
- When to use Lamda
  - Throughput is critical and tasks parallelize nicely
    - Requests for dynamic content
    - Access to backend database
    - User data manipulation
    - Automatic email replies or chatbots
  - Splittable long-running tasks
    - File format conversion
    - Generating previews/thumbnails
    - Periodic reports
  - High availability tasks
    - Payment notifications from Stripe, PayPal,...
- When not to use
  - Latency guaranteed tasks
    - High-frequency trading systems
    - Near-real-time control systems
  - Long-running tasks
    - Video transcoding for large files
    - Connecting to a socket and consuming continuous data
  - Tasks demanding high processing power
    - Video rendering
  - Tasks requiring no on-demand computation
    - Serving static web files

<hr>
**References:**
- [https://www.educative.io/courses/running-serverless-applications-aws-lambda](https://www.educative.io/courses/running-serverless-applications-aws-lambda)
