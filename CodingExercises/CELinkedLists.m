//
//  CELinkedLists.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/3/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CELinkedLists.h"
#import "math.h"

@implementation CELinkedLists

//2.1a Write code to remove duplicates from an unsorted linked list.
+ (CELinkedNode *)removeDuplicatesFromLinkedListWithHead:(CELinkedNode *)head
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    CELinkedNode *n = head;
    CELinkedNode *prev = NULL;
    
    //loop through linked list until the end
    while(n.next != NULL){
        
        //if the data value exists, remove
        if([data objectForKey:[n.data stringValue]]){
            //set previous node's next to the new head
            prev.next = [n deleteNode:n Data:n.data];
        }
        else{
            //sets the value of the dictionary and progresses to next item
            [data setObject:[NSNumber numberWithBool:YES] forKey:[n.data stringValue]];
            //set previous
            prev = n;
        }

        n = n.next;
            
    }
            
    return head;

}


//-2.1b How would you solve this problem if a temporary buffer is not allowed?
+ (CELinkedNode *)removeDuplicatesFromLinkedListNoDataBufferWithHead:(CELinkedNode *)head
{
    CELinkedNode *n = head;
    
    while(n.next != NULL){
        
        CELinkedNode *n2 = n.next;
        CELinkedNode *prev2 = n;
        
        //loop through all nodes
        while(n2.next != NULL){
            
            if([n2.data intValue] == [n.data intValue])
                prev2.next = n2.next;
            
            prev2 = n2;
            n2 = n2.next;
            
        }
        
        n = n.next;
        
    }
    
    return head;
}


//2.2 Implement an algorithm to find the nth to last element of a singly linked list
//nth to last element, index should be treated as number of hops
+ (CELinkedNode *)returnNthToLastElementWithIndex:(int)index Head:(CELinkedNode *)head
{
    NSMutableArray *linkedListArray = [[NSMutableArray alloc] init];
    
    //if the head is the last node, return head
    if(head.next == NULL)
        return head;
    
    CELinkedNode *n = head;
    [linkedListArray addObject:n];
    
    //find the last element of the linked list
    while(n.next!= NULL){
        n = n.next;
        [linkedListArray addObject:n];
    }
    
    //if the index is greater than the array size, return head
    if([linkedListArray count] - 1 < index)
        return head;
    
    //return object at index:count-index
    return [linkedListArray objectAtIndex:[linkedListArray count] - 1 - index];
    
}


//2.3
//- Implement an algorithm to delete a node in the middle of a single linked list, given only access to that node
//EXAMPLE
//Input: the node ‘c’ from the linked list a->b->c->d->e
//Result: nothing is returned, but the new linked list looks like a->b->d->e
+ (void)removeNodeWithHead:(CELinkedNode *)head
{
    //if next is NULL return
    if(head.next == NULL){
        head = NULL;
        return;
    }
    
    CELinkedNode *n = head.next;
    CELinkedNode *n2 = n.next;
    
    //set current data equal to next data
    head.data = n.data;
    
    //set head’s next node to next next
    //skip the ‘next’ node
    head.next = n2;
    
}


//2.4
//You have two numbers represented by a linked list, where each node contains a single digit.
//The digits are stored in reverse order, such that the 1’s digit is at the head of the list
//Write a function that adds the two numbers and returns the sum as a linked list
//- EXAMPLE
////513 + 295 = 808
//Input: (3 -> 1 -> 5) + (5 -> 9 -> 2)
//Output: 8 -> 0 -> 8
+ (CELinkedNode *)addTwoNumbersWithFirstNode:(CELinkedNode *)firstNode
                                  SecondNode:(CELinkedNode *)secondNode
{
    //add numbers
    int firstNumber  = [self convertNodeToNumberWithHead:firstNode];
    int secondNumber = [self convertNodeToNumberWithHead:secondNode];
    int total = firstNumber + secondNumber;
    
    //return converted node
    return [self convertNumberToNodeWithNumber:[NSNumber numberWithInt:total]];
}

+ (int)convertNodeToNumberWithHead:(CELinkedNode *)head
{
    
    CELinkedNode *n = head;
    
    int total = [n.data intValue];
    int i = 1;
    
    //loop through all nodes
    while(n.next != NULL){
        n = n.next;
        total += [n.data intValue] * pow(10,i);
        i++;
    }
    
    return total;
    
}

+ (CELinkedNode *)convertNumberToNodeWithNumber:(NSNumber *)number
{
    int total = [number intValue];
    
    //327
    //327 / 1 = 327
    //327 / 10 = 32
    //327 / 100 = 3
    //modulus, returns remainder
    //327 % 1 = 0
    //327 % 10 = 7
    //327 % 100 = 27
    
    //initial digit, create head
    //create initial digit
    int digit = total % 10;
    
    //create head
    CELinkedNode *head = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:digit]];
    
    //subtract digit value from total
    total -= digit;
    
    int i = 2;
    
    //if total is greater than 0
    while(total > 0){
        
        //create digit at current index
        int remainder = total % (int)pow(10,i);
        digit = remainder / pow(10,i-1);
        
        //add digit to tail
        [head appendToTail:[NSNumber numberWithInt:digit]];
        
        //subtract digit real value total from total
        total -= digit * pow(10,i-1);
        
        i++;
    }
    
    return head;
}


//2.5
//- Given a circular linked list, implement an algorithm which returns node at the beginning of //the loop
//DEFINITION
//Circular linked list: A (corrupt) linked list in which a node’s next pointer points to an //earlier node, so as to make a loop in the linked list
//EXAMPLE
//input: A -> B -> C -> D -> E -> C [the same C as earlier]
//output: C
+ (CELinkedNode *)returnDuplicateNodeWithHead:(CELinkedNode *)head
{
    //create dictionary of ids
   // NSMutableDictionary *nodeIds = [[NSMutableDictionary alloc] init];
    NSMutableSet *nodeIds = [[NSMutableSet alloc] init];
    
    [nodeIds addObject:@(head.hash)];
    
    CELinkedNode *n = head;
    
    while(n.next != NULL){
        
        n = n.next;
        
        //make id a string so that it can be compared and used in a dictionary
        //check to see if id is in dictionary
        if([nodeIds containsObject:@(n.hash)]){
            return n;
        }
        
        [nodeIds addObject:@(n.hash)];
        
    }
    
    return NULL;
    
}



@end
