//
//  CELinkedList.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/3/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CELinkedNode.h"
#import "CELinkedLists.h"

@interface CELinkedListsTests : XCTestCase

@property (nonatomic,strong) CELinkedLists *linkedLists;
@property (nonatomic,strong) CELinkedNode *head1;
@property (nonatomic,strong) CELinkedNode *head2;

@end

@implementation CELinkedListsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    //head 1
    self.head1 = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:0]];
    [self.head1 appendToTail:[NSNumber numberWithInt:1]];
    [self.head1 appendToTail:[NSNumber numberWithInt:2]];
    [self.head1 appendToTail:[NSNumber numberWithInt:3]];
    [self.head1 appendToTail:[NSNumber numberWithInt:4]];
    [self.head1 appendToTail:[NSNumber numberWithInt:5]];
    [self.head1 appendToTail:[NSNumber numberWithInt:6]];
    
    
    //head 2
    self.head2 = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:0]];
    [self.head2 appendToTail:[NSNumber numberWithInt:1]];
    [self.head2 appendToTail:[NSNumber numberWithInt:2]];
    [self.head2 appendToTail:[NSNumber numberWithInt:3]];
    [self.head2 appendToTail:[NSNumber numberWithInt:4]];
    [self.head2 appendToTail:[NSNumber numberWithInt:4]];
    [self.head2 appendToTail:[NSNumber numberWithInt:5]];
    [self.head2 appendToTail:[NSNumber numberWithInt:4]];
    
    //linkedList object
    self.linkedLists = [[CELinkedLists alloc] init];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//2.1a
- (void)testLinkedLists_testDuplicateDataValues
{
    
    //test duplicate tester
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head1],@"linked list shouldn't have duplicates");
    XCTAssertTrue([self duplicatesInLinkedListWithHead:self.head2],@"linked list should have duplicate");
    
    
    //remove duplicates
    self.head1 = [self.linkedLists removeDuplicatesFromLinkedListWithHead:self.head1];
    self.head2 = [self.linkedLists removeDuplicatesFromLinkedListWithHead:self.head2];
    
    //test duplicate remover
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head1],@"linked list shouldn't have duplicates");
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head2],@"linked list shouldn't have duplicate");
    
}


//2.1b
- (void)testLinkedLists_testDuplicateDataValuesNoBuffer
{
    //test duplicate tester
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head1],@"linked list shouldn't have duplicates");
    XCTAssertTrue([self duplicatesInLinkedListWithHead:self.head2],@"linked list should have duplicate");
    

    //remove duplicates
    self.head1 = [self.linkedLists removeDuplicatesFromLinkedListNoDataBufferWithHead:self.head1];
    self.head2 = [self.linkedLists removeDuplicatesFromLinkedListNoDataBufferWithHead:self.head2];
    
    //test duplicate remover
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head1],@"linked list shouldn't have duplicates");
    XCTAssertFalse([self duplicatesInLinkedListWithHead:self.head2],@"linked list shouldn't have duplicate");
    
}

//2.2
- (void)testLinkedLists_testReturnNthToLastElement
{
    XCTAssertTrue(self.head1 == [self.linkedLists returnNthToLastElementWithIndex:6 Head:self.head1],@"should return the correct node");
    XCTAssertTrue([self returnNodeAtIndex:6 Head:self.head1] == [self.linkedLists returnNthToLastElementWithIndex:0 Head:self.head1],@"should return the correct node");
    XCTAssertTrue([self returnNodeAtIndex:5 Head:self.head1] == [self.linkedLists returnNthToLastElementWithIndex:1 Head:self.head1],@"should return the correct node");
    XCTAssertTrue([self returnNodeAtIndex:4 Head:self.head1] == [self.linkedLists returnNthToLastElementWithIndex:2 Head:self.head1],@"should return the correct node");
    XCTAssertTrue([self returnNodeAtIndex:3 Head:self.head1] == [self.linkedLists returnNthToLastElementWithIndex:3 Head:self.head1],@"should return the correct node");
    XCTAssertTrue([self returnNodeAtIndex:2 Head:self.head1] == [self.linkedLists returnNthToLastElementWithIndex:4 Head:self.head1],@"should return the correct node");
}

//2.3
- (void)testLinkedLists_testRemoveNode
{
    CELinkedNode *n1 = [self returnNodeAtIndex:3 Head:self.head1];
    NSNumber *n1Data = n1.data;
    [self.linkedLists removeNodeWithHead:n1];
    
    CELinkedNode *n2 = [self returnNodeAtIndex:3 Head:self.head1];
    
    XCTAssertFalse([n2.data intValue] == [n1Data intValue],@"should remove node");

}

//2.4
- (void)testLinkedLists_testAddingNumberNodes
{
    //head 1
    CELinkedNode *firstNumber = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:2]];
    [firstNumber appendToTail:[NSNumber numberWithInt:2]];
    [firstNumber appendToTail:[NSNumber numberWithInt:2]];
    
    CELinkedNode *secondNumber = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:3]];
    [secondNumber appendToTail:[NSNumber numberWithInt:3]];
    [secondNumber appendToTail:[NSNumber numberWithInt:3]];
    
    CELinkedNode *thirdNumber = [[CELinkedNode alloc] initWithNodeData:[NSNumber numberWithInt:3]];
    [thirdNumber appendToTail:[NSNumber numberWithInt:3]];
    [thirdNumber appendToTail:[NSNumber numberWithInt:4]];
    
    //test convert node to number
    XCTAssertTrue([self.linkedLists convertNodeToNumberWithHead:firstNumber] == 222,@"should equal number passed in");
    XCTAssertTrue([self.linkedLists convertNodeToNumberWithHead:secondNumber] == 333,@"should equal number passed in");
    
    //test equal node values
    XCTAssertTrue([self nodeValuesAreEqualWithFirstNode:firstNumber SecondNode:firstNumber],@"all nodes should equal");
    XCTAssertFalse([self nodeValuesAreEqualWithFirstNode:firstNumber SecondNode:thirdNumber],@"all nodes should not equal");
    
    //test convert node to number
    XCTAssertTrue([self nodeValuesAreEqualWithFirstNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:333]]
                                             SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:333]]],@"should equal number passed in");
    XCTAssertFalse([self nodeValuesAreEqualWithFirstNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:333]]
                                             SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:433]]],@"should equal number passed in");
    
    //create total node
    CELinkedNode *totalNode = [self.linkedLists addTwoNumbersWithFirstNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:333]]
                                                    SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:444]]];
    
    XCTAssertTrue([self nodeValuesAreEqualWithFirstNode:totalNode SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:777]]],@"numbers added should equal");
    
    //create total node2
    CELinkedNode *totalNode2 = [self.linkedLists addTwoNumbersWithFirstNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:11111]]
                                                                SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:22222]]];
    
    XCTAssertTrue([self nodeValuesAreEqualWithFirstNode:totalNode2 SecondNode:[self.linkedLists convertNumberToNodeWithNumber:[NSNumber numberWithInt:33333]]],@"numbers added should equal");
}


-(BOOL)duplicatesInLinkedListWithHead:(CELinkedNode *)head
{
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    CELinkedNode *n = head;
    
    while(n.next != NULL) {
        
        //if the value is in the dictionary, return YES
        if([data objectForKey:[n.data stringValue]])
            return YES;
        else
            [data setValue:[NSNumber numberWithBool:YES] forKey:[n.data stringValue]];
        
        //interate to next node
        n = n.next;
        
    }
    
    return NO;
    
}

- (CELinkedNode *)returnNodeAtIndex:(int)index Head:(CELinkedNode *)head
{
    
    //if the head is the last node, return head
    if(head.next == NULL)
        return head;
    
    CELinkedNode *n = head;
    int i = 0;
    
    //if the next element is NULL or reaches the correct index
    while(n.next!= NULL && index != i){
        n = n.next;
        i++;
    }

    return n;
    
}

- (BOOL)nodeValuesAreEqualWithFirstNode:(CELinkedNode *)firstNode SecondNode:(CELinkedNode *)secondNode
{
    CELinkedNode *n1 = firstNode;
    CELinkedNode *n2 = secondNode;
    
    //initial comparison
    if([n1.data intValue] != [n2.data intValue])
        return NO;
    
    //next comparisons
    while(n1.next != NULL && n2.next != NULL){
        
        n1 = n1.next;
        n2 = n2.next;
        
        if([n1.data intValue] != [n2.data intValue])
            return NO;

    }
    
    //if one next equal NULL and the other doesn't, return NO
    if(n1.next != NULL && n2.next == NULL)
        return NO;
    else if(n1.next == NULL && n2.next != NULL)
        return NO;
    
    return YES;
    
}

@end
