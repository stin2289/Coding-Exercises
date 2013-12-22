//
//  CELinkedList.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/3/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CELinkedNode : NSObject

@property (nonatomic) CELinkedNode *next;
@property (nonatomic) NSNumber *data;

-(CELinkedNode *)init;
-(CELinkedNode *)initWithNodeData:(NSNumber *)data;
-(void)appendToTail:(NSNumber *)data;
//returns the current head and sets next
-(CELinkedNode *)deleteNode:(CELinkedNode *)head Data:(NSNumber *)data;

@end
