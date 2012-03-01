//
//  RunCalcMaths.m
//  RunningCalculator
//
//  Created by Ray Tran on 04/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "RunCalcMaths.h"

@implementation RunCalcMaths

// Takes a velocity im m/min and converts it to a VO2 level.
+ (float) vo2ForVelocity:(float)vel {
    if (vel > 0) {
        return (-4.60 + 0.182258 * vel + 0.000104 * vel * vel);
    } else {
        return 0.0f;
    }
}

// Takes a VO2 measurement and converts it to a velocity in m/min.
+ (float) velocityForVO2:(float)vo2 {
    if (vo2 > 0) {
        return (29.54 + 5.000663 * vo2 - 0.007546 * vo2 * vo2);
    } else {
        return 0.0f;
    }
}

// Takes a time in minutes and converts it to a percent of VO2 maximum.   
+ (float) percentVO2MaxForTime:(float)minutes {
    if (minutes > 0) {
        return (0.8 + 0.1894393 * exp(-0.012778 * minutes) + 0.2989558 * exp(-0.1932695 * minutes));
    } else {
        return 0.0f;
    }
}

@end
