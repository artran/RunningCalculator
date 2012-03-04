//
//  HeartRateModel.m
//  RunningCalculator
//
//  Created by Ray Tran on 04/02/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import "HeartRateModel.h"

@interface HeartRateModel()

@property (nonatomic) unsigned restHr;
@property (nonatomic) unsigned maxHr;

@end

@implementation HeartRateModel

@synthesize restHr = _restHr;
@synthesize maxHr = _maxHr;

- (void) calculateZonesWithRest:(unsigned)restHr age:(unsigned)age {
    unsigned maxHr = 205 - (age/2.0);
    [self calculateZonesWithRest:restHr max:maxHr];
}

- (void) calculateZonesWithRest:(unsigned)restHr max:(unsigned)maxHr {
    self.restHr = restHr;
    self.maxHr = maxHr;
}

- (unsigned) hrForPerCent:(unsigned)pc {
    return (pc/100.0) * (self.maxHr - self.restHr) + self.restHr;
}

@end