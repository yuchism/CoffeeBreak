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
{
    double _minLat;
    double _maxLat;
    double _minLng;
    double _maxLng;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation CBShopMapViewController
@synthesize dataController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;

    
    //reload data after initializing mapview.
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- CBShopChildViewControllerImpl
- (void)reloadData
{
    [self _resetMinMaxCoordinate];
    [self _addAnnotation];
    [self _zoomToFit:NO];
}


#pragma mark -- CBShopChildViewControllerImpl
//update current location
- (void)updateUserLocation:(CLLocationCoordinate2D)loc
{
    [self _updateMinMaxCoordinate:loc];
    [self _zoomToFit:NO];
}

//add coffeeshop pin on the mapview
- (void) _addAnnotation
{
    for(NSInteger idx = 0 ; idx < [self.dataController numberOfVenues]; idx ++)
    {
        CBVenue* venue = [self.dataController venueAtIndex:idx];
        MKPointAnnotation *ano = [[MKPointAnnotation alloc] init];
        ano.coordinate = venue.coordinate;
        [self.mapView addAnnotation:ano];
        
        [self _updateMinMaxCoordinate:venue.coordinate];
    }
}

/*
    Setting min,max latitude and longitude for zoom
*/
- (void) _updateMinMaxCoordinate:(CLLocationCoordinate2D) coordinate
{
    if ( coordinate.latitude  < _minLat ) _minLat = coordinate.latitude;
    if ( coordinate.latitude  > _maxLat ) _maxLat = coordinate.latitude;
    if ( coordinate.longitude < _minLng ) _minLng = coordinate.longitude;
    if ( coordinate.longitude > _maxLng ) _maxLng = coordinate.longitude;
}

- (void) _resetMinMaxCoordinate
{
    _minLat = 90;
    _maxLat = -90;
    
    _minLng = 180;
    _maxLng = -180;
}


- (void) _zoomToFit:(BOOL)ani
{
    //center of min/max coordinate
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((_minLat+_maxLat)/2.0, (_minLng+_maxLng)/2.0);
    
    //if center coordinate is invalid, do nothing.
    if(!CLLocationCoordinate2DIsValid(center))
    {
        return;
    }
    
    double diffLat = ((_maxLat - _minLat) == -180) ? 0 : _maxLat - _minLat;
    double diffLng = ((_maxLng - _minLng) == -360) ? 0 : _maxLng - _minLng;
    
    // add Margin
    diffLat += diffLat / 10;
    diffLng += diffLng / 10;
    
    // defalut mininum zoom of mapview
    CGFloat minLat = 0.002;
    CGFloat minLng = 0.002;
    
    diffLat = (diffLat < minLat) ? minLat : diffLat + (diffLat * 1.0/50.0);
    diffLng = (diffLng < minLng) ? minLng : diffLng + (diffLng * 1.0/30.0);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(diffLat, diffLng);
    MKCoordinateRegion region = MKCoordinateRegionMake (center, span);
    
    [_mapView setRegion:region animated:ani];
}



#pragma mark - MKMapViewDelegate
//zoom after finish loading map
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self _zoomToFit:NO];
}

@end
