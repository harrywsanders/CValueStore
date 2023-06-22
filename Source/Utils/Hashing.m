#import "Hashing.h"

@implementation Hashing

- (instancetype)initWithNodes:(NSArray<Node *> *)nodes numberOfReplicas:(NSUInteger)numberOfReplicas {
    self = [super init];
    if (self) {
        _hashRing = [NSMutableDictionary dictionary];
        _numberOfReplicas = numberOfReplicas;
        
        for (Node *node in nodes) {
            [self addNode:node];
        }
    }
    return self;
}

- (void)addNode:(Node *)node {
    for (NSUInteger i = 0; i < self.numberOfReplicas; i++) {
        NSUInteger hash = [[NSString stringWithFormat:@"%@-%lu", node.nodeID, (unsigned long)i] hash];
        self.hashRing[@(hash)] = node;
    }
}

- (void)removeNode:(Node *)node {
    for (NSUInteger i = 0; i < self.numberOfReplicas; i++) {
        NSUInteger hash = [[NSString stringWithFormat:@"%@-%lu", node.nodeID, (unsigned long)i] hash];
        [self.hashRing removeObjectForKey:@(hash)];
    }
}

- (Node *)getNodeForKey:(NSString *)key {
    NSUInteger hash = [key hash];
    NSUInteger nodeHash = [self findClosestNodeHashForHash:hash];
    return self.hashRing[@(nodeHash)];
}

- (NSUInteger)findClosestNodeHashForHash:(NSUInteger)hash {
    NSArray *sortedKeys = [[self.hashRing allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSNumber *key in sortedKeys) {
        if ([key unsignedIntegerValue] >= hash) {
            return [key unsignedIntegerValue];
        }
    }
    return [[sortedKeys firstObject] unsignedIntegerValue]; 
}

@end
