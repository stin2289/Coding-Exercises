//
//  CETower.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/22/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CETower.h"

@implementation CETower

- (CETower *)initWithIndex:(int)index{
    
    self = [super init];
    
    if(self){
        
        _index = index;
        _disks = [[CEStack alloc] init];
        
    }
    
    return self;
    
}

- (BOOL)addNumber:(NSNumber *)number{
    if ([self.disks peek]){
        
        if([((NSNumber *)[self.disks peek]) intValue] <= [number intValue]){
            //don't add disk
            return NO;
        }
        else{
            [self.disks pushWithData:number];
        }
        
    }
    else{
        [self.disks pushWithData:number];
    }
    
    return YES;
}

- (void)moveTopToTower:(CETower *)tower{
    NSNumber *top = (NSNumber *)[self.disks pop];
    //if number added
    if([tower addNumber:top]){
        /*
         NSLog(@"Move disk %@ from %i to %i",top,self.index,tower.index);
         */
    }

}

- (void)print{
    
     //NSLog(@"Contents of tower %i:",self.index);
    
    CENode *node = self.disks.top;
    
    NSString *outputString = @"";
    
    while(node){
        outputString = [outputString stringByAppendingString:[((NSNumber *)node.data) stringValue]];
        node = node.next;
    }
    
   // NSLog(@"%@",outputString);
}

- (void)moveDisksWithNumber:(int)number destination:(CETower *)destination buffer:(CETower *)buffer{
    if (number > 0) {
       // [self print];
        
        [self moveDisksWithNumber:number-1 destination:buffer buffer:destination];
        [self moveTopToTower:destination];
        [buffer  moveDisksWithNumber:number-1  destination:destination buffer:self];
    }
}

@end

