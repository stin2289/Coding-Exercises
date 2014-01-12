//
//  CENode.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import "CENode.h"

@implementation CENode

-(instancetype)init{
    
    self = [super init];
    self.next = NULL;
    self.data = NULL;
    
    return self;
    
}

-(instancetype)initWithData:(id)data{
    
    self = [super init];
    self.next = nil;
    self.data = data;
    
    return  self;
}

@end
