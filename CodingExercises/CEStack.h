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

-(void)pushWithData:(id <NSCopying>)data;
-(id <NSCopying>)pop;


@end
