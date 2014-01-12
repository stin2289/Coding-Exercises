//
//  CEQueue.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CENode.h"

@interface CEQueue : NSObject

@property (nonatomic) CENode *front;
@property (nonatomic) CENode *back;

-(instancetype)init;

-(void)enqueueWithData:(id)data;
-(id)dequeue;

@end
