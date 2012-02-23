//
//  HeartRateDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 23/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "HeartRateDetailViewController.h"

@implementation HeartRateDetailViewController

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
