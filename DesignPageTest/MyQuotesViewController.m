//
//  MyQuotesViewController.m
//  DesignPageTest
//
//  Created by Michael Parris on 12/29/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import "MyQuotesViewController.h"
#import <Parse/Parse.h>

@interface MyQuotesViewController ()

@end

@implementation MyQuotesViewController

@synthesize myQuotes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    myQuotes = [[NSMutableArray alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [myQuotes removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Quote"];
    //    [query whereKey:@"Text" equalTo:@"Text"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            [myQuotes addObjectsFromArray:objects];
            [self.tableView reloadData];
        }
        else {
            NSString *networkError = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", networkError);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [myQuotes count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"My Quotes";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *quoteIdentifier = @"MyQuotes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:quoteIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:quoteIdentifier];
    }
    cell.textLabel.text = [[myQuotes objectAtIndex:indexPath.row] objectForKey:@"Text"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
