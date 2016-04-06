//
//  CBLocationService.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBLocationService.h"
@interface CBLocationService()<CLLocationManagerDelegate>
{
        CLLocationManager *_locationManager;
}
@end
@implementation CBLocationService

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        //initialize CLlocationManager
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.distanceFilter = 10.0;
        
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [_locationManager requestWhenInUseAuthorization];
        }
        
        [_locationManager startUpdatingLocation];
    }
    return self;
}


#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    if(self.didUpdateLocation)
    {
        self.didUpdateLocation([locations firstObject]);
    }

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(self.didChangeAuthorizationStatus)
    {
        self.didChangeAuthorizationStatus(status);
    }

}

@end

