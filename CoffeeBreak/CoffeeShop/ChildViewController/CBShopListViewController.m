//
//  CBCoffeeShopsViewController.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBShopListViewController.h"
#import "CBShopDataController.h"
#import "CBShopListCell.h"
#import "CBVenueVM.h"
#import "CBVenue.h"
#import "CBContact.h"
#import <MapKit/MapKit.h>

#import "CBShopMapViewController.h"


#define CBShopListCellHeight 67.0f

@interface CBShopListViewController ()<UITableViewDelegate,UITableViewDataSource>
{

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CBShopListViewController
@synthesize dataController;

static NSString * const cellReuseIdentifier = @"CBShopListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"CBShopListCell" bundle:nil] forCellReuseIdentifier:cellReuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) _showActionSheet:(CBVenue *)venue
{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:[venue name]
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    

    //add cancel action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];

    
    //add map action
    UIAlertAction *mapAction = [UIAlertAction actionWithTitle:@"Show on the Map" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        
        ;
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:[venue coordinate] addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:[venue name]];
        NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking};
        
        [mapItem openInMapsWithLaunchOptions:options];
        
    }];
    [alertController addAction:mapAction];
    
    
    
    //add phone call action
    if([[venue contact] phone] && [[venue contact] formattedPhone] && [[[venue contact] phone] length] > 0)
    {
    
        NSString *titleCall = [NSString stringWithFormat:@"Call : %@",[[venue contact] formattedPhone]];
        UIAlertAction *phoneCallAction = [UIAlertAction actionWithTitle:titleCall style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *phoneCall = [NSString stringWithFormat:@"tel:%@",[[venue contact] phone]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneCall]];

        }];
        

        [alertController addAction:phoneCallAction];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBVenue *venue = [self.dataController venueAtIndex:indexPath.row];
    [self _showActionSheet:venue];
}




#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    CBVenue *venue = [self.dataController venueAtIndex:indexPath.row];
    CBVenueVM *venueVM = [[CBVenueVM alloc] initWithVenue:venue];
    [cell setVenueVM:venueVM];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CBShopListCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController numberOfVenues];
}

#pragma mark -- CBShopChildViewControllerImpl
- (void)reloadData
{
    [self.tableView reloadData];
}

@end
