//
//  CBVenue.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class CBLocation;
@class CBCategory;
@class CBContact;

@interface CBVenue : NSObject


@property(nonatomic,strong) NSString *venueId;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) CBLocation *location;
@property(nonatomic,strong) CBCategory *category;
@property(nonatomic,strong) CBContact *contact;

- (NSString *)address;
- (CLLocationCoordinate2D) coordinate;
- (NSInteger)distance;

@end
