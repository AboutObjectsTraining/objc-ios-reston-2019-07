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

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@, age: %d", self.class, self.fullName, self.age];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    // FIXME: We should be calling allocWithZone: and setting ivars directly.
    Person *copy = [Person personWithFirstName:self.firstName lastName:self.lastName];
    copy->_age = _age;
    return copy;
}

@end
