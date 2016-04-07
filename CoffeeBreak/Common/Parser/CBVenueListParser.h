//
//  CBVenueListParser.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBLocation;
@class CBVenue;


@interface CBVenueListParser : NSObject

+ (CBLocation *) locationFromDictionary:(NSDictionary *)dic;
+ (CBVenue *) venueFromDictionary:(NSDictionary *)dic;
+ (NSDictionary *) parse:(id)responseObject;

@end
