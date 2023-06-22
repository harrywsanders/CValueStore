#import <XCTest/XCTest.h>
#import "Cluster.h"

@interface ClusterTests : XCTestCase
@property (nonatomic, strong) Cluster *cluster;
@end

@implementation ClusterTests

- (void)setUp {
    [super setUp];
    self.cluster = [[Cluster alloc] init];
}

- (void)tearDown {
    self.cluster = nil;
    [super tearDown];
}

- (void)testAddNode {
    Node *node1 = [[Node alloc] initWithName:@"Node1"];
    [self.cluster addNode:node1];
    XCTAssertEqual([self.cluster.nodes count], 1);
    XCTAssertEqual(self.cluster.nodes[0], node1);
}

- (void)testRemoveNode {
    Node *node1 = [[Node alloc] initWithName:@"Node1"];
    Node *node2 = [[Node alloc] initWithName:@"Node2"];
    [self.cluster addNode:node1];
    [self.cluster addNode:node2];
    XCTAssertEqual([self.cluster.nodes count], 2);
    [self.cluster removeNode:node1];
    XCTAssertEqual([self.cluster.nodes count], 1);
    XCTAssertEqual(self.cluster.nodes[0], node2);
}

- (void)testGetNodeForKey {
    Node *node1 = [[Node alloc] initWithName:@"Node1"];
    Node *node2 = [[Node alloc] initWithName:@"Node2"];
    [self.cluster addNode:node1];
    [self.cluster addNode:node2];

    NSString *key = @"TestKey";
    Node *nodeForKey = [self.cluster getNodeForKey:key];
    XCTAssertTrue(nodeForKey == node1 || nodeForKey == node2);
}

@end
