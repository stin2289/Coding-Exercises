//
//  CETowersOfHanoi.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/22/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CEStack.h"

@interface CETowersOfHanoi : NSObject

/*
 init towers with number of disks
 */
- (CETowersOfHanoi *)initWithNumberOfDisks:(int)disks;

/*
 outputs right peg stack
 */
- (CEStack *)run;

@end
