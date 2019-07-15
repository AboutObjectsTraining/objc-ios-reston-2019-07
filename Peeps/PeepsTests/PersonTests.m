// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testPersonInstance {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    
    NSLog(@"Full name: %@", [fred fullName]);
    NSLog(@"%@", fred);
}

@end
