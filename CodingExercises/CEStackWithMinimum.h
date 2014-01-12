//
//  CEStackWithMinimum.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CENodeWithMinimum.h"

@interface CEStackWithMinimum : NSObject

@property (nonatomic) CENodeWithMinimum *top;

- (void)pushWithData:(id)data;
- (id)pop;

//returns the minimum value in the stack
- (NSNumber *)minimum;

@end
