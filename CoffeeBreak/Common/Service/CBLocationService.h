//
//  CBLocationService.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CBLocationService:NSObject
{

}
@property(nonatomic,copy) void (^didChangeAuthorizationStatus)(CLAuthorizationStatus status);
@property(nonatomic,copy) void (^didUpdateLocation)(CLLocation *location);

@end
