//
//  SelectedItemData.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/17/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//
//  Singleton class for storing global data.

#import "NAYSelectedItemDataSingleton.h"
#import "NAYLibrary.h"
#import "NAYShelf.h"
#import "NAYBook.h"

@interface NAYSelectedItemDataSingleton ()

- (void)setUpLibraries;

@end



@implementation NAYSelectedItemDataSingleton

+ (NAYSelectedItemDataSingleton *)getInstance
{
    static NAYSelectedItemDataSingleton *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
        [sharedInstance setUpLibraries];
    }
    return sharedInstance;
}

- (void)setUpLibraries
{
    NSMutableArray *librarySetUp = [NSMutableArray array];
    // Set up books and shelves for downtown library
    NSMutableArray *downTownFantasyBooks = [NSMutableArray array];
    NSMutableArray *downTownSciFiBooks = [NSMutableArray array];
    NSMutableArray *downTownProgrammingBooks = [NSMutableArray array];
    
    [downTownFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"The Lies of Locke Lamora" author:@"Scott Lynch"]];
    [downTownFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"The Name of The Wind" author:@"Patrick Rothfuss"]];
    [downTownFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"The Blade Itself" author:@"Joe Abercrombie"]];
    
    [downTownSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"Cryptonomicon" author:@"Neal Stephenson"]];
    [downTownSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"Ender's Game" author:@"Orson Scott Card"]];
    [downTownSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"The Reality Dysfunction" author:@"Peter F. Hamilton"]];
    
    [downTownProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"The Art of Computer Programming" author:@"Donald Knuth"]];
    [downTownProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"Javascript, The Good Parts" author:@"Douglas CrockFord"]];
    [downTownProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"Code Complete 2" author:@"Steve McConnell"]];
    
    NAYShelf *downTownFantasyShelf = [[NAYShelf alloc] initWithBooksOnShelf:downTownFantasyBooks shelfName:@"Fantasy"];
    NAYShelf *downTownSciFiShelf = [[NAYShelf alloc] initWithBooksOnShelf:downTownSciFiBooks shelfName:@"SciFi"];
    NAYShelf *downTownProgrammingShelf = [[NAYShelf alloc] initWithBooksOnShelf:downTownProgrammingBooks shelfName:@"Programming"];
    
    NSArray *downTownShelves = @[downTownFantasyShelf, downTownSciFiShelf, downTownProgrammingShelf];
    NAYLibrary *downTownLibrary = [[NAYLibrary alloc] initWithShelves:downTownShelves libraryName:@"Downtown Library"];
    
    [librarySetUp addObject:downTownLibrary];
    
    // Set up books and shelves for local library
    NSMutableArray *localFantasyBooks = [NSMutableArray array];
    NSMutableArray *localSciFiBooks = [NSMutableArray array];
    NSMutableArray *localProgrammingBooks = [NSMutableArray array];
    
    [localFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"Red Seas Under Red Skies" author:@"Scott Lynch"]];
    [localFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"The Wise Man's Fear" author:@"Patrick Rothfuss"]];
    [localFantasyBooks addObject:[[NAYBook alloc] initWithTitle:@"Before They Are Hanged" author:@"Joe Abercrombie"]];
    
    [localSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"Quicksilver" author:@"Neal Stephenson"]];
    [localSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"Speaker for the Dead" author:@"Orson Scott Card"]];
    [localSciFiBooks addObject:[[NAYBook alloc] initWithTitle:@"The Neutronium Alchemist" author:@"Peter F. Hamilton"]];
    
    [localProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"C Primer Plus" author:@"Stephen Prata"]];
    [localProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"Algorithms" author:@"Robert Sedgewick"]];
    [localProgrammingBooks addObject:[[NAYBook alloc] initWithTitle:@"Cracking the Coding Interview" author:@"Gayle Laakman McDowell"]];
    
    NAYShelf *localFantasyShelf = [[NAYShelf alloc] initWithBooksOnShelf:localFantasyBooks shelfName:@"Fantasy"];
    NAYShelf *localSciFiShelf = [[NAYShelf alloc] initWithBooksOnShelf:localSciFiBooks shelfName:@"SciFi"];
    NAYShelf *localProgrammingShelf = [[NAYShelf alloc] initWithBooksOnShelf:localProgrammingBooks shelfName:@"Programming"];
    
    NSArray *localShelves = @[localFantasyShelf, localSciFiShelf, localProgrammingShelf];
    NAYLibrary *localLibrary = [[NAYLibrary alloc] initWithShelves:localShelves libraryName:@"Local Library"];
    
    [librarySetUp addObject:localLibrary];
    
    self.libraries = [librarySetUp copy];
    
}

@end
