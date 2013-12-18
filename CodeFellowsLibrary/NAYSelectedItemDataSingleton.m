//
//  SelectedItemData.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/17/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//
//  Singleton class for storing global data.

#import "NAYSelectedItemDataSingleton.h"

@implementation NAYSelectedItemDataSingleton

+ (NAYSelectedItemDataSingleton *)getInstance
{
    static NAYSelectedItemDataSingleton *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

@end
