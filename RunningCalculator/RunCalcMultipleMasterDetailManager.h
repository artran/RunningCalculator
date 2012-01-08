//
//  RunCalcMultipleMasterDetailManager.h
//  RunningCalculator
//
//  Created by Ray Tran on 08/01/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunCalcMultipleMasterDetailManager
           : NSObject<UISplitViewControllerDelegate, UITabBarControllerDelegate>

-(id)initWithSplitViewController:(UISplitViewController*)splitViewController
       withDetailRootControllers:(NSArray*)detailControllers;

@end
