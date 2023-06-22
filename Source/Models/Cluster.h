#import <Foundation/Foundation.h>
#import "Node.h"

@interface Cluster : NSObject

@property (nonatomic, strong, readonly) NSMutableArray<Node *> *nodes;

- (void)addNode:(Node *)node;
- (void)removeNode:(Node *)node;
- (Node *)getNodeForKey:(NSString *)key;

@end
