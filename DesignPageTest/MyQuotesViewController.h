//
//  MyQuotesViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 12/29/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyQuotesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *myQuotes;
@property IBOutlet UITableView *tableView;

@end
