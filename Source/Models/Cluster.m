#import "Cluster.h"
#import "ConsistentHashing.h"

@implementation Cluster
{
    ConsistentHash* _consistentHash;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _nodes = [NSMutableArray array];
        _consistentHash = [[ConsistentHash alloc] initWithNodes:@[]];
    }
    return self;
}

- (void)addNode:(Node *)node {
    [self.nodes addObject:node];

    // When a node is added, we need to update the ConsistentHash object
    NSMutableArray *nodeNames = [NSMutableArray array];
    for (Node *node in self.nodes) {
        [nodeNames addObject:node.name];
    }
    _consistentHash = [[ConsistentHash alloc] initWithNodes:nodeNames];
}

- (void)removeNode:(Node *)node {
    [self.nodes removeObject:node];

    // When a node is removed, we need to update the ConsistentHash object
    NSMutableArray *nodeNames = [NSMutableArray array];
    for (Node *node in self.nodes) {
        [nodeNames addObject:node.name];
    }
    _consistentHash = [[ConsistentHash alloc] initWithNodes:nodeNames];
}

- (Node *)getNodeForKey:(NSString *)key {
    // Use the ConsistentHash object to get the name of the node for the key
    NSString *nodeName = [_consistentHash getNodeForKey:key];

    // Search the nodes for the one with this name
    for (Node *node in self.nodes) {
        if ([node.name isEqualToString:nodeName]) {
            return node;
        }
    }

    // If no node is found (which should not happen), return nil
    return nil;
}

@end
