//
//  CELinkedList.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/3/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CELinkedNode.h"

@implementation CELinkedNode

-(CELinkedNode *)init{
    
    self = [super init];
    self.next = nil;
    self.data = nil;
    
    return self;
    
}

-(CELinkedNode *)initWithData:(id)data{
    
    self = [super init];
    self.next = nil;
    self.data = data;
    
    return  self;
}

-(void)appendToTail:(id)data{
    
    CELinkedNode *end = [[CELinkedNode alloc] initWithData:data];
    CELinkedNode *n = self;

    //loop through til you find end, and set as next
    while (n.next != nil) {
        n = n.next;
    }
    
    //sets next to end
    n.next = end;
    
}


//returns the current head and sets next
//only works with NSNumber
-(CELinkedNode *)deleteNode:(CELinkedNode *)head Data:(id)data{
    
    CELinkedNode *n = head;
    
    //if the head is the node that should be deleted, return next node(new head)
    //resetting the head
    if ([((NSNumber *)n.data) intValue] == [((NSNumber *)data) intValue]) {
        //moved head
        return head.next;
    }
    

    //loop through nodes until null
    while (!n.next) {
        
        //if the next data equals passed in data
        if ([((NSNumber *)n.next.data) intValue] == [((NSNumber *)data) intValue]) {
            
            //set next equal to next next
            //basically skipping the current n.next
            n.next = n.next.next;
            
            //return passed in node
            //head didn’t change
            return head;
        }

        //set n equal to next
        n = n.next;
    }
    
    return head;
}

@end
