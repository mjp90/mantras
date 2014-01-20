//
//  DiscoverViewController.m
//  DesignPageTest
//
//  Created by Michael Parris on 1/13/14.
//  Copyright (c) 2014 Michael Parris. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoveredViewCell.h"
#import <Parse/Parse.h>
#import "NSString+FontAwesome.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

@synthesize discoverItemsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    discoverItemsArray = [[NSMutableArray alloc] init];
    [self downloadDiscoverItems];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.search.placeholder = @"Search Mantras                                            ";
//    [self.search setTintColor:[UIColor greenColor]];
//    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor redColor]];
    
    UITapGestureRecognizer *viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard:)];
    [self.view addGestureRecognizer:viewTap];
    
    // To set placeholder text color in Search Bar
    for (UIView *subView in self.search.subviews)
    {
        for (UIView *secondLevelSubview in subView.subviews){
            if ([secondLevelSubview isKindOfClass:[UITextField class]])
            {
                UITextField *searchBarTextField = (UITextField *)secondLevelSubview;
                UIColor *placeholderColor = [UIColor colorWithRed:.85 green:.85 blue:.85 alpha:1.0];
                searchBarTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:searchBarTextField.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
//                [searchBarTextField setValue:[UIColor colorWithRed:.97 green:.97 blue:.97 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
                
                //set font color here
//                searchBarTextField.textColor = [UIColor redColor];
                
                break;
            }
        }
    }
    
//    [self.search. setValue:[UIColor colorWithRed:120.0/255.0 green:116.0/255.0 blue:115.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view setBackgroundColor:[UIColor colorWithRed:.968 green:.968 blue:.968 alpha:1]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadDiscoverItems {
    [discoverItemsArray removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Quote"];
//    PFUser *user = [PFUser currentUser];
//    [query whereKey:@"user" equalTo:user];
    query.limit = 30;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            if (objects.count > 0) {
                for (PFObject *eachObject in objects) {
                    PFFile *imageFile = [eachObject objectForKey:@"image"];
                    NSData *imageData = [imageFile getData];
                    UIImage *image = [UIImage imageWithData:imageData];
                    [discoverItemsArray addObject:image];
                }
                [self.tableView reloadData];
            }
//            [discoverItemsArray addObjectsFromArray:objects];
        }
        else {
            NSString *networkError = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", networkError);
        }
    }];
}

- (IBAction)refresh:(UIBarButtonItem *)button {
    NSLog(@"Refreshing...");
    [self downloadDiscoverItems];
}

#pragma mark UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    float rows = ceil(((float)[discoverItemsArray count] / 2.0));
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"previewQuoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    UILabel *label1 = [[UILabel alloc] initWithFrame:cell.label.frame];
//    label1.backgroundColor = [UIColor blackColor];
//    [cell addSubview:label1];
//    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
//    cell.label.text = @"name";
//    cell.backgroundColor = [UIColor blackColor];
    
//    for (NSInteger *row in [indexPath row]) {
//        UIImage *leftImage = ;
//        UIImage *rightImage = ;
//    }
//
    if ([indexPath row] > [discoverItemsArray count]) {
        return cell;
    } else {
        NSLog(@"Row: %d", [indexPath row]);
        NSLog(@"Row Next: %d", ([indexPath row] + 1));
        
        UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        int cellRow = [indexPath row] * 2;

        UIImage *leftImage = [discoverItemsArray objectAtIndex:cellRow];
        if (cellRow + 1 < [discoverItemsArray count]) {
            UIImage *rightImage = [discoverItemsArray objectAtIndex:(cellRow + 1)];
            UIImageView *image2 = (UIImageView*)[cell viewWithTag:101];
            [image2 setImage:rightImage];
            [image2 addGestureRecognizer:imageTap];
        }
    
        UIImageView *image1 = (UIImageView*)[cell viewWithTag:100];
        
//    UIImageView *image3 = (UIImageView*)[cell viewWithTag:102];

        [image1 setImage:leftImage];
        
//    [image3 setBackgroundColor:[UIColor blueColor]];
        
        
        [image1 addGestureRecognizer:imageTap];
        
    
    }
    
    return cell;
}

- (void)imageTapped:(UIImageView*)image {
    [image setFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
}

- (void)dissmissKeyboard:(UITapGestureRecognizer*)tap {
    if (self.search.isFirstResponder) {
        [self.search resignFirstResponder];
        self.search.text = @"";
    }
}

#pragma mark UISearchBarDelegate Methods

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchBar.text = @"";
}

@end
