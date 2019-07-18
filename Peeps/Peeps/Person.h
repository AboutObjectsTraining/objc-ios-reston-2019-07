// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;

+ (id)personWithFirstName:(NSString *)firstName
                 lastName:(NSString *)lastName;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, assign) int age;

@end
