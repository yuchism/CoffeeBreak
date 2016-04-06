//
//  CBShopListCell.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CBVenueVMImpl;

@interface CBShopListCell : UITableViewCell


- (void) setVenueVM:(id<CBVenueVMImpl>) venueVM;

@end
