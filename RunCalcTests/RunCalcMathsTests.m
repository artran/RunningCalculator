//
//  RunCalcTests.m
//  RunCalcTests
//
//  Created by Ray Tran on 04/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "RunCalcMathsTests.h"
#import "RunCalcMaths.h"

/*
 vo2ForVelocity:
     given v = 0 expect vo2 = -4.60
     given v = 225 expect vo2 = 41.67
     given v = -1 expect param exception
 
 velocityForVO2:
     given VO2 = 0 expect v = 29.54
     given VO2 = 41.67 expect v = 224.81
     given VO2 = -1 expect param exception
 
 percentVO2MaxForTime:
     given t = 0 expect pcvo2 = 1.29
     given t = 45 expect pcvo2 = 0.91
     given t = -1 expect param exception
 */

@implementation RunCalcMathsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testVo2ForVelocityReturnsCorrectValForPositiveVelocity
{
    float vo2 = [RunCalcMaths vo2ForVelocity:0];
    STAssertEqualsWithAccuracy(vo2, -4.60f, 0.05, @"The VO2 was %g but should have been -4.6", vo2);

    vo2 = [RunCalcMaths vo2ForVelocity:225];
    STAssertEqualsWithAccuracy(vo2, 41.67f, 0.05, @"The VO2 was %g but should have been 41.67", vo2);
}

- (void)testVo2ForVelocityThrowsForNegativeVelocity
{
    // TODO: write test
}

- (void)testVelocityForVo2ReturnsCorrectValForPositiveVO2
{
    float velocity = [RunCalcMaths velocityForVO2:0];
    STAssertEqualsWithAccuracy(velocity, 29.54f, 0.05, @"the velocity was %g but should have been 29.54", velocity);
    
    velocity = [RunCalcMaths velocityForVO2:41.67];
    STAssertEqualsWithAccuracy(velocity, 224.81f, 0.05, @"the velocity was %g but should have been 224.81", velocity);
}

- (void)testPercentVO2MaxForTimeReturnsCorrectValForPositiveTime
{
    float time = [RunCalcMaths percentVO2MaxForTime:0];
    STAssertEqualsWithAccuracy(time, 1.29f, 0.05, @"The percentVO2Max was %g but should have been 1.29", time);
    
    time = [RunCalcMaths percentVO2MaxForTime:45];
    STAssertEqualsWithAccuracy(time, 0.91f, 0.05, @"The percentVO2Max was %g but should have been 0.91", time);
}
@end
