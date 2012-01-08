//
//  RunCalcMasterViewController.h
//  RunningCalculator
//
//  Created by Ray Tran on 08/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RunCalcDetailViewController;

@interface RunCalcMasterViewController : UITableViewController

@property (strong, nonatomic) RunCalcDetailViewController *detailViewController;

@end
