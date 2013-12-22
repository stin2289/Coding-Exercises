//
//  CESetOfStacks.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CESetOfStacks.h"

#define DEFAULT_THRESHOLD 10

@interface CESetOfStacks ()

@property (nonatomic,readonly) int threshold;
@property (nonatomic) int currentStackSize;
@property (nonatomic) CEStack *currentStack;
@property (nonatomic) CEStack *setOfStacks;

@end

@implementation CESetOfStacks

- (CESetOfStacks *)init
{
    self = [super init];
    
    if(self){
        _threshold = DEFAULT_THRESHOLD;
        _currentStackSize = 0;
        _currentStack = [[CEStack alloc] init];
        _setOfStacks = [[CEStack alloc] init];
    }
    
    return self;
}

- (CESetOfStacks *)initWithThreshold:(int)threshold
{
    self = [super init];
    
    if(self){
        _threshold = threshold;
        _currentStackSize = 0;
        _currentStack = [[CEStack alloc] init];
        _setOfStacks = [[CEStack alloc] init];
    }
    
    return self;
    
}

- (void)pushWithData:(id <NSCopying>)data
{
    
    //if the stack size hasn’t reached the threshold
    if(self.currentStackSize < self.threshold){
        
        //add data to current stack
        [self.currentStack pushWithData:data];
        self.currentStackSize += 1;
        
    }
    else{
        
        //add current stack to set of stacks
        [self.setOfStacks pushWithData:self.currentStack];
        
        //create new current stack
        self.currentStack = [[CEStack alloc] init];
        
        //push data to new stack and reset size variable
        [self.currentStack pushWithData:data];
        self.currentStackSize = 1;
        
    }

}

- (id <NSCopying>)pop
{
    //if the current stack top has a value
    if(self.currentStack.top){
        
        //set new stack size
        self.currentStackSize -= 1;
        
        //pop current stack
        return [self.currentStack pop];
        
        
    }
    //if the current stack doesn't have a top value
    else{
        
        //if the set of stacks has a top value
        if(self.setOfStacks.top){
            //set current stack to top of set of stacks
            self.currentStack = (CEStack *)[self.setOfStacks pop];
            self.currentStackSize = self.threshold - 1;
            
            //return the top of the current stack
            return [self.currentStack pop];
        }
        
        //return nil if there's no current stack or top of setOfStacks
        return nil;
        
    }
    
    return nil;
    
}


@end
