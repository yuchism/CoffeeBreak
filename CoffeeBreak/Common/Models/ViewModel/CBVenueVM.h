//
//  CBVenueVM.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBVenueVMImpl.h"
@class CBVenue;

@interface CBVenueVM : NSObject <CBVenueVMImpl>

- (instancetype)initWithVenue:(CBVenue *)venue;

@end
