//
//  CEStack.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CEStack.h"

@implementation CEStack

-(CEStack *)init
{
    self = [super init];
    
    //set top to nil
    self.top = nil;
    
    return self;
}

/*
 copy stack
 create temp stack to preserve order of current stack
 */
- (id)copyWithZone:(NSZone *)zone{
    
    CEStack *newStack = [[CEStack alloc] init];
    CEStack *tempStack = [[CEStack alloc] init];
    
    //temp object for stack transfer
    id <NSCopying> object;
                           
    //copy contents of current stack to temp stack
    do{
        
        object = [self pop];
        [tempStack pushWithData:object];
        
    }while(object);
    
    //copy contents of temp stack to new stack
    //this keeps the ordering the same
    do{
        
        object = [tempStack pop];
        [newStack pushWithData:object];
        
    }while(object);
    
    return newStack;
}

-(void)pushWithData:(id)data
{
    //create new node
    CENode *newNode = [[CENode alloc] initWithNodeData:data];
    
    //set new node's next to top
    newNode.next = self.top;
    
    //set top to new node
    self.top = newNode;
    
}

-(id <NSCopying>)pop{
    
    //if top is created
    if(self.top){
        
        //set the top data
        id topData = self.top.data;
        
        //assign new top
        self.top = self.top.next;
        
        //return top data
        return topData;
        
    }
    
    return nil;
    
}

@end
