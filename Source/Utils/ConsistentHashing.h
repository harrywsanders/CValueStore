#import <Foundation/Foundation.h>

@interface ConsistentHash : NSObject
@property (nonatomic, retain) NSArray* sortedHashes;
@property (nonatomic, retain) NSMutableDictionary* nodeDict;
@property (nonatomic, assign) NSInteger replicationFactor;
- (id)initWithNodes:(NSArray*)nodes replicationFactor:(NSInteger)factor;
- (void)addNodeWithName:(NSString*)nodeName;
- (void)removeNodeWithName:(NSString*)nodeName;
- (NSString*)getNodeForKey:(NSString*)key;
- (NSString*)SHA256Hash:(NSString*)input;
@end
