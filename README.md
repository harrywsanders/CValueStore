# CValueStore

Welcome to CValueStore, a distributed key-value store implemented in Objective-C. 🚀

## Overview

CValueStore is a project that aims to provide a simple and interactive way to explore the concepts of distributed key-value storage. With CValueStore, you can create a cluster of nodes, store key-value pairs, and retrieve values based on keys using consistent hashing.

## Features

- **Distributed Cluster**: Create a cluster of nodes to distribute the key-value pairs across multiple nodes.
- **Add and Remove Nodes**: Dynamically add or remove nodes from the cluster to adjust its capacity and handle changes in the system.
- **Consistent Hashing**: Use consistent hashing algorithm to distribute the keys across nodes, ensuring load balancing and scalability.
- **Randomized Key-Value Retrieval**: Retrieve the value associated with a key by traversing the distributed hash ring, adding an element of randomness to the retrieval process.

## Getting Started

To get started with CValueStore, follow these steps:

1. Clone the repository: `git clone https://github.com/harrywsanders/CValueStore.git`
2. Explore the different classes like `Cluster`, `Node`, and `ConsistentHash` to understand their roles in the system.
3. Run the project and interact with the cluster by adding nodes, storing key-value pairs, and retrieving values.

## Example Usage

Here's a simple example of how to use CValueStore:

```objective-c
// Create a cluster
Cluster *cluster = [[Cluster alloc] init];

// Create nodes and add them to the cluster
Node *node1 = [[Node alloc] initWithName:@"Node1"];
Node *node2 = [[Node alloc] initWithName:@"Node2"];
Node *node3 = [[Node alloc] initWithName:@"Node3"];
[cluster addNode:node1];
[cluster addNode:node2];
[cluster addNode:node3];

// Store key-value pairs
[cluster getNodeForKey:@"key1"].storage[@"key1"] = @"value1";
[cluster getNodeForKey:@"key2"].storage[@"key2"] = @"value2";

// Retrieve values for keys
NSString *value1 = [cluster getNodeForKey:@"key1"].storage[@"key1"];
NSString *value2 = [cluster getNodeForKey:@"key2"].storage[@"key2"];

NSLog(@"Value for key1: %@", value1);
NSLog(@"Value for key2: %@", value2);

## Goals

Here are some potential improvements and features I'm considering for the future of CValueStore:

- **Replication and Data Redundancy**: My top priority right now is to implement data replication across multiple nodes, meaning data will be duplicated and stored on different nodes, ensuring that even if one node fails, the data remains safe and accessible

- **Load Balancing**: I also want to enhance CValueStore's load balancing capabilities. By intelligently distributing the workload across nodes based on their capacity and performance, I can ensure that no node is overwhelmed while others remain underutilized, which'll help optimize the usage of resources and improve the overall performance of the system.

- **Virtual Nodes**: Introducing virtual nodes to the consistent hashing algorithm will bring additional flexibility and efficiency to CValueStore. Virtual nodes allow for more precise control over key distribution and load balancing. When nodes are added or removed, the workload will be automatically redistributed, ensuring smooth operations without disruptions.

- **Consistency Models**: I want to be able to support different consistency models, such as eventual consistency or strong consistency, allowing users to choose the level of data consistency based on their application requirements. This is a further out goal.

As always– shoot me an email or let me know however if you have any questions, and feel free to contribute!