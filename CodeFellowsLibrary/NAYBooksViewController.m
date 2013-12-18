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

#import "NAYBookDataController.h"

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
    
    //[self testBookDataController];
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

#pragma mark - Testing database

//- (void)testBookDataController
//{
//    NAYBookDataController *dataController = [[NAYBookDataController alloc] init];
//    [dataController createTableWithName:@"Fantasy"];
//    
//    NSInteger i = 0;
//    for (NAYBook *b in _books) {
//        b.id = i;
//        i++;
//    }
//    
//    [dataController addArrayOfBooks:_books];
//    
//    _books = [dataController getAllBooks];
//    NSLog(@"%@",_books);
//    
//    NAYBook *newBook = [[NAYBook alloc] initWithTitle:@"Test Title" author:@"Test Author"];
//    newBook.id = 5;
//    [dataController addBook:newBook];
//    
//    [newBook setAuthor:@"New Test Author"];
//    [dataController updateBook:newBook];
//    
//    [dataController deleteBook:newBook];
//    
//    NSLog(@"%@", [dataController getAllBooks]);
//}

@end
