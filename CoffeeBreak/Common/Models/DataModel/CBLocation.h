//
//  CBLocation.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBLocation : NSObject

@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *cc;
@property(nonatomic) NSInteger distance;
@property(nonatomic,strong) NSString *city;
@property(nonatomic,strong) NSString *country;
@property(nonatomic,strong) NSArray *formattedAddress;
@property(nonatomic) double lat;
@property(nonatomic) double lng;
@property(nonatomic,strong) NSString *postalCode;
@property(nonatomic,strong) NSString *state;

@end
