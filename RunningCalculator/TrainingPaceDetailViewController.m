//
//  TrainingPaceDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 10/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "TrainingPaceDetailViewController.h"

@interface TrainingPaceDetailViewController()
@property (weak, nonatomic) IBOutlet UITextField *distanceEditor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitChoice;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenHrsEditor;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenMinsEditor;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenSecsEditor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *paceUnitChoice;

@property (strong, nonatomic) IBOutlet UILabel *easyPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempoPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *vo2PaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *speedPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *longPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *yassoPaceLabel;

@property (nonatomic) float minsTaken;
@property (nonatomic) float metresRaced;
@property (nonatomic) float speed;
@property (nonatomic) float vo2Max;
@property (nonatomic) BOOL metricDistance;
@property (nonatomic) BOOL metricPace;

- (void) setupCalculation;
- (float) vo2ForVelocity:(float)vel;
- (float) velocityForVO2:(float)VO2;
- (float) percentVO2MaxForTime:(float)minutes;
- (void) calculatePaces;
- (NSString *) paceForSpeed:(float)speed;
//- (void) toggleMetric;
@end

@implementation TrainingPaceDetailViewController
@synthesize distanceEditor = _distanceEditor;
@synthesize distanceUnitChoice = _distanceUnitChoice;
@synthesize timeTakenHrsEditor = _timeTakenHrsEditor;
@synthesize timeTakenMinsEditor = _timeTakenMinsEditor;
@synthesize timeTakenSecsEditor = _timeTakenSecsEditor;
@synthesize paceUnitChoice;

@synthesize easyPaceLabel = _easyPaceLabel;
@synthesize tempoPaceLabel = _tempoPaceLabel;
@synthesize vo2PaceLabel = _vo2PaceLabel;
@synthesize speedPaceLabel = _speedPaceLabel;
@synthesize longPaceLabel = _longPaceLabel;
@synthesize yassoPaceLabel = _yassoPaceLabel;

@synthesize minsTaken = _minsTaken;
@synthesize metresRaced = _metresRaced;
@synthesize speed = _speed;
@synthesize vo2Max = _vo2Max;
@synthesize metricDistance = _metricDistance;
@synthesize metricPace = _metricPace;

- (IBAction)calculateButtonPressed:(id)sender {
    [self setupCalculation];
}

- (void)viewDidUnload
{
    [self setDistanceEditor:nil];
    [self setDistanceUnitChoice:nil];
    [self setTimeTakenHrsEditor:nil];
    [self setTimeTakenMinsEditor:nil];
    [self setTimeTakenSecsEditor:nil];
    [self setPaceUnitChoice:nil];
    self.easyPaceLabel = nil;
    self.tempoPaceLabel = nil;
    self.vo2PaceLabel = nil;
    self.longPaceLabel = nil;
    self.yassoPaceLabel = nil;
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

#pragma mark DetailViewController implementation
- (void)setRightNavigationButton:(UIBarButtonItem *)button {
    self.navigationItem.rightBarButtonItem = button;
}

#pragma mark calculator implementation

- (void) setupCalculation {
    self.minsTaken = [self.timeTakenHrsEditor.text floatValue] * 60
    + [self.timeTakenMinsEditor.text floatValue]
    + [self.timeTakenSecsEditor.text floatValue] /60;
    
    self.metresRaced = [self.distanceEditor.text floatValue];
    
    self.metricDistance = (self.distanceUnitChoice.selectedSegmentIndex == 0);
    
    if (self.metricDistance) {
        self.metresRaced *= 1000;
    } else {
        self.metresRaced *= 1609;
    }
    
    self.speed = self.metresRaced / self.minsTaken;
    
    self.vo2Max = [self vo2ForVelocity:self.speed] / [self percentVO2MaxForTime:self.minsTaken];
    
    [self calculatePaces];
}

// Takes a velocity and converts it to a VO2 level.   
-(float) vo2ForVelocity:(float)vel {
    return (-4.60 + 0.182258 * vel + 0.000104 * vel * vel);
}

// Takes a VO2 measurement and converts it to a velocity.
-(float) velocityForVO2:(float)VO2 {
    return (29.54 + 5.000663 * VO2 - 0.007546 * VO2 * VO2);
}

// Takes a time in minutes and uses EQ 2 to convert it to a percent of VO2 maximum.   
-(float) percentVO2MaxForTime:(float)minutes {
    return (0.8 + 0.1894393 * exp(-0.012778 * minutes) + 0.2989558 * exp(-0.1932695 * minutes));
}

-(void) calculatePaces {
    float velEasy = [self velocityForVO2:(self.vo2Max * .7)];
    float velTempo = [self velocityForVO2:(self.vo2Max * .88)];
    float velVo2 = [self velocityForVO2:(self.vo2Max)];
    float velSpeed = [self velocityForVO2:(self.vo2Max * 1.1)];
    float velLong = [self velocityForVO2:(self.vo2Max * .6)];
    float velYasso = velVo2 * 1.95;  
    
    NSString *toAppend;
    self.metricPace = (self.paceUnitChoice.selectedSegmentIndex == 0);
    if (self.metricPace) {
        toAppend = @" min/km";
    } else {
        toAppend = @" min/mile";
    }
    
    self.easyPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velEasy], toAppend];
    self.tempoPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velTempo], toAppend];
    self.vo2PaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velVo2], toAppend];
    self.speedPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velSpeed], toAppend];
    self.longPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velLong], toAppend];

    BOOL oldMetricPace = self.metricPace;
    self.metricPace = NO;
    self.yassoPaceLabel.text = [NSString stringWithFormat:@"%@ min/800", [self paceForSpeed:velYasso]];
    self.metricPace = oldMetricPace;
}

// Respond to the pace choice changing by recalculating paces
//- (void) toggleMetric {
//    self.metricPace = (self.paceUnitChoice.selectedSegmentIndex == 0);
//    [self calculatePaces];
//}


// Takes a speed in metres / minute a converts it to a string representing a pace in
// minutes per mile or km.   
- (NSString *) paceForSpeed:(float)speed {
    float factor = (self.metricPace ? 1000 : 1609);
    speed = 1 / speed * factor;
    
    int minutes = floor(speed);
    int seconds = floor((speed - minutes) * 60);
    
    return [NSString stringWithFormat:@"%i : %@%i", minutes, (seconds > 9 ? @"" : @"0"), seconds];
}
@end
