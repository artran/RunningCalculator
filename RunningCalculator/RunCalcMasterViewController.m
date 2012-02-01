//
//  RunCalcMasterViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 08/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "RunCalcMasterViewController.h"

@interface RunCalcMasterViewController()
@property (nonatomic, weak) UIViewController *currentDetailViewController;
@end

@implementation RunCalcMasterViewController

@synthesize currentDetailViewController = _currentDetailViewController;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    UINavigationController *detailNavigationController = [self.splitViewController.viewControllers lastObject];
    self.currentDetailViewController = detailNavigationController.topViewController;
    self.splitViewController.delegate = self;
    detailNavigationController.delegate = self;
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create and configure a new detail view controller appropriate for the selection.
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *identifier = selectedCell.textLabel.text;
    if (identifier) {
        if (![identifier isEqualToString:self.currentDetailViewController.title]) {
            UIViewController* newDetail = [self.splitViewController.storyboard instantiateViewControllerWithIdentifier:identifier];
            NSArray *newDetailArr = [NSArray arrayWithObject:newDetail];
            
            [self.currentDetailViewController.navigationController setViewControllers:newDetailArr animated:YES];
            // delegate will be told of the change so it can handle nav buttons, etc.
        }

    }
}

#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = self.title;
    self.currentDetailViewController.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)button
{
    self.currentDetailViewController.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.navigationItem.rightBarButtonItem = self.currentDetailViewController.navigationItem.rightBarButtonItem;
    self.currentDetailViewController = viewController;
}
@end
