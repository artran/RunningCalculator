//
//  HeartRateDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 23/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "HeartRateDetailViewController.h"

@interface HeartRateDetailViewController()
@property (weak, nonatomic) IBOutlet UITableView *heartRateTable;
@end

@implementation HeartRateDetailViewController
@synthesize heartRateTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"explainHeartRateRanges" ofType:@"html"] isDirectory:NO];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [segue.destinationViewController setView:webView];
    
    [segue.destinationViewController setTitle:@"Explain Heart Rate Ranges"];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [heartRateTable setDelegate:self];
    [heartRateTable setDataSource:self];
}

- (void)viewDidUnload
{
    [self setHeartRateTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"heartRateCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"heartRateCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < 3) {
        return 3;
    } else {
        return 2;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: {
            return NSLocalizedString(@"Speedwork", @"Speedwork");
        } break;
        case 1: {
            return NSLocalizedString(@"Hard", @"Hard");
        } break;
        case 2: {
            return NSLocalizedString(@"Recovery", @"Recovery");
        } break;
        default: {
            return NSLocalizedString(@"Easy", @"Easy");
        }
    }
}

@end
