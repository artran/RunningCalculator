//
//  RunCalcMasterViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 08/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "RunCalcMasterViewController.h"

@interface RunCalcMasterViewController()
@property (nonatomic, weak) UINavigationController *detailNavigationController;
@property (nonatomic, weak) UIViewController *detailViewController;
@end

@implementation RunCalcMasterViewController

@synthesize detailNavigationController = _detailNavigationController;
@synthesize detailViewController = _detailViewController;

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
    self.detailNavigationController = [self.splitViewController.viewControllers lastObject];
    self.detailViewController = self.detailNavigationController.topViewController;
    self.splitViewController.delegate = self;
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create and configure a new detail view controller appropriate for the selection.
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *identifier = selectedCell.textLabel.text;
    if (identifier) {
        if (![identifier isEqualToString:self.detailViewController.title]) {
            NSArray *rightBarButtonItems = [self.detailViewController.navigationItem.rightBarButtonItems copy];
            
            UIViewController* newDetail = [self.splitViewController.storyboard instantiateViewControllerWithIdentifier:identifier];
            newDetail.navigationItem.rightBarButtonItems = rightBarButtonItems;
            NSArray *newDetailArr = [[NSArray alloc] initWithObjects:newDetail, nil];
            self.detailViewController = newDetail;
            [self.detailNavigationController setViewControllers:newDetailArr animated:YES];
        }

    }
}

#pragma mark UISplitViewControllerDelegate implementation
- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = self.title;
    self.detailViewController.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)button
{
    self.detailViewController.navigationItem.rightBarButtonItem = nil;
}
@end
