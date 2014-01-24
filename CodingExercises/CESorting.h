//
//  CESorting.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/23/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CESorting : NSObject

//9.1
//- You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B
//Write a method to merge B into A in sorted order.
+ (NSArray *)mergeTwoArraysWithA:(NSArray *)a b:(NSArray *)b;

//merge sort
+ (NSArray *)mergeSortArrayWithInputArray:(NSArray *)inputArray;

@end
