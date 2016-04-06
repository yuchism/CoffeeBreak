//
//  CBVenueVM.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBVenueVM.h"
#import "CBVenue.h"
#import "CBCategory.h"
#import "CBLocation.h"
#import "CBContact.h"
#import "CBUtils.h"


@interface CBVenueVM()
{
    
}
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *iconURL;
@property(nonatomic,strong) NSString *distance;
@property(nonatomic,strong) NSString *phoneNumber;

@property(nonatomic) double lat;
@property(nonatomic) double lng;
@end

@implementation CBVenueVM

- (instancetype)initWithVenue:(CBVenue *)venue
{
    self = [super init];
    if(self)
    {
        self.name = [venue name];
        self.address = [venue address];
        self.iconURL = [[venue category] iconURL];
        
        NSString *distanceString = [CBUtils addThousandSeperator:[[venue location] distance]];
        self.distance = [NSString stringWithFormat:@"%@ M",distanceString];
        self.phoneNumber = [[venue contact] formattedPhone];
        self.lat = [[venue location] lat];
        self.lng = [[venue location] lng];
    }
    return self;
}


@end
