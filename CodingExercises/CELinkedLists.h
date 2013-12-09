//
//  CELinkedLists.h
//  CodingExercises
//
//  Created by Austin Marusco on 12/3/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CELinkedNode.h"

@interface CELinkedLists : NSObject


//2.1a Write code to remove duplicates from an unsorted linked list.
-(CELinkedNode *)removeDuplicatesFromLinkedListWithHead:(CELinkedNode *)head;

//-2.1b How would you solve this problem if a temporary buffer is not allowed?
-(CELinkedNode *)removeDuplicatesFromLinkedListNoDataBufferWithHead:(CELinkedNode *)head;

//2.2 Implement an algorithm to find the nth to last element of a singly linked list
-(CELinkedNode *)returnNthToLastElementWithIndex:(int)index Head:(CELinkedNode *)head;

//2.3
-(void)removeNodeWithHead:(CELinkedNode *)head;

//2.4
- (CELinkedNode *)addTwoNumbersWithFirstNode:(CELinkedNode *)firstNode
                                  SecondNode:(CELinkedNode *)secondNode;

-(int)convertNodeToNumberWithHead:(CELinkedNode *)head;
-(CELinkedNode *)convertNumberToNodeWithNumber:(NSNumber *)number;

//2.5
//- Given a circular linked list, implement an algorithm which returns node at the beginning of //the loop
-(CELinkedNode *)returnDuplicateNodeWithHead:(CELinkedNode *)head;

@end