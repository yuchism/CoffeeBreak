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
    // Do any additional setup after loading the view from its nib.
    self.dataController = [[CBShopDataController alloc] init];
    __weak typeof(self) weakSelf = self;
    self.dataController.onLoadComplete = ^(NSError *error)
    {
        [weakSelf.currentChildViewController reloadData];
    };
    
    
    self.viewType = CBShopViewTypeListView;
}

- (void)setViewType:(CBShopViewType)viewType
{
    _viewType = viewType;
    if(_viewType == CBShopViewTypeMapView)
    {
        [self _showShopMapViewController];
    } else
    {
        [self _showShopListViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_showShopListViewController
{
    CBShopListViewController *vc = [[CBShopListViewController alloc] initWithNibName:@"CBShopListViewController" bundle:nil];
    vc.dataController = self.dataController;
    [self _transitionChildViewController:vc];
    [self.btnMap setImage:[UIImage imageNamed:@"map_bt"]];
}

- (void)_showShopMapViewController
{
    CBShopMapViewController *vc = [[CBShopMapViewController alloc] initWithNibName:@"CBShopMapViewController" bundle:nil];
    vc.dataController = self.dataController;
    [self _transitionChildViewController:vc];
    [self.btnMap setImage:[UIImage imageNamed:@"menu_bt"]];
}

- (void) _transitionChildViewController:(UIViewController<CBShopChildViewControllerImpl> *)newVC
{
    if(self.currentChildViewController)
    {
        [self.currentChildViewController willMoveToParentViewController:self];
        [self.currentChildViewController removeFromParentViewController];
        [self.currentChildViewController.view removeFromSuperview];
        self.currentChildViewController = nil;
    }
    
    [self addChildViewController:newVC];
    newVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:newVC.view];
    [newVC didMoveToParentViewController:self];

    
    UIView *childView = newVC.view;
    NSDictionary *views = NSDictionaryOfVariableBindings(childView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[childView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[childView]-|" options:0 metrics:nil views:views]];
    self.currentChildViewController = newVC;
}

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
