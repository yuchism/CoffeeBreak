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
#import "CBMacros.h"


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
    [self.contentView setBackgroundColor:ColorFromRGB(0xFF, 0xE5, 0xCC)];
    self.iconView.tintColor = ColorFromRGB(0x51, 0x2A, 0x00);
    

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

    __weak typeof(self) weakSelf = self;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[venueVM iconURL]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [weakSelf.iconView setImage:image];
        
    }];
     
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
