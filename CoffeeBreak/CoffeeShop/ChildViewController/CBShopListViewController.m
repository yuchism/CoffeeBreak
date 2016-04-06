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

#import "CBShopMapViewController.h"


#define CBShopListCellHeight 50.0f

@interface CBShopListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CBShopListViewController

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
