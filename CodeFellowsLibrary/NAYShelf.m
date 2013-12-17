//
//  NAYShelf.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYShelf.h"

@interface NAYShelf()

{
    NSMutableArray *_booksOnShelf;
}

@end



@implementation NAYShelf

- (instancetype)init
{
    return [self initWithBooks:[NSArray array]];
}

- (instancetype)initWithBooks:(NSArray *)books
{
    self = [super init];
    
    if (self && books) {
        _booksOnShelf = [books mutableCopy];
    }
    
    return self;
}

- (void)addBookToShelf:(NAYBook *)bookToAdd
{
    if (!_booksOnShelf) {
        _booksOnShelf = [NSMutableArray array];
    }
    
    // Assuming shelves shouldn't contain more than one copy of book
    // though could be reasonable to allow this.
    if (bookToAdd && ![_booksOnShelf containsObject:bookToAdd]) {
        [_booksOnShelf addObject:bookToAdd];
    }
}

- (void)removeBookFromShelf:(NAYBook *)bookToRemove
{
    if (_booksOnShelf) {
        [_booksOnShelf removeObject:bookToRemove];
    }
}

- (void)setBooksOnShelf:(NSArray *)booksOnShelf
{
    _booksOnShelf = [booksOnShelf mutableCopy];
}

- (NSArray *)booksOnShelf
{
    if (!_booksOnShelf) {
        _booksOnShelf = [NSMutableArray array];
    }
    return [_booksOnShelf copy];
}

@end
