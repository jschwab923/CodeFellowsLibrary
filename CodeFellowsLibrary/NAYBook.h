//
//  NAYBook.h
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAYShelf.h"
@class NAYShelf;

@interface NAYBook : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *author;
@property (nonatomic, weak) NAYShelf *shelf;

// Needed to use sqlite database
@property (nonatomic) NSInteger id;

- (instancetype)initWithTitle:(NSString *)title author:(NSString *)author;
- (void)removeFromCurrentShelf;
- (void)addToShelf:(NAYShelf *)shelf;

@end
