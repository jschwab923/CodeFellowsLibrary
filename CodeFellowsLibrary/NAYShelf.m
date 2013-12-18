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
    return [self initWithBooksOnShelf:[NSArray array]
                            shelfName:@"Unknown"];
}

- (instancetype)initWithBooksOnShelf:(NSArray *)books shelfName:(NSString *)name
{
    self = [super init];
    
    if (self && books && name) {
        _booksOnShelf = [books mutableCopy];
        _shelfName = name;
    }
    
    return self;
}

- (void)addBookToShelf:(NAYBook *)book
{
    if (!_booksOnShelf) {
        _booksOnShelf = [NSMutableArray array];
    }
    
    // Assuming shelves shouldn't contain more than one copy of book
    // though could be reasonable to allow this.
    if (book && ![_booksOnShelf containsObject:book]) {
        [_booksOnShelf addObject:book];
    }
}

- (void)removeBookFromShelf:(NAYBook *)book
{
    if (_booksOnShelf) {
        [_booksOnShelf removeObject:book];
    }
}

- (void)setBooksOnShelf:(NSArray *)books
{
    if (books) {
        _booksOnShelf = [books mutableCopy];
    }
}

- (NSArray *)booksOnShelf
{
    if (!_booksOnShelf) {
        _booksOnShelf = [NSMutableArray array];
    }
    return [_booksOnShelf copy];
}

- (NSString *)description
{
    return self.shelfName;
}

@end
