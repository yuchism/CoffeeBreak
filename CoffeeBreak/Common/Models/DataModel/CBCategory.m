//
//  CBCategory.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBCategory.h"
#import "CBUtils.h"

@implementation CBCategory


- (NSString *) iconURL
{
    
    NSAssert(self.icon_prefix && self.icon_suffix, @"icon_prefix & icon_suffix should be not null");
    
    if(self.icon_suffix && self.icon_prefix)
    {
        return [CBUtils fourSquareIconURLwithPrefix:self.icon_prefix suffix:self.icon_suffix];
    } else
    {
        return  nil;
    }
}

@end
