//
//  RunCalcMaths.h
//  RunningCalculator
//
//  Created by Ray Tran on 04/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunCalcMaths : NSObject
+ (float) vo2ForVelocity:(float)vel;
+ (float) velocityForVO2:(float)vo2;
+ (float) percentVO2MaxForTime:(float)minutes;
@end
