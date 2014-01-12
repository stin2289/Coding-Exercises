//
//  CESetOfStacks.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEStack.h"

@interface CESetOfStacks : CEStack

- (instancetype)init;

-(CESetOfStacks *)initWithThreshold:(int)threshold;

@end
