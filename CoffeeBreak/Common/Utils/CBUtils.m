//
//  CBUtils.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBUtils.h"

@implementation CBUtils

// add Thousand Seperator
+ (NSString *) addThousandSeperator:(NSInteger)num
{
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    
    return [numberFormatter stringFromNumber: [NSNumber numberWithInteger:num]];
}

@end
