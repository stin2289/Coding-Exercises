//
//  CEQueue.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CEQueue.h"

@implementation CEQueue

-(CEQueue *)init
{
    self = [super init];
    
    self.front = nil;
    self.back = nil;
    
    return self;
}

-(void)enqueueWithData:(NSNumber *)data
{
    
    //initial enqueuq
    if(!self.front){
        
        self.back = [[CENode alloc] initWithNodeData:data];
        
        //set front and back to the same node
        self.front = self.back;
        
    }
    else{
        //assign next node for the back
        self.back.next = [[CENode alloc] initWithNodeData:data];
        self.back = self.back.next;
    }
    
}

-(NSNumber *)dequeue
{
    if(self.front){
        
        //assign front data
        id frontData = self.front.data;
        
        //set front to the next node
        self.front = self.front.next;
        
        return frontData;
    }
    
    return nil;
}

@end
