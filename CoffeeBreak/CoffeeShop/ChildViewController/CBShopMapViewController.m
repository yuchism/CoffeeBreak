//
//  CBShopMapViewController.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBShopMapViewController.h"
#import "CBShopDataController.h"
#import "CBVenue.h"

#import <MapKit/MapKit.h>


@interface CBShopMapViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation CBShopMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- CBShopChildViewControllerImpl
- (void)reloadData
{
    [self _addAnnotation];
    [self _updateMapview:self.mapView.userLocation.coordinate];
}

- (void) _addAnnotation
{
    for(NSInteger idx = 0 ; idx < [self.dataController numberOfVenues]; idx ++)
    {
        CBVenue* venue = [self.dataController venueAtIndex:idx];
        MKPointAnnotation *ano = [[MKPointAnnotation alloc] init];
        ano.coordinate = venue.coordinate;
        [self.mapView addAnnotation:ano];
    }
}

- (void) _updateMapview:(CLLocationCoordinate2D)coordinate
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = coordinate;
    
    mapRegion.span.latitudeDelta = 0.01;
    mapRegion.span.longitudeDelta = 0.01;
    
    [self.mapView setRegion:mapRegion animated:NO];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
