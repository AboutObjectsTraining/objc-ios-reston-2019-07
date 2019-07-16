// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"
#import <stdlib.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCString {
    char a[] = "abcdefghijkl";
//    a[6] = 0;
    char *p = a;
    p += 6;
    printf("%s\n", a);
    printf("%s\n", p);
}

- (void)testMallocedCString {
    char a[] = "abcdefghijkl";
    char *myString = malloc(sizeof(a));
    strcpy(myString, a);
    char *p = myString;
    p += 6;
    printf("%s\n", myString);
    free(myString);
    printf("%s\n", p);
}

- (void)testPersonInstance {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    
    NSLog(@"Full name: %@", [fred fullName]);
    NSLog(@"%@", fred);
}

@end
