#import "Cluster.h"

@implementation Cluster

- (instancetype)init {
    self = [super init];
    if (self) {
        _nodes = [NSMutableArray array];
    }
    return self;
}

- (void)addNode:(Node *)node {
    [self.nodes addObject:node];
}

- (void)removeNode:(Node *)node {
    [self.nodes removeObject:node];
}

- (Node *)getNodeForKey:(NSString *)key {
    // Implement consistent hashing algorithm to distribute keys
    // For simplicity, we'll return a random node for now
    NSUInteger randomIndex = arc4random_uniform((uint32_t)self.nodes.count);
    return self.nodes[randomIndex];
}

@end
