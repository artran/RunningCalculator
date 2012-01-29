//
//  PredictRaceDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 14/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "PredictRaceDetailViewController.h"

@implementation PredictRaceDetailViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"explainRacePredictor" ofType:@"html"] isDirectory:NO];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [segue.destinationViewController setView:webView];
    
    [segue.destinationViewController setTitle:@"Explain Race Predictor"];
}

@end
