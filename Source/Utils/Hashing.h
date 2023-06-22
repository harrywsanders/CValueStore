#import <Foundation/Foundation.h>

@interface Hashing : NSObject

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, Node *> *hashRing;
@property (nonatomic, assign) NSUInteger numberOfReplicas;

- (instancetype)initWithNodes:(NSArray<Node *> *)nodes numberOfReplicas:(NSUInteger)numberOfReplicas;
- (void)addNode:(Node *)node;
- (void)removeNode:(Node *)node;
- (Node *)getNodeForKey:(NSString *)key;

@end
