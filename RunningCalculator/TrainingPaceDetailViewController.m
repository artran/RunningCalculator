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
	return YES;
}

- (IBAction)distanceEditor:(id)sender {
}
@end
