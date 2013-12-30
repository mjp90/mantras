//
//  SecondViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 12/28/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *recentQuotes;

@end
