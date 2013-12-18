//
//  NAYBookViewController.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYBooksViewController.h"
#import "NAYShelfViewController.h"
#import "NAYBook.h"
#import "NAYSelectedItemDataSingleton.h"

@interface NAYBooksViewController ()

{
    NSArray *_books;
    NAYSelectedItemDataSingleton *_globalData;
}

@property (nonatomic) IBOutlet UITableView *booksTableView;

@end

@implementation NAYBooksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _globalData = [NAYSelectedItemDataSingleton getInstance];
    _books = _globalData.selectedBooks;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.booksTableView dequeueReusableCellWithIdentifier:@"BookCell"];
    cell.textLabel.numberOfLines = 0;
    
    NAYBook *bookAtCell = [_books objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", bookAtCell];
    
    return cell;
}

- (IBAction)addBook
{
    UIAlertView *addBookPopup = [[UIAlertView alloc] initWithTitle:@"Enter Title and Author"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    
    addBookPopup.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [addBookPopup show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *title = [alertView textFieldAtIndex:0].text;
        NSString *author = [alertView textFieldAtIndex:1].text;
        NAYBook *newBook = [[NAYBook alloc] initWithTitle:title author:author];
        [[_globalData.selectedBooks[0] shelf] addBookToShelf:newBook];
        [_booksTableView reloadData];
    }
}

@end
