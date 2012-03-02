//
//  HeartRateTests.m
//  HeartRateTests
//
//  Created by Ray Tran on 01/03/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "HeartRateTests.h"
#import "HeartRateModel.h"

@implementation HeartRateTests

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

- (void)testOneHundredPerCentIsMaxHr
{
    unsigned hrRest = 50;
    unsigned hrMax = 185;
    HeartRateModel *hrm = [[HeartRateModel alloc] init];
    [hrm calculateZonesWithRest:hrRest max:hrMax];

    unsigned hr100 = [hrm hrForPerCent:100];
    STAssertEquals(hr100, hrMax, @"The result hr should have been %u but was %u", hrMax, hr100);
}

- (void)testZeroPercentIsRestHr
{
    unsigned hrRest = 50;
    unsigned hrMax = 185;
    HeartRateModel *hrm = [[HeartRateModel alloc] init];
    [hrm calculateZonesWithRest:hrRest max:hrMax];

    unsigned hr0 = [hrm hrForPerCent:0];
    STAssertEquals(hr0, hrRest, @"The result hr should have been %i but was %i", hrRest, hr0);
}

- (void)testFiftyPerCentIsCorrect
{
    unsigned hrRest = 50;
    unsigned hrMax = 185;
    HeartRateModel *hrm = [[HeartRateModel alloc] init];
    [hrm calculateZonesWithRest:hrRest max:hrMax];

    unsigned hrTest = 0.50 * (hrMax - hrRest) + hrRest;

    unsigned hr50 = [hrm hrForPerCent:50];
    STAssertEquals(hr50, hrTest, @"The result hr should have been %i but was %i", hrTest, hr50);
}

- (void)testMaxHrWithZeroAgeIs205
{
    unsigned hrRest = 50;
    unsigned age = 0;
    HeartRateModel *hrm = [[HeartRateModel alloc] init];
    [hrm calculateZonesWithRest:hrRest age:age];

    unsigned hr100 = [hrm hrForPerCent:100];
    STAssertEquals(hr100, 205, @"The result hr should have been 205 but was %i", hr100);
}

- (void)testMaxHrWithFiftyAgeIsCorrect
{
    unsigned hrRest = 50;
    unsigned age = 50;
    HeartRateModel *hrm = [[HeartRateModel alloc] init];
    [hrm calculateZonesWithRest:hrRest age:age];

    unsigned hrTest = 205 - (age/2);

    unsigned hr100 = [hrm hrForPerCent:100];
    STAssertEquals(hr100, hrTest, @"The result hr should have been hrTest but was %i", hr100);
}

@end