#import "ConsistentHash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ConsistentHash
- (id)initWithNodes:(NSArray*)nodes {
    self = [super init];
    if (self) {
        NSMutableDictionary* nodeDict = [NSMutableDictionary dictionary];
        NSMutableArray* hashes = [NSMutableArray array];

        for (NSString* node in nodes) {
            NSString* nodeHash = [self MD5Hash:node];
            nodeDict[nodeHash] = node;
            [hashes addObject:nodeHash];
        }

        self.nodeDict = [NSDictionary dictionaryWithDictionary:nodeDict];

        // Sort the hashes
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        self.sortedHashes = [hashes sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    return self;
}

- (NSString*)getNodeForKey:(NSString*)key {
    NSString* keyHash = [self MD5Hash:key];
    // The array of sorted hashes is non-empty, so the bisect_right will always find an element.
    NSUInteger index = [self.sortedHashes indexOfObject:keyHash 
                                         inSortedRange:(NSRange){0, [self.sortedHashes count]} 
                                               options:NSBinarySearchingInsertionIndex 
                                       usingComparator:^(id a, id b) { 
                                           return [a compare:b options:NSNumericSearch]; 
                                       }];
    // If the hash is greater than the greatest hash, wrap around to the first hash.
    if (index == [self.sortedHashes count]) {
        index = 0;
    }
    return self.nodeDict[self.sortedHashes[index]];
}

- (NSString*)MD5Hash:(NSString*)input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }

    return output;
}
@end
