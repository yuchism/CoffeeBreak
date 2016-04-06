//
//  CBCategory.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBCategory : NSObject



- (NSString *) iconURL;

@property(nonatomic,strong) NSString *icon_prefix;
@property(nonatomic,strong) NSString *icon_suffix;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *pluralName;
@end
