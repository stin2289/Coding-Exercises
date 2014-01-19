//
//  CEBitManipulation.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/12/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CEBitManipulation.h"
#import "CEStack.h"

@implementation CEBitManipulation


//5.1
//- You are given two 32-bit numbers, N and M, and two bit positions, i and j
//Write a method to set all bits between i and j in N equal to M (e g , M becomes a substring of N //located at i and starting at j)
//EXAMPLE:
//Input:  N = 10000000000
//M = 10101
//i = 2
//j = 6
//Output: N = 10001010100
+ (int)insertBitsWithN:(int)n m:(int)m i:(int)i j:(int)j
{
    //left shift m by i
    m <<= i;

    //create left of mask
    int left = INT_MAX << j;
    //create right of mask
    int right = pow(2, i) - 1;
    //create mask
    int mask = left | right;
    
    //reset specified bits to 0
    n &= mask;
    
    //set n bits to shifted m
    n |= m;
    
    return n;
    
}


//5.2
//Given a (decimal - e.g. 3.72)number that is passed in as a string
//print the binary representation
//If the number can not be represented accurately in binary, print “ERROR”
+ (NSString *)binaryRepresentationOfString:(NSString *)string
{
    NSString *returnString = @"";
    
    NSArray *components = [string componentsSeparatedByString:@"."];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * convertedInteger = [f numberFromString:components[0]];
    NSNumber * convertedDouble = [f numberFromString:[@"0." stringByAppendingString:components[1]]];
    
    //if the convertedNumbers are invalid
    if(!convertedInteger || !convertedDouble || [components[1] length] > 32){
        return @"";
    }
    
    NSInteger integerValue = [convertedInteger intValue];
    
    int i = 1;
    CEStack *integerStack = [[CEStack alloc] init];
    
    
    //while integerValue is greater than 0
    while(integerValue > 0){
        
        //compare bit position with integerValue
        int compare = i & integerValue;
        if(compare > 0)
            compare = 1;
        
        //push onto stack to reverse order
        [integerStack pushWithData:@(compare)];
        
        integerValue -= compare>0?i:0;
        i <<= 1;
        
        
    }
    
    //print stack of binary numbers
    while([integerStack peek])
        returnString = [returnString stringByAppendingString:[[integerStack pop] stringValue]];
    
    returnString = [returnString stringByAppendingString:@"."];
    
    i = 0;
    
    //display fraction value
    if([components count] > 1){
        
        double doubleValue = [convertedDouble doubleValue];
        
        //loop until value is less than 0
        while(doubleValue > 0.0000000000000000000000000001 && i < 30){
            
            //create bit value
            doubleValue *= 2;
            
            if(doubleValue > 1.0){
                returnString = [returnString stringByAppendingString:@"1"];
                doubleValue -= 1;
            }
            else{
                returnString = [returnString stringByAppendingString:@"0"];
            }

            i++;
            
        }
        
    }
    //fractional value is .0
    else
        returnString = [returnString stringByAppendingString:@"0"];
    
    
    return returnString;
}


//5.3
//- Given an integer, print the next smallest and next largest number that have the same number of 1 bits in their binary representation
+ (NSArray *)returnNextLargestAndSmallestIntegersWithNumber:(NSInteger)number
{
    
    //calculate number of one bits
    NSInteger numberOfOneBits = [self numberOfOneBitsWithNumber:number];
    
    NSInteger nextLargestNumber = number;
    
    //add one to number until it has the same number of one bits
    do{
        nextLargestNumber++;
    }while(numberOfOneBits != [self numberOfOneBitsWithNumber:nextLargestNumber]);
    
    NSInteger nextSmallestNumber = number;
    
    //remove one from the number until it has the same number of one bits
    do{
        nextSmallestNumber--;
    }while(nextSmallestNumber > 0 && numberOfOneBits != [self numberOfOneBitsWithNumber:nextSmallestNumber]);
    
    return @[@(nextSmallestNumber),@(nextLargestNumber)];
    
}

/*
 returns number of ‘on’ bits in a number
 */
+ (NSInteger)numberOfOneBitsWithNumber:(NSInteger)number
{
    
    NSInteger numberOfOneBits = 0;
    
    //while number is greater than 0
    while(number > 0){
        
        //if number has the first bit ‘on'
        if(number % 2 != 0)
            numberOfOneBits++;
        
        number >>= 1;
        
    }
    
    return numberOfOneBits;
    
}




@end
