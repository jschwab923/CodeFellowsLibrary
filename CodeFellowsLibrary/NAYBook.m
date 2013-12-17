//
//  NAYBook.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYBook.h"

@implementation NAYBook

- (instancetype)init
{
    return [self initWithTitle:@"Unknown" author:@"Unknown"];
}

- (instancetype)initWithTitle:(NSString *)title author:(NSString *)author
{
    self = [super init];
    
    if (self && title && author) {
        _author = author;
        _title = title;
    }
    
    return self;
}

- (void)removeFromCurrentShelf
{
    if (self.shelf) {
        [self.shelf removeBookFromShelf:self];
        self.shelf = nil;
    }
}

//Assumes book can only be on one shelf at a time, like a physical book.
- (void)addToShelf:(NAYShelf *)shelfToAddTo
{
    if (shelfToAddTo) {
        if (self.shelf) {
            [self.shelf removeBookFromShelf:self];
        }
        self.shelf = shelfToAddTo;
        [shelfToAddTo addBookToShelf:self];
    }
}

@end
