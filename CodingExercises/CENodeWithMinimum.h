//
//  CENode+Minimum.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CENode.h"

@interface CENodeWithMinimum : CENode

@property (nonatomic) CENodeWithMinimum *next;
@property (nonatomic) NSNumber *minimum;

@end
