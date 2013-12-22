//
//  CEDataStructures.h
//  CodingExercises
//
//  Created by Austin Marusco on 11/10/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEDataStructures : NSObject

//1.1(part 1)
+ (BOOL)hasUniqueCharactersWithString:(NSString *)inputString;

//1.1(part 2)
+ (BOOL)hasUniqueCharactersWithStringNoDataStructure:(NSString *)inputString;

//1.2
+ (NSString *)reverseString:(NSString *)inputString;
+ (void)reverseCStyleString:(char*)str;

//1.3
+ (NSString *)removeDuplicatesWithInputString:(NSString *)inputString;

//1.4
+ (BOOL)keysAreAnagramsWithFirstString:(NSString *)firstString SecondString:(NSString *)secondString;

//1.5
+ (NSString *)replaceCharactersWithInputString:(NSString *)inputString
                                OriginalString:(NSString *)originalString ReplacementString:(NSString *)replacementString;


@end
