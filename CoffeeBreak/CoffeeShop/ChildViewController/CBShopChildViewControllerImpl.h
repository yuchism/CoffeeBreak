//
//  CBShopChildViewControllerImpl.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 7..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class CBShopDataController;

/**
    Protocol for ChildViewController of CBShopViewController
*/

@protocol CBShopChildViewControllerImpl <NSObject>

- (void)reloadData;

@optional
- (void)updateUserLocation:(CLLocationCoordinate2D)loc;


@property (nonatomic,weak) CBShopDataController *dataController;
@end