#import <Foundation/Foundation.h>
#import "Cluster.h"
#import "Node.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a cluster
        Cluster *cluster = [[Cluster alloc] init];

        // Create nodes and add them to the cluster
        Node *node1 = [[Node alloc] initWithName:@"Node1"];
        Node *node2 = [[Node alloc] initWithName:@"Node2"];
        Node *node3 = [[Node alloc] initWithName:@"Node3"];
        [cluster addNode:node1];
        [cluster addNode:node2];
        [cluster addNode:node3];

        // Retrieve node for a key
        NSString *key = @"testKey";
        Node *nodeForKey = [cluster getNodeForKey:key];
        NSLog(@"Node for key %@: %@", key, nodeForKey.name);
    }
    return 0;
}
