//
//  DiscoverViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 1/13/14.
//  Copyright (c) 2014 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) IBOutlet UISearchBar *search;

@property (nonatomic) IBOutlet UIImageView *leftImage;
@property (nonatomic) IBOutlet UIImageView *rightImage;

@property (nonatomic) NSMutableArray* discoverItemsArray;

-(IBAction)refresh:(UIBarButtonItem*)button;

@end
