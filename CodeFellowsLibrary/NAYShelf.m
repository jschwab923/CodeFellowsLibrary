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

- (instancetype)initWithBooksOnShelf:(NSArray *)booksOnShelf shelfName:(NSString *)shelfName
{
    self = [super init];
    
    if (self && booksOnShelf && shelfName) {
        _booksOnShelf = [booksOnShelf mutableCopy];
        _shelfName = shelfName;
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
