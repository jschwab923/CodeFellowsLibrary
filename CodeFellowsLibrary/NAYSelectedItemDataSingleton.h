//
//  SelectedItemData.h
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/17/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAYSelectedItemDataSingleton : NSObject

@property (nonatomic) NSArray *libraries;
@property (nonatomic) NSArray *selectedShelves;
@property (nonatomic) NSArray *selectedBooks;

+ (NAYSelectedItemDataSingleton *)getInstance;

@end
