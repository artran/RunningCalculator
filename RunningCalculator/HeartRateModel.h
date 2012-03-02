//
//  HeartRateModel.h
//  RunningCalculator
//
//  Created by Ray Tran on 1/03/2012.
//  Copyright (c) 2012 Artran Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeartRateModel : NSObject

- (void) calculateZonesWithRest:(unsigned)restHr age:(unsigned)age;
- (void) calculateZonesWithRest:(unsigned)restHr max:(unsigned)maxHr;
- (unsigned) hrForPerCent:(unsigned)pc;

@end