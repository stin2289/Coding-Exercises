//
//  CETowersOfHanoi.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/22/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CETowersOfHanoi.h"
#import "CETower.h"

typedef NS_ENUM(NSUInteger, TowerDirection){
    
    kTowerDirectionLeft = 0,
    kTowerDirectionRight
    
};

@interface CETowersOfHanoi ()

@property (nonatomic) NSMutableArray *towers;
@property (nonatomic) int totalDisks;

@end

@implementation CETowersOfHanoi

- (CETowersOfHanoi *)initWithNumberOfDisks:(int)disks
{
    self = [super init];
    
    if(self){
        
        self.towers = [[NSMutableArray alloc] init];
        self.totalDisks = disks;
        
        for (int i = 0; i < 3; i++)
            self.towers[i] = [[CETower alloc] initWithIndex:i];
        
        for (int i = self.totalDisks; i > 0; i--)
            [((CETower *)self.towers[0]).disks pushWithData:@(i)];
        
    }
    
    return self;
    
}

- (CEStack *)run
{
    
    [((CETower *)self.towers[0]) moveDisksWithNumber:self.totalDisks destination:self.towers[2] buffer:self.towers[1]];
    
    [((CETower *)self.towers[0]) print];
    [((CETower *)self.towers[1]) print];
    [((CETower *)self.towers[2]) print];
    
    return self.towers[2];
    
}

@end
