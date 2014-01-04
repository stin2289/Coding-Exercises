//
//  CEStack.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CENode.h"

@interface CEStack : NSObject <NSCopying>

@property (nonatomic) CENode *top;
@property (nonatomic) int count;

-(void)pushWithData:(id <NSCopying>)data;

/*
 return top data and delete from stack
 */
- (id <NSCopying>)pop;

/*
 return top data w/o popping it
 */
- (id <NSCopying>)peek;

/*
 print contents of stack
 only prints NSString and NSNumber classes
 */
- (NSString *)returnPrintString;


@end
