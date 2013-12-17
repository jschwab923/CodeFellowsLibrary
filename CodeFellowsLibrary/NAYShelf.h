//
//  NAYShelf.h
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAYBook.h"
@class NAYBook;

@interface NAYShelf : NSObject

@property (nonatomic, copy) NSArray *booksOnShelf;

- (instancetype)initWithBooks:(NSArray *)books;
- (void)addBookToShelf:(NAYBook *)bookToAdd;
- (void)removeBookFromShelf:(NAYBook *)bookToRemove;

@end
