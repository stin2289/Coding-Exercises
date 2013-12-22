//
//  CENode.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CENode : NSObject

@property (nonatomic) CENode *next;
@property (nonatomic) NSNumber *data;

-(CENode *)init;
-(CENode *)initWithNodeData:(NSNumber *)data;

@end
