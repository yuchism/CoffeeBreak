//
//  CBShopListCell.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBShopListCell.h"
#import "CBVenueVMImpl.h"
#import "UIImageView+WebCache.h"


@interface CBShopListCell()
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;
@end

@implementation CBShopListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.contentView setBackgroundColor:[UIColor grayColor]];
}

- (void)prepareForReuse
{
    [self.lblName setText:@"-"];
    [self.lblAddress setText:@"-"];
    [self.lblDistance setText:@"-"];
    
    [self.iconView setImage:nil];
}

- (void) setVenueVM:(id<CBVenueVMImpl>) venueVM
{
    [self.lblName setText:[venueVM name]];
    [self.lblAddress setText:[venueVM address]];
    [self.lblDistance setText:[venueVM distance]];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[venueVM iconURL]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
