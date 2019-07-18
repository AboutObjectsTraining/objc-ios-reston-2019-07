// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

void sayHello(void) {
    printf("Hello\n");
}

void saySomethingNTimes(int numberOfTimes, void (^say)(NSString *)) {
    for (int i = 0; i < numberOfTimes; i++) {
        say(@"Grrr!");
    }
}

@interface BlockLiteralTests : XCTestCase
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) void (^printMessage)(NSString *);
@end

@implementation BlockLiteralTests

- (void)setUp {
    self.message = @"Woo";
}

- (void)testCapturingSelf {
    int x = 42;
    typeof(self) __weak weakSelf = self;
    self.printMessage = ^(NSString *prefix) {
        typeof(weakSelf) __strong strongSelf = weakSelf;
        printf("%s %s times %d!\n", prefix.UTF8String, strongSelf.message.UTF8String, x);
    };
    
    void (^myCopy)(NSString *) = [self.printMessage copy];
    myCopy(@"Wohoo");
}

- (void)testCapturingLocalState {
    int x = 42;
    saySomethingNTimes(3, ^(NSString *prefix) {
        printf("%s %s times %d!\n", prefix.UTF8String, self.message.UTF8String, x);
    });
}

- (void)testPassingBlockLiteralAsArgument {
    saySomethingNTimes(3, ^(NSString *prefix) {
        printf("%s Woof!\n", prefix.UTF8String);
    });
}


- (void)testFunctionPointer {
    void (*sayHelloRef)(void) = sayHello;
    
    sayHelloRef();
}

- (void)testBlockLiteral {
    void (^myBlockRef)(void) = ^{
        printf("Hello from my block!\n");
    };
    
    myBlockRef();
}

@end
