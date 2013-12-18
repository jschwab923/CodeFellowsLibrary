//
//  SelectedItemData.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/17/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//
//  Singleton class for storing global data.

#import "SelectedItemDataSingleton.h"

@implementation SelectedItemDataSingleton

+ (SelectedItemDataSingleton *)getInstance
{
    static SelectedItemDataSingleton *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

@end
