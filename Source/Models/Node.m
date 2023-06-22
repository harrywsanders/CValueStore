#import "Node.h"

@implementation Node

- (instancetype)initWithNodeID:(NSString *)nodeID {
    self = [super init];
    if (self) {
        _nodeID = nodeID;
        _store = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setData:(id)data forKey:(NSString *)key {
    [self.store setObject:data forKey:key];
}

- (id)getDataForKey:(NSString *)key {
    return [self.store objectForKey:key];
}

- (void)deleteDataForKey:(NSString *)key {
    [self.store removeObjectForKey:key];
}

@end
