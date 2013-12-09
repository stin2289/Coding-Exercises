//
//  CEDataStructures.m
//  CodingExercises
//
//  Created by Austin Marusco on 11/10/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CEDataStructures.h"

@implementation CEDataStructures

#pragma mark - arrays/strings/hash

-(BOOL)hasUniqueCharactersWithString:(NSString *)inputString
{
    
    NSMutableDictionary *characters = [[NSMutableDictionary alloc] init];
    
    for(int i = 0; i < [inputString length]; i++){
        
        NSString *characterString = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([characters objectForKey:characterString])
            return NO;
        else
            [characters setObject:[NSNumber numberWithInt:0] forKey:characterString];
        
        
    }
    
    return YES;
    
}


- (BOOL)hasUniqueCharactersWithStringNoDataStructure:(NSString *)inputString
{
    
    for(int i = 0; i < [inputString length]; i++){
        
        NSString *character = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([self containsMultiplesOfCharacter:character InputString:inputString])
            return NO;
        
        
    }
    
    return YES;
    
}

- (BOOL)containsMultiplesOfCharacter:(NSString *)character InputString:(NSString *)inputString
{
    int characterCount = 0;
    
    for(int i = 0; i < [inputString length]; i++){
        
        NSString *characterAtIndex = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([character isEqualToString:characterAtIndex]){
            
            characterCount++;
            
            if(characterCount == 2)
                return YES;
            
        }
        
    }
    
    return NO;
    
}

//1.2
- (NSString *)reverseString:(NSString *)inputString
{
    
    NSString *outputString = @"";
    
    for(int i = [inputString length] - 1; i >= 0; i--){
        
        NSString *currentChar = [inputString substringWithRange:NSMakeRange(i,1)];
        outputString = [outputString stringByAppendingString:currentChar];
        
    }
    
    outputString = [outputString stringByAppendingString:@"N"];
    
    return outputString;
    
}

- (void)reverseCStyleString:(char*)str
{
    //str always equals the first character
    //*end is assigned to the first character
    char *end = str;
    char temp;
    
    //if str is assigned, continue
    if(str){
        //take ‘end’ for first character and move to back of string
        while(*end){
            ++end;
        }
        
        //move the ‘end’ before the null character
        --end;
        
        //if the first character is before the end
        //stops when the first character is equal to the end
        while(str < end){
            
            //set temp equal to the first character
            temp = *str;
            
            char *nextStr = str++;
            *nextStr = *end;
            
            char *prevEnd = end--;
            *prevEnd = temp;
            
        }
    }
}


//1.3
//Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer
//NOTE: One or two additional variables are fine An extra copy of the array is not
- (NSString *)removeDuplicatesWithInputString:(NSString *)inputString
{
    if([inputString length] < 2)
        return inputString;
    
    
    for(int i = 0; i < [inputString length]; i++){
        
        
        NSString *currentChar = [inputString substringWithRange:NSMakeRange(i,1)];
        
        //if the input string already has this character
        if([self containsCharacterWithInputString:[inputString substringWithRange:NSMakeRange(0,i)] ComparisonCharacter:currentChar]){
            
            //cut out current character
            inputString = [[inputString substringWithRange:NSMakeRange(0,i - 1)]
                           stringByAppendingString:[inputString substringWithRange:NSMakeRange(i,[inputString length] - i)]];
            
            i = i - 1;
            
        }
        
    }
    
    
    return inputString;
}


- (BOOL)containsCharacterWithInputString:(NSString *)inputString ComparisonCharacter:(NSString *)comparisonCharacter
{
    
    
    for(int i = 0; i < [inputString length]; i++){
        
        
        NSString *currentChar = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([currentChar isEqualToString:comparisonCharacter])
            return YES;
        
        
    }
    
    
    return NO;
}


//1.4
//Write a method to decide if two strings are anagrams or not
- (BOOL)keysAreAnagramsWithFirstString:(NSString *)firstString SecondString:(NSString *)secondString
{
    
    NSMutableDictionary *firstDictionary = [self calculateDictionaryStringWithInputString:firstString];
    
    NSMutableDictionary *secondDictionary = [self calculateDictionaryStringWithInputString:secondString];
    
    return [self dictionariesHaveEqualKeysAndValuesWithFirstDictionary:firstDictionary  SecondDictionary:secondDictionary];
    
}

- (BOOL)dictionariesHaveEqualKeysAndValuesWithFirstDictionary:(NSMutableDictionary *)firstDictionary SecondDictionary:(NSMutableDictionary *)secondDictionary
{
    if([[firstDictionary allKeys] count] != [[secondDictionary allKeys] count])
        return NO;
    
    for(NSString *keyObject in [firstDictionary allKeys]){
        
        if(![secondDictionary objectForKey:keyObject])
            return NO;
        
        if([firstDictionary objectForKey:keyObject] != [secondDictionary objectForKey:keyObject])
            return NO;
        
    }
    
    return YES;
    
}

- (NSMutableDictionary *)calculateDictionaryStringWithInputString:(NSString *)inputString
{
    
    NSMutableDictionary *stringsDictionary = [[NSMutableDictionary alloc] init];
    
    for(int i = 0; i < [inputString length]; i++){
        
        NSString *currentChar = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([stringsDictionary objectForKey:currentChar]){
            
            NSNumber *currentNumber = [stringsDictionary objectForKey:currentChar];
            [stringsDictionary setValue:[NSNumber numberWithInt:[currentNumber intValue] + 1] forKey:currentChar];
            
        }
        else
            
            
            [stringsDictionary setValue:[NSNumber numberWithInt:1] forKey:currentChar];
        
    }
    
    return stringsDictionary;
    
}


//1.5
//Write a method to replace all spaces in a string with ‘%20’
- (NSString *)replaceCharactersWithInputString:(NSString *)inputString
                                OriginalString:(NSString *)originalString ReplacementString:(NSString *)replacementString
{
    
    NSString *outputString = @"";
    
    for(int i = 0; i < [inputString length]; i++){
        
        NSString *currentString = [inputString substringWithRange:NSMakeRange(i,1)];
        
        if([currentString isEqualToString:originalString]){
            outputString = [outputString stringByAppendingString:replacementString];
        }
        else{
            outputString = [outputString stringByAppendingString:currentString];
        }
        
    }
    
    return outputString;
    
}

//1.6
-(void)rotateWithMatrix:(int **)matrix N:(int)n
{
    
    for (int layer = 0; layer < n / 2; ++layer) {
    
    int first = layer;
    int last=n-1-layer;
        
        for(int i = first; i < last; ++i) {
            
            int offset = i - first;
            
            int top = matrix[first][i]; // save top
            // left -> top
            matrix[first][i] = matrix[last-offset][first];
            // bottom -> left
            matrix[last-offset][first] = matrix[last][last - offset];
            // right -> bottom
            matrix[last][last - offset] = matrix[i][last];
            // top -> right
            matrix[i][last] = top; // right <- saved top
        }
        
    }
    
}




@end


