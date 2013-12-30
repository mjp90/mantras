//
//  SecondViewController.m
//  DesignPageTest
//
//  Created by Michael Parris on 12/28/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import "SecondViewController.h"
#import <Parse/Parse.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize recentQuotes;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    recentQuotes = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [recentQuotes removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Quote"];
    //    [query whereKey:@"Text" equalTo:@"Text"];
    query.limit = 30;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            [recentQuotes addObjectsFromArray:objects];
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
    return [recentQuotes count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Recent Quotes";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *quoteIdentifier = @"MyQuotes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:quoteIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:quoteIdentifier];
    }
    cell.textLabel.text = [[recentQuotes objectAtIndex:indexPath.row] objectForKey:@"Text"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
