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
     given v = 0 expect vo2 = 0
     given v = 225 expect vo2 = 41.67
     given v = -1 expect vo2 = 0
 
 velocityForVO2:
     given VO2 = 0 expect v = 0
     given VO2 = 41.67 expect v = 224.81
     given VO2 = -1 expect v = 0
 
 percentVO2MaxForTime:
     given t = 0 expect pcvo2 = 0
     given t = 45 expect pcvo2 = 0.91
     given t = -1 expect pcvo2 = 0
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
    float vo2 = [RunCalcMaths vo2ForVelocity:225];
    STAssertEqualsWithAccuracy(vo2, 41.67f, 0.01, @"The VO2 was %g but should have been 41.67", vo2);
}

- (void)testVo2ForVelocityReturnsZeroForZeroVelocity
{
    float vo2 = [RunCalcMaths vo2ForVelocity:0];
    STAssertEqualsWithAccuracy(vo2, 0.00f, 0.01, @"The VO2 was %g but should have been 0", vo2);
}

- (void)testVo2ForVelocityReturnsZeroForNegativeVelocity
{
    float vo2 = [RunCalcMaths vo2ForVelocity:-1];
    STAssertEqualsWithAccuracy(vo2, 0.00f, 0.01, @"The VO2 was %g but should have been 0", vo2);
}

- (void)testVelocityForVo2ReturnsCorrectValForPositiveVO2
{
    float velocity = [RunCalcMaths velocityForVO2:41.67];
    STAssertEqualsWithAccuracy(velocity, 224.81f, 0.05, @"the velocity was %g but should have been 224.81", velocity);
}

- (void)testVelocityForVo2ReturnsZeroForZeroVO2
{
    float velocity = [RunCalcMaths velocityForVO2:0];
    STAssertEqualsWithAccuracy(velocity, 0.00f, 0.01, @"the velocity was %g but should have been 0", velocity);
}

- (void)testVelocityForVo2ReturnsZeroForNegativeVO2
{
    float velocity = [RunCalcMaths velocityForVO2:-1];
    STAssertEqualsWithAccuracy(velocity, 0.00f, 0.01, @"the velocity was %g but should have been 0", velocity);
}

- (void)testPercentVO2MaxForTimeReturnsCorrectValForPositiveTime
{
    float time = [RunCalcMaths percentVO2MaxForTime:45];
    STAssertEqualsWithAccuracy(time, 0.91f, 0.01, @"The percentVO2Max was %g but should have been 0.91", time);
}

- (void)testPercentVO2MaxForTimeReturnsZeroValForZeroTime
{
    float time = [RunCalcMaths percentVO2MaxForTime:0];
    STAssertEqualsWithAccuracy(time, 0.00f, 0.01, @"The percentVO2Max was %g but should have been 0", time);
}

- (void)testPercentVO2MaxForTimeReturnsZeroForNegativeTime
{
    float time = [RunCalcMaths percentVO2MaxForTime:-1];
    STAssertEqualsWithAccuracy(time, 0.00f, 0.01, @"The percentVO2Max was %g but should have been 0", time);
}
@end
