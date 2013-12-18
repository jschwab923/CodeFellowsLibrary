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
@property (nonatomic) NSString* libraryName;

- (instancetype)initWithShelves:(NSArray *)shelves libraryName:(NSString *)libraryName;

- (NSArray *)allBooksInLibrary;
- (void)addShelf:(NAYShelf *)shelf;
- (void)removeShelf:(NAYShelf *)shelf;

@end
