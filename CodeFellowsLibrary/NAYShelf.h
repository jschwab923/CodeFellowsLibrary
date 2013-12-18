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
@property (nonatomic) NSString *shelfName;

- (instancetype)initWithBooksOnShelf:(NSArray *)books shelfName:(NSString *)name;
- (void)addBookToShelf:(NAYBook *)book;
- (void)removeBookFromShelf:(NAYBook *)book;

@end
