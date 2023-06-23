#import "ConsistentHash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ConsistentHash

- (id)initWithNodes:(NSArray*)nodes replicationFactor:(NSInteger)factor {
    self = [super init];
    if (self) {
        self.nodeDict = [NSMutableDictionary dictionary];
        self.replicationFactor = factor;

        for (NSString* node in nodes) {
            [self addNodeWithName:node];
        }
    }
    return self;
}

- (void)addNodeWithName:(NSString*)nodeName {
    for (NSInteger i = 0; i < self.replicationFactor; i++) {
        NSString* virtualNodeName = [NSString stringWithFormat:@"%@#%ld", nodeName, (long)i];
        NSString* nodeHash = [self SHA256Hash:virtualNodeName];
        self.nodeDict[nodeHash] = nodeName;
    }
    self.sortedHashes = [[self.nodeDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)removeNodeWithName:(NSString*)nodeName {
    for (NSInteger i = 0; i < self.replicationFactor; i++) {
        NSString* virtualNodeName = [NSString stringWithFormat:@"%@#%ld", nodeName, (long)i];
        NSString* nodeHash = [self SHA256Hash:virtualNodeName];
        [self.nodeDict removeObjectForKey:nodeHash];
    }
    self.sortedHashes = [[self.nodeDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (NSString*)getNodeForKey:(NSString*)key {
    if (!key) {
        return nil;
    }

    NSString* keyHash = [self SHA256Hash:key];
    NSUInteger index = [self.sortedHashes indexOfObject:keyHash 
                                         inSortedRange:(NSRange){0, [self.sortedHashes count]} 
                                               options:NSBinarySearchingInsertionIndex 
                                       usingComparator:^(id a, id b) { 
                                           return [a compare:b options:NSNumericSearch]; 
                                       }];

    index = index % [self.sortedHashes count];
    return self.nodeDict[self.sortedHashes[index]];
}

- (NSString*)SHA256Hash:(NSString*)input {
    if (!input) {
        return nil;
    }
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:HashStringLength];

    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }

    return output;
}
@end
