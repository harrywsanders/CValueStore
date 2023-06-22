#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong, readonly) NSString *nodeID;
@property (nonatomic, strong, readonly) NSMutableDictionary *store;

- (instancetype)initWithNodeID:(NSString *)nodeID;

- (void)setData:(id)data forKey:(NSString *)key;
- (id)getDataForKey:(NSString *)key;
- (void)deleteDataForKey:(NSString *)key;

@end
