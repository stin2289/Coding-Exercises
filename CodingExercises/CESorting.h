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

//bubble sort
+ (NSArray *)bubbleSortArrayWithInputArray:(NSMutableArray *)inputArray;

//selection sort
+ (NSArray *)selectionSortArrayWithInputArray:(NSMutableArray *)inputArray;

//quicksort
+ (NSArray *)quickSortArrayWithInputArray:(NSMutableArray *)inputArray size:(int)size initialIndex:(int)initialIndex;

//bucketsort
+ (NSArray *)bucketSortArrayWithInputArray:(NSMutableArray *)inputArray numberOfBuckets:(NSInteger)numberOfBuckets;

//selection sort string
+ (NSString *)selectionSortWithInputString:(NSString *)inputString;

//9.2
//- Write a method to sort an array of strings so that all the anagrams are next to each other
+ (NSArray *)orderAnagramsWithInputArray:(NSArray *)inputArray;

//binary search of array
+ (NSInteger)returnIndexOfTarget:(NSNumber *)target withArray:(NSArray *)array;

//9.3
//- Given a sorted array of n integers that has been rotated an unknown number of times
//give an O(log n) algorithm that finds an element in the array.
//You may assume that the array was originally sorted in increasing order
+ (int)binarySearchWithArray:(NSArray *)array lower:(int)lower upper:(int)upper target:(NSNumber *)target;

//9.5
//- Given a sorted array of strings which is interspersed with empty strings, write a method to find the location of a given string
//Example: find “ball” in [“at”, “”, “”, “”, “ball”, “”, “”, “car”, “”, “”, “dad”, “”, “”] will //return 4
+ (int)returnIndexOfTarget:(NSString *)target interspersedArray:(NSArray *)interspersedArray;

@end
