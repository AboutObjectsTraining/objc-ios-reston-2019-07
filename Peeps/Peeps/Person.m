// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
{
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    
    return self;
}

+ (id)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
    return [[self alloc] initWithFirstName:firstName lastName:lastName];
}

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}

- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}
- (int)age {
    return _age;
}

- (void)setAge:(int)newValue {
    _age = newValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@, age: %d", [self class], [self fullName], [self age]];
}

@end
