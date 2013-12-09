//
//  CodingExercisesTests.m
//  CodingExercisesTests
//
//  Created by Austin Marusco on 11/9/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CEDataStructures.h"

@interface CEDataStructuresTests : XCTestCase

@property (nonatomic,strong) CEDataStructures *dataStructures;

@end

@implementation CEDataStructuresTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.dataStructures = [[CEDataStructures alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//1.1
- (void)testDataStructures_duplicateCharactersInStrings
{

    //1.1(part 1)
    XCTAssertFalse([self.dataStructures hasUniqueCharactersWithString:@"boon"],@"String has unique characters");
    XCTAssertTrue([self.dataStructures hasUniqueCharactersWithString:@"dope"],@"String doesn't have unique characters");
 
    //1.1(part 2)
    XCTAssertFalse([self.dataStructures hasUniqueCharactersWithStringNoDataStructure:@"boon"],@"String has unique characters");
    XCTAssertTrue([self.dataStructures hasUniqueCharactersWithStringNoDataStructure:@"dope"],@"String doesn't have unique characters");
    
}

//1.2
- (void)testDataStructures_reverseCStyleString
{
    
    XCTAssert([[self.dataStructures reverseString:@"hello"] isEqualToString:@"ollehN"],@"String should be reversed");
    XCTAssert([[self.dataStructures reverseString:@"olleh"] isEqualToString:@"helloN"],@"String should be reversed");
    
    //cStyle strings
    //char* cInputString = "hello";
    //char* cStringOutput = "olleh";
    
    //[self.dataStructures reverseCStyleString:cInputString];
    //XCTAssert(cStringOutput == cStringOutput,@"String should be reversed");
    
}

//1.3
- (void)testDataStructures_removeDuplicateCharacters
{
    
    XCTAssert([[self.dataStructures removeDuplicatesWithInputString:@"helloo"] isEqualToString:@"helo"],@"String should not have duplicate chars");
    XCTAssert([[self.dataStructures removeDuplicatesWithInputString:@"aaabbbccc"] isEqualToString:@"abc"],@"String should not have duplicate chars");
    XCTAssert([[self.dataStructures removeDuplicatesWithInputString:@"h"] isEqualToString:@"h"],@"String should not have duplicate chars");
    
}

//1.4
- (void)testDataStructures_testAreStringsAnagrams
{
    
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"ololeh"] == YES,@"Strings are anagrams");
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"helloo"] == YES,@"Strings are anagrams");
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"oolleh"] == YES,@"Strings are anagrams");
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"ololeho"] == NO,@"Strings are not anagrams");
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"h"] == NO,@"Strings are not anagrams");
    XCTAssert([self.dataStructures keysAreAnagramsWithFirstString:@"helloo" SecondString:@"hleo"] == NO,@"Strings are not anagrams");
    
}

//1.5
- (void)testDataStructures_testReplaceCharacterInString
{
    
    XCTAssert([[self.dataStructures replaceCharactersWithInputString:@"h llo" OriginalString:@" " ReplacementString:@"%20"]
               isEqualToString:@"h%20llo"],@"String replaces correct characters");
    
    XCTAssert([[self.dataStructures replaceCharactersWithInputString:@"h l l o" OriginalString:@" " ReplacementString:@"%20"]
               isEqualToString:@"h%20l%20l%20o"],@"String replaces correct characters");
    
    XCTAssert([[self.dataStructures replaceCharactersWithInputString:@"h       llo" OriginalString:@" " ReplacementString:@"%20"]
               isEqualToString:@"h%20%20%20%20%20%20%20llo"],@"String replaces correct characters");

    
}

@end
