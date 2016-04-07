//
//  CBCoffeeShopDataController.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBShopDataController.h"
#import "CBFourSquareService.h"
#import "CBLocationService.h"
#import "NSDictionary+Validation.h"
#import "CBVenue.h"

@interface CBShopDataController()
{
    CBFourSquareService *_fsService;
    CBLocationService *_locService;
    
    NSMutableArray *_shopList;
}
@property(nonatomic,strong) CBFourSquareService *fsService;
@property(nonatomic,strong) CBLocationService *locService;
@property(nonatomic,strong) NSArray *shopList;

@end

@implementation CBShopDataController
@synthesize fsService = _fsService;
@synthesize locService = _locService;
@synthesize shopList = _shopList;


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self _initialize];
    }
    return self;
}

- (void) _initialize
{
    self.fsService = [[CBFourSquareService alloc] init];
    self.locService = [[CBLocationService alloc] init];
    
    __weak typeof(self) weakSelf = self;
    self.locService.didUpdateLocation = ^(CLLocation *location)
    {
        [weakSelf.fsService sendRequest:location onSucces:^(NSDictionary *responseDic)
        {
            
            NSArray *venues = [responseDic validObjectForKey:@"venues"];
            
            //sorting venues array after loading
            NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:YES];
            weakSelf.shopList = [venues sortedArrayUsingDescriptors:@[desc]];
            if(weakSelf.onLoadComplete)
            {
                weakSelf.onLoadComplete(nil);
            }
            
        } onFail:^(NSError *error) {
            if(weakSelf.onLoadComplete)
            {
                weakSelf.onLoadComplete(error);
            }
        }];
        
        //passing user current location
        if(weakSelf.didUpdateUserLocation)
        {
            weakSelf.didUpdateUserLocation(location.coordinate);
        }
    };
}

- (NSInteger)numberOfVenues
{
    return [self.shopList count];
}

- (CBVenue *)venueAtIndex:(NSInteger)idx
{
    return [self.shopList objectAtIndex:idx];
}

@end
