//
//  CBAvenueVM.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CBVenueVMImpl <NSObject>


@property(nonatomic,readonly) NSString *name;
@property(nonatomic,readonly) NSString *address;
@property(nonatomic,readonly) NSString *iconURL;
@property(nonatomic,readonly) NSString *distance;
@property(nonatomic,readonly) NSString *phoneNumber;

@property(nonatomic,readonly) double lat;
@property(nonatomic,readonly) double lng;
@end
