//
//  CEStack+CEStack_Sorting.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/3/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//


#import "CEStack+Sorting.h"

@implementation CEStack (Sorting)

- (CEStack *)sortedStack
{
    
    CEStack *returnStack = [[CEStack alloc] init];
    CEStack *tempStack = [[CEStack alloc] init];
    
    //while there are values to sort
    while([self peek]){
        
        //pop value
        id <NSCopying> tempObject = [self pop];
        
        //if the returnStack is empty
        if(![returnStack peek]){
            //push value on stack
            [returnStack pushWithData:tempObject];
        }
        //if the returnStack peek is greater than tempObject
        else if([(NSNumber *)[returnStack peek] compare:(NSNumber *)tempObject] == NSOrderedDescending){
            //push value on stack
            [returnStack pushWithData:tempObject];
        }
        //if the returnStack peek is more than tempObject
        else{
            
            do{
                //pop returnStack onto tempStack
                [tempStack pushWithData:[returnStack pop]];
                
                //if the returnStack is empty, stop looping
                if(![returnStack peek])
                    break;
            }
            //pop return stack onto temp stack until return stack value is smaller
            while([(NSNumber *)[returnStack peek] compare:(NSNumber *)tempObject] == NSOrderedAscending);
            
            //push tempObject onto returnStack
            [returnStack pushWithData:tempObject];
            
            //push all items from tempStack back onto returnStack
            while([tempStack peek])
                [returnStack pushWithData:[tempStack pop]];
            
        }
        
    }
    
    return returnStack;
}


@end

