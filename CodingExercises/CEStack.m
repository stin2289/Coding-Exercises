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
    _top = nil;
    _count = 0;
    
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
    
    newStack.count = self.count;
    
    return newStack;
}

- (void)pushWithData:(id)data
{
    //create new node
    CENode *newNode = [[CENode alloc] initWithNodeData:data];
    
    //set new node's next to top
    newNode.next = self.top;
    
    //set top to new node
    self.top = newNode;
    
    //add one to count
    self.count += 1;
    
}

/*
 return top data and delete from stack
 */
- (id <NSCopying>)pop
{
    
    //if top is created
    if(self.top){
        
        //set the top data
        id topData = self.top.data;
        
        //assign new top
        self.top = self.top.next;
        
        //return top data
        return topData;
        
        //remove one from count
        self.count -= 1;
        
    }
    
    return nil;
    
}

/*
 return top data w/o popping it
 */
- (id <NSCopying>)peek
{
    //if top is created
    if(self.top){
        
        //return data
        return self.top.data;
        
    }
    
    return nil;
}

/*
 print contents of stack
 only prints NSString and NSNumber classes
 */
- (NSString *)returnPrintString
{
    //reserve contents of stack
    CEStack *printStack = [[CEStack alloc] init];
    CENode *tempObject = self.top;
    while(tempObject){
        
        //push value
        [printStack pushWithData:tempObject.data];
        
        //move to next value
        tempObject = tempObject.next;
        
    }
    
    
    CENode *object = printStack.top;
    NSString *printString = @"";
    
    
    do{
        
        NSObject *objectData = (NSObject *)object.data;
        
        if([objectData class] == [NSString class]){
            printString = [printString stringByAppendingString:((NSString *)object.data)];
        }
        else if([objectData isKindOfClass:[NSNumber class]]){
            printString = [printString stringByAppendingString:[((NSNumber *)object.data) stringValue]];
        }
        
        object = object.next;
        
        //append comma if the next object isn't nil
        if(object){
            printString = [printString stringByAppendingString:@","];
        }
        
    }while(object != nil);

    return printString;
    
}



@end
