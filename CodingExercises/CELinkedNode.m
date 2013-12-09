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
    self.next = NULL;
    self.data = NULL;
    
    return self;
    
}

-(CELinkedNode *)initWithNodeData:(NSNumber *)data{
    
    self = [super init];
    self.next = NULL;
    self.data = data;
    
    return  self;
}

-(void)appendToTail:(NSNumber *)data{
    
    CELinkedNode *end = [[CELinkedNode alloc] initWithNodeData:data];
    CELinkedNode *n = self;

    //loop through til you find end, and set as next
    while (n.next != NULL) {
        n = n.next;
    }
    
    //sets next to end
    n.next = end;
    
}


//returns the current head and sets next
-(CELinkedNode *)deleteNode:(CELinkedNode *)head Data:(NSNumber *)data{
    
    CELinkedNode *n = head;
    
    //if the head is the node that should be deleted, return next node(new head)
    //resetting the head
    if ([n.data intValue] == [data intValue]) {
        //moved head
        return head.next;
    }
    

    //loop through nodes until null
    while (n.next != NULL) {
        
        //if the next data equals passed in data
        if ([n.next.data intValue] == [data intValue]) {
            
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
