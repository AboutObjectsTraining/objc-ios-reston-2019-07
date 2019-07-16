// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClusterTests : XCTestCase
@end

@protocol Yelling <NSObject>
- (void)shout;
@end

@implementation ClusterTests

- (void)testStringClassCluster {
    
    NSString *s1 = [NSString alloc];
    NSLog(@"%@, %@", [s1 class], s1);

    NSString *s2 = [NSString alloc];
//    id s3 = [NSMutableString alloc];
    
    s1 = [s1 initWithFormat:@"%@ %@", @"Hello", @"World"];
    s2 = [s2 initWithFormat:@"Woo!"];
    
    NSLog(@"%@, %@", [s1 class], s1);
    NSLog(@"%@, %@", [s2 class], s2);
}

- (void)testProtocolStuff {
    id<NSCoding, NSObject> foo = @"Hey";
    NSLog(@"%@", [foo description]);
}

@end
