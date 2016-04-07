//
//  CBVenueListParser.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBVenueListParser.h"
#import "CBLocation.h"
#import "CBVenue.h"
#import "CBCategory.h"
#import "CBContact.h"

#import "NSDictionary+Validation.h"

@implementation CBVenueListParser


+ (CBLocation *) locationFromDictionary:(NSDictionary *)dic
{
    CBLocation *loc = [[CBLocation alloc] init];
    [loc setAddress:[dic validObjectForKey:@"address"]];
    [loc setCc:[dic validObjectForKey:@"cc"]];
    [loc setCity:[dic validObjectForKey:@"city"]];

    [loc setCountry:[dic validObjectForKey:@"country"]];
    [loc setDistance:[dic integerForKey:@"distance"]];
    [loc setFormattedAddress:[dic validObjectForKey:@"formattedAddress"]];
    [loc setLat:[dic doubleForKey:@"lat"]];
    [loc setLng:[dic doubleForKey:@"lng"]];
    [loc setPostalCode:[dic validObjectForKey:@"postalCode"]];
    [loc setState:[dic validObjectForKey:@"state"]];
    
    return loc;
}

+ (CBVenue *) venueFromDictionary:(NSDictionary *)dic
{
    CBVenue *venue = [[CBVenue alloc] init];
    
    NSDictionary *locationDic = [dic validObjectForKey:@"location"];
    if(locationDic)
    {
        venue.location = [CBVenueListParser locationFromDictionary:locationDic];
    }
    
    NSDictionary *categoryDic = [[dic validObjectForKey:@"categories"] firstObject];
    if(categoryDic)
    {
        venue.category = [CBVenueListParser categoryFromDictionary:categoryDic];
    }
    
    NSDictionary *contactDic = [dic validObjectForKey:@"contact"];
    if(contactDic)
    {
        venue.contact = [CBVenueListParser contactFromDictionary:contactDic];
    }
    
    
    venue.name = [dic validObjectForKey:@"name"];
    venue.venueId = [dic validObjectForKey:@"id"];
    
    return venue;
}

+ (CBContact *) contactFromDictionary:(NSDictionary *)dic
{
    CBContact *contact = [[CBContact alloc] init];
    contact.formattedPhone = [dic validObjectForKey:@"formattedPhone"];
    contact.phone = [dic validObjectForKey:@"phone"];
    
    return contact;
}

+ (CBCategory *) categoryFromDictionary:(NSDictionary *)dic
{
    CBCategory *category = [[CBCategory alloc] init];
    
    NSDictionary *iconDic = [dic validObjectForKey:@"icon"];
    if(iconDic)
    {
        category.icon_prefix = [iconDic validObjectForKey:@"prefix"];
        category.icon_suffix = [iconDic validObjectForKey:@"suffix"];
    }
    
    category.name = [dic validObjectForKey:@"name"];
    category.pluralName = [dic validObjectForKey:@"pluralName"];

    return category;
}

/*
    parsing for responseObject
*/
+ (NSDictionary *) parse:(id)responseObject
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *venueList = [NSMutableArray array];
    
    NSDictionary *responseDic = [responseObject validObjectForKey:@"response"];
    NSArray *venues = [responseDic validObjectForKey:@"venues"];
    for (NSDictionary *venuedic in venues)
    {
        CBVenue *venue = [CBVenueListParser venueFromDictionary:venuedic];
        [venueList addObject:venue];
    }
    
    [dic setObject:venueList forKey:@"venues"];
    
    return dic;
}

@end
