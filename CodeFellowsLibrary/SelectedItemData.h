//
//  SelectedItemData.h
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/17/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectedItemData : NSObject

@property (nonatomic) NSArray *selectedShelves;
@property (nonatomic) NSArray *selectedBooks;

+ (SelectedItemData *)getInstance;

@end
