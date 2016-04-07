//
//  CBShopViewController.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 7..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBShopViewController.h"
#import "CBShopListViewController.h"
#import "CBShopMapViewController.h"
#import "CBShopDataController.h"
#import "CBShopChildViewControllerImpl.h"

//private type for CBShopViewController
typedef enum
{
    CBShopViewTypeMapView,
    CBShopViewTypeListView,
} CBShopViewType;


@interface CBShopViewController ()
{
    CBShopViewType _viewType;
}
@property(nonatomic) CBShopViewType viewType;
@property(weak, nonatomic) IBOutlet UIBarButtonItem *btnMap;
@property(nonatomic,strong) UIViewController <CBShopChildViewControllerImpl> *currentChildViewController;
@property(nonatomic,strong) CBShopDataController *dataController;
@end

@implementation CBShopViewController
@synthesize viewType = _viewType;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataController = [[CBShopDataController alloc] init];
    
    /*
        Every ChildViewContorller on CBShopViewControoler
        have to implement "CBShopChildViewControllerImpl" protocol.
    */
    __weak typeof(self) weakSelf = self;
    self.dataController.onLoadComplete = ^(NSError *error)
    {
        if([weakSelf.currentChildViewController conformsToProtocol:@protocol(CBShopChildViewControllerImpl)]
           && [weakSelf.currentChildViewController respondsToSelector:@selector(reloadData)])
        {
            [weakSelf.currentChildViewController reloadData];
        }
    };
    
    
    /// after updating user location, passing it to childviewcontroller if it necessary.
    self.dataController.didUpdateUserLocation = ^(CLLocationCoordinate2D loc)
    {
        if([weakSelf.currentChildViewController conformsToProtocol:@protocol(CBShopChildViewControllerImpl)]
           && [weakSelf.currentChildViewController respondsToSelector:@selector(updateUserLocation:)])
        {
            [weakSelf.currentChildViewController updateUserLocation:loc];
        }
    };
    
    // change view type and child view controller
    /*
        when using "self.viewType = CBShopViewTypeListView", childViewController is also changed.
        it is implemeted in setViewType:
    */
    self.viewType = CBShopViewTypeListView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//setting viewType
/*
*/
- (void)setViewType:(CBShopViewType)viewType
{
    _viewType = viewType;

    //changing childViewController, barButtonItem image.
    if(_viewType == CBShopViewTypeMapView)
    {
        [self _showShopMapViewController];
    } else
    {
        [self _showShopListViewController];
    }
}


//show ShopListViewController.
- (void)_showShopListViewController
{
    CBShopListViewController *vc = [[CBShopListViewController alloc] initWithNibName:@"CBShopListViewController" bundle:nil];
    vc.dataController = self.dataController;
    [self _transitionChildViewController:vc];
    
    //change image barbuttonItem after changing childviewcontroller
    [self.btnMap setImage:[UIImage imageNamed:@"map_bt"]];
}

//show  MapViewController
- (void)_showShopMapViewController
{
    CBShopMapViewController *vc = [[CBShopMapViewController alloc] initWithNibName:@"CBShopMapViewController" bundle:nil];
    vc.dataController = self.dataController;
    [self _transitionChildViewController:vc];
    
    
    //change image barbuttonItem after changing childviewcontroller
    [self.btnMap setImage:[UIImage imageNamed:@"menu_bt"]];
}

//transition ChildViewController
- (void) _transitionChildViewController:(UIViewController<CBShopChildViewControllerImpl> *)newVC
{
    //if currentChildViewController exist, remove it first before add.
    if(self.currentChildViewController)
    {
        [self.currentChildViewController willMoveToParentViewController:self];
        [self.currentChildViewController removeFromParentViewController];
        [self.currentChildViewController.view removeFromSuperview];
        self.currentChildViewController = nil;
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self addChildViewController:newVC];
    newVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:newVC.view];
    [newVC didMoveToParentViewController:self];
    
    UIView *childView = newVC.view;
    NSDictionary *views = NSDictionaryOfVariableBindings(childView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[childView]-|" options:0 metrics:nil views:views]];
    self.currentChildViewController = newVC;
    
    [self.view setNeedsDisplay];
}


#pragma mark -- action Bar Button Item.
- (IBAction)actionMap:(id)sender
{
    if(self.viewType == CBShopViewTypeListView)
    {
        self.viewType = CBShopViewTypeMapView;
    } else
    {
        self.viewType = CBShopViewTypeListView;
    }
}
@end
