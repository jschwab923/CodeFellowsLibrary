//
//  NAYLibrary.h
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAYShelf.h"

@interface NAYLibrary : NSObject

@property (nonatomic, copy) NSArray* allShelves;

- (instancetype)initWithShelves:(NSArray *)shelves;

- (NSArray *)allBooksInLibrary;
- (void)addShelf:(NAYShelf *)shelfToAdd;
- (void)removeShelf:(NAYShelf *)shelfToRemove;

@end
