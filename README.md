# CValueStore

Welcome to CValueStore, a  distributed key-value store implemented in Objective-C. 🚀

## Overview

CValueStore is a project that aims to provide a fun and interactive way to explore the concepts of distributed key-value storage. With CValueStore, you can create a cluster of nodes, store key-value pairs, and retrieve values based on keys using consistent hashing.

## Features

- **Distributed Cluster**: Create a cluster of nodes to distribute the key-value pairs across multiple nodes.
- **Add and Remove Nodes**: Dynamically add or remove nodes from the cluster to adjust its capacity and handle changes in the system.
- **Consistent Hashing**: Use consistent hashing algorithm to distribute the keys across nodes, ensuring load balancing and scalability.
- **Randomized Key-Value Retrieval**: Retrieve the value associated with a key by traversing the distributed hash ring, adding an element of randomness to the retrieval process.

## Getting Started

To get started with CValueStore, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/CValueStore.git`
2. Open the Xcode project file.
3. Explore the different classes like `Cluster`, `Node`, and `ConsistentHash` to understand their roles in the system.
4. Run the project and interact with the cluster by adding nodes, storing key-value pairs, and retrieving values.

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
