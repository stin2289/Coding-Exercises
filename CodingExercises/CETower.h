//
//  CETower.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/22/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEStack.h"

@interface CETower : NSObject

@property (nonatomic) CEStack *disks;
@property (nonatomic) int index;

- (CETower *)initWithIndex:(int)index;
- (void)moveDisksWithNumber:(int)number destination:(CETower *)destination buffer:(CETower *)buffer;

- (void)print;


@end
