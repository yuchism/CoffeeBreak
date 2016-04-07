//
//  CBUtils.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBUtils : NSObject
+ (NSString *) addThousandSeperator:(NSInteger)num;
+ (NSString *) fourSquareIconURLwithPrefix:(NSString *)prefix suffix:(NSString *)suffix;
+ (NSString *) fourSquareIconURLwithPrefix:(NSString *)prefix suffix:(NSString *)suffix size:(NSString *)size;

@end
