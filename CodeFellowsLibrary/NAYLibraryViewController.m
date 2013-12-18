//
//  NAYViewController.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYLibraryViewController.h"
#import "NAYShelfViewController.h"
#import "SelectedItemData.h"

@interface NAYLibraryViewController ()

{
    NSMutableArray *_libraries;
}

@property (nonatomic) IBOutlet UITableView *librariesTableView;
@property (nonatomic) IBOutlet UINavigationBar *navigationBar;

@end

@implementation NAYLibraryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!_libraries) {
        
        _libraries = [NSMutableArray array];
        
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
        
        [_libraries addObject:downTownLibrary];
        
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
        
        [_libraries addObject:localLibrary];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Seque methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedRow = [self.librariesTableView indexPathForSelectedRow];
    NAYLibrary *selectedLibrary = [_libraries objectAtIndex:selectedRow.row];
    NSArray *shelves = [selectedLibrary allShelves];
    
    SelectedItemData *globalData = [SelectedItemData getInstance];
    [globalData setSelectedShelves:shelves];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self.librariesTableView indexPathForSelectedRow] && [identifier isEqualToString:@"ShelvesSegue"]) {
        UIAlertView *noSelectionAlert = [[UIAlertView alloc] initWithTitle:@"No selection"
                                                                   message:@"Please select a library to browse"
                                                                  delegate:Nil
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil];
        [noSelectionAlert show];
        noSelectionAlert = nil;
        return false;
    }
    return true;
}

#pragma mark - Table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_libraries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.librariesTableView dequeueReusableCellWithIdentifier:@"LibraryCell"];
    
    NAYLibrary *libraryAtCell = [_libraries objectAtIndex:indexPath.row];
    cell.textLabel.text = libraryAtCell.libraryName;
    
    return cell;
}
@end
