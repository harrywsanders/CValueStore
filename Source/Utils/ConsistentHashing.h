#import <Foundation/Foundation.h>

@interface ConsistentHash : NSObject
@property (nonatomic, retain) NSArray* sortedHashes;
@property (nonatomic, retain) NSDictionary* nodeDict;
- (id)initWithNodes:(NSArray*)nodes;
- (NSString*)getNodeForKey:(NSString*)key;
- (NSString*)MD5Hash:(NSString*)input;
@end
