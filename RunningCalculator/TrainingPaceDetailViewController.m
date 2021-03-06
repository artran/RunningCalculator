//
//  TrainingPaceDetailViewController.m
//  RunningCalculator
//
//  Created by Ray Tran on 10/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "TrainingPaceDetailViewController.h"
#import "RunCalcMaths.h"

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
- (void) calculatePaces;
- (NSString *) paceForSpeed:(float)speed;
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

// Respond to the pace choice changing by recalculating paces
- (IBAction)paceDisplayUnitChanged:(id)sender {
    self.metricPace = (self.paceUnitChoice.selectedSegmentIndex == 0);
    [self calculatePaces];
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"explainPaceCalculator" ofType:@"html"] isDirectory:NO];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [segue.destinationViewController setView:webView];
    
    [segue.destinationViewController setTitle:@"Explain Pace Calculator"];
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
    
    self.vo2Max = [RunCalcMaths vo2ForVelocity:self.speed] / [RunCalcMaths percentVO2MaxForTime:self.minsTaken];
    
    [self calculatePaces];
}

-(void) calculatePaces {
    float velEasy = [RunCalcMaths velocityForVO2:(self.vo2Max * .7)];
    float velTempo = [RunCalcMaths velocityForVO2:(self.vo2Max * .88)];
    float velVo2 = [RunCalcMaths velocityForVO2:(self.vo2Max)];
    float velSpeed = [RunCalcMaths velocityForVO2:(self.vo2Max * 1.1)];
    float velLong = [RunCalcMaths velocityForVO2:(self.vo2Max * .6)];
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
