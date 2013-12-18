//
//  NAYViewController.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYLibraryViewController.h"
#import "NAYShelfViewController.h"
#import "NAYSelectedItemDataSingleton.h"
#import "NAYLibrary.h"
#import "NAYShelf.h"
#import "NAYBook.h"

@interface NAYLibraryViewController ()

{
    NSArray *_libraries;
    NAYSelectedItemDataSingleton *globalData;
}

@property (nonatomic) IBOutlet UITableView *librariesTableView;

@end

@implementation NAYLibraryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    globalData = [NAYSelectedItemDataSingleton getInstance];
    _libraries = globalData.libraries;
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
    
    [globalData setSelectedShelves:shelves];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self.librariesTableView indexPathForSelectedRow] && [identifier isEqualToString:@"ShelvesSegue"]) {
        UIAlertView *noSelectionAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                   message:@"Select a library to browse"
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@", libraryAtCell];
    
    return cell;
}
@end
