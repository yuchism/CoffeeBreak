//
//  CBVenue.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBVenue.h"
#import "CBLocation.h"
#import "CBCategory.h"
#import "CBContact.h"

@implementation CBVenue


- (NSString *)address
{
    if(self.location.formattedAddress)
    {
        return [self.location.formattedAddress componentsJoinedByString:@" "];
    }
    
    return nil;
}

- (CLLocationCoordinate2D) coordinate
{
    return CLLocationCoordinate2DMake(self.location.lat, self.location.lng);
}

- (NSInteger) distance
{
    return self.location.distance;
}


@end
