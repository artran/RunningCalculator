//
//  TrainingPaceDetailViewController.h
//  RunningCalculator
//
//  Created by Ray Tran on 10/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainingPaceDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *distanceEditor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitChoice;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenHrs;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenMins;
@property (weak, nonatomic) IBOutlet UITextField *timeTakenSecs;
@property (weak, nonatomic) IBOutlet UISegmentedControl *paceUnitChoice;

@property (strong, nonatomic) IBOutlet UILabel *easyPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempoPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *vo2PaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *speedPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *longPaceLabel;
@property (strong, nonatomic) IBOutlet UILabel *yassoPaceLabel;

@end
