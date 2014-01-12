//
//  CEStackWithMinimum.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CEStackWithMinimum.h"

@implementation CEStackWithMinimum

- (void)pushWithData:(id)data
{
    
    CENodeWithMinimum *newNode = [[CENodeWithMinimum alloc] initWithData:(NSNumber *)data];
    
    //set top as the new node's next
    newNode.next = self.top;
    
    //if top is allocated
    if(self.top){
        
        //if the new data is less than the top's min
        if([self.top.minimum compare:(NSNumber *)data] == NSOrderedDescending)
            newNode.minimum = (NSNumber *)data;
        //otherwise set the new minimum to the top's minimum
        else
            newNode.minimum = self.top.minimum;
    }
    //if top is not allocated, set the new data to the minimum
    else
        newNode.minimum = (NSNumber *)data;
    
    //set the new top node
    self.top = newNode;
    
}

- (id)pop
{
    //if top is allocated
    if(self.top){
        
        //set data to return
        id topData = self.top.data;
        
        //set new top
        self.top = self.top.next;
        
        return topData;
        
    }
    
    return nil;
}

- (id)minimum
{
    //if top is allocated
    if(self.top){
        
        //return the top's minimum
        return self.top.minimum;
        
    }
    
    return nil;
}

@end
