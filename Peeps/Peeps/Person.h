// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    // Ivars
@private
    NSString *_firstName;
    NSString *_lastName;
    int _age;
}

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;

+ (id)personWithFirstName:(NSString *)firstName
                 lastName:(NSString *)lastName;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSString *)fullName;

- (int)age;
- (void)setAge:(int)newValue;

@end
