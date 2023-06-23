#import "Cluster.h"
#import "ConsistentHashing.h"

@implementation Cluster
{
    ConsistentHash* _consistentHash;
    NSMutableDictionary* _nodeDict;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _nodeDict = [NSMutableDictionary dictionary];
        _consistentHash = [[ConsistentHash alloc] initWithNodes:@[]];
    }
    return self;
}

- (void)addNode:(Node *)node {
    if (!node || [_nodeDict objectForKey:node.name]) {
        return;
    }

    [_nodeDict setObject:node forKey:node.name];
    [_consistentHash addNodeWithName:node.name];
}

- (void)removeNode:(Node *)node {
    if (!node || ![_nodeDict objectForKey:node.name]) {
        return;
    }

    [_nodeDict removeObjectForKey:node.name];
    [_consistentHash removeNodeWithName:node.name];
}

- (Node *)getNodeForKey:(NSString *)key {
    if (!key) {
        return nil;
    }

    NSString *nodeName = [_consistentHash getNodeForKey:key];
    return [_nodeDict objectForKey:nodeName];
}

@end
