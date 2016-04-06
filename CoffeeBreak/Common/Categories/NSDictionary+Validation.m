//
//  NSDictionary+Validation.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "NSDictionary+Validation.h"

@implementation NSDictionary(Validation)

- (id) validObjectForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    if([object isEqual:[NSNull null]])
    {
        return nil;
    }
    return object;
}

- (NSInteger) integerForKey:(id)akey
{
    id object = [self validObjectForKey:akey];
    if([object isKindOfClass:[NSNumber class]])
    {
        return [(NSNumber *)object integerValue];
    } else if([object isKindOfClass:[NSString class]])
    {
        return [object integerValue];
    }
    
    return 0;
}

- (double) doubleForKey:(id)aKey
{
    id object = [self validObjectForKey:aKey];
    if([object isKindOfClass:[NSNumber class]])
    {
        return [(NSNumber *)object doubleValue];
    } else if([object isKindOfClass:[NSString class]])
    {
        return [object doubleValue];
    }
    
    return 0.0f;
}


@end
