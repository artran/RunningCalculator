//
//  TrainingPaceDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 10/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "TrainingPaceDetailViewController.h"

@implementation TrainingPaceDetailViewController
@synthesize distanceEditor;
@synthesize distanceUnitChoice;
@synthesize timeTakenHrs;
@synthesize timeTakenMins;
@synthesize timeTakenSecs;
@synthesize paceUnitChoice;

@synthesize easyPaceLabel;
@synthesize tempoPaceLabel;
@synthesize vo2PaceLabel;
@synthesize speedPaceLabel;
@synthesize longPaceLabel;
@synthesize yassoPaceLabel;

- (IBAction)calculateButtonPressed:(id)sender {
    self.easyPaceLabel.text = [self.paceUnitChoice titleForSegmentAtIndex:self.paceUnitChoice.selectedSegmentIndex];
}

- (IBAction)explainButtonPressed:(id)sender {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self setDistanceEditor:nil];
    [self setDistanceUnitChoice:nil];
    [self setTimeTakenHrs:nil];
    [self setTimeTakenMins:nil];
    [self setTimeTakenSecs:nil];
    [self setPaceUnitChoice:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)distanceEditor:(id)sender {
}
@end
