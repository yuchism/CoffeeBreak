//
//  CBCoffeeShopDataController.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class CBVenue;

@interface CBShopDataController : NSObject


- (NSInteger)numberOfVenues;
- (CBVenue *)venueAtIndex:(NSInteger)idx;

@property(nonatomic,copy) void(^onLoadComplete)(NSError *error);
@property(nonatomic,copy) void(^didUpdateUserLocation)(CLLocationCoordinate2D location);

@end
