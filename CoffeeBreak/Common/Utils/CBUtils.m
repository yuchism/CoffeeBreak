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
/*
 Pieces needed to construct category icons at various sizes.
 Combine prefix with a size (32, 44, 64, and 88 are available) and suffix
*/
+ (NSString *) fourSquareIconURLwithPrefix:(NSString *)prefix suffix:(NSString *)suffix
{
    NSString *iconSize = @"44";
    
    return [NSString stringWithFormat:@"%@%@%@",prefix,iconSize,suffix];
}

@end
