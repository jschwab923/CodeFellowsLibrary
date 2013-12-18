//
//  NAYShelfViewController.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYShelfViewController.h"
#import "NAYBooksViewController.h"
#import "NAYLibraryViewController.h"
#import "NAYShelf.h"
#import "NAYSelectedItemDataSingleton.h"

@interface NAYShelfViewController ()

{
    NSArray *_shelves;
    NAYSelectedItemDataSingleton *_globalData;
}

@property (nonatomic) IBOutlet UITableView *shelvesTableView;

@end

@implementation NAYShelfViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _globalData = [NAYSelectedItemDataSingleton getInstance];
    _shelves = _globalData.selectedShelves;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Seque methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (![segue.destinationViewController isKindOfClass:[NAYLibraryViewController class]]) {
        NSIndexPath *selectedRow = [self.shelvesTableView indexPathForSelectedRow];
        NAYShelf *selectedShelf = [_shelves objectAtIndex:selectedRow.row];
        NSArray *booksOnShelf = [selectedShelf booksOnShelf];
        _globalData.selectedBooks = booksOnShelf;
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self.shelvesTableView indexPathForSelectedRow] && [identifier isEqualToString:@"BooksSegue"]) {
        UIAlertView *noSelectionAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                   message:@"Select a shelf to browse"
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
    return [_shelves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.shelvesTableView dequeueReusableCellWithIdentifier:@"ShelfCell"];
    
    NAYShelf *shelfAtCell = [_shelves objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", shelfAtCell];
    
    return cell;
}

@end
