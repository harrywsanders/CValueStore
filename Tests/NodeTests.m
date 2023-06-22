#import <XCTest/XCTest.h>
#import "Node.h"

@interface NodeTests : XCTestCase
@property (nonatomic, strong) Node *node;
@end

@implementation NodeTests

- (void)setUp {
    [super setUp];
    self.node = [[Node alloc] initWithNodeID:@"testNode"];
}

- (void)tearDown {
    self.node = nil;
    [super tearDown];
}

- (void)testNodeInitialization {
    XCTAssertNotNil(self.node);
    XCTAssertEqualObjects(self.node.nodeID, @"testNode");
}

- (void)testSettingAndGettingData {
    [self.node setData:@"testData" forKey:@"testKey"];
    XCTAssertEqualObjects([self.node getDataForKey:@"testKey"], @"testData");
}

- (void)testDeletingData {
    [self.node setData:@"testData" forKey:@"testKey"];
    [self.node deleteDataForKey:@"testKey"];
    XCTAssertNil([self.node getDataForKey:@"testKey"]);
}

@end
