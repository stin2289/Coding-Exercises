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
@property (nonatomic) id data;

-(instancetype)init;
-(instancetype)initWithData:(id)data;
-(void)appendToTail:(id)data;

//returns the current head and sets next
//only works with NSNumber
-(instancetype)deleteNode:(CELinkedNode *)head Data:(id)data;


@end
