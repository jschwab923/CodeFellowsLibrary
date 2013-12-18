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

// If no other reference to book this method will cause book to be deallocated.
- (void)removeFromCurrentShelf
{
    if (self.shelf) {
        [self.shelf removeBookFromShelf:self];
        self.shelf = nil;
    }
}

//Assumes book can only be on one shelf at a time, like a physical book.
- (void)addToShelf:(NAYShelf *)shelf
{
    if (shelf) {
        if (self.shelf) {
            [self.shelf removeBookFromShelf:self];
        }
        [shelf addBookToShelf:self];
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ by %@", self.title, self.author];
}
@end
