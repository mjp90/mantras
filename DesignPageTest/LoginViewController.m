//
//  LoginViewController.m
//  DesignPageTest
//
//  Created by Michael Parris on 1/9/14.
//  Copyright (c) 2014 Michael Parris. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logoutButtonTapped:(id)sender {
    [PFUser logOut];
    NSLog(@"User Logged Out Successfully");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)logoutButtonTap:(id)sender {
    [PFUser logOut];
    NSLog(@"User Logged Out Successfully");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)loginButtonTapped:(id)button {
    
    [PFUser logInWithUsernameInBackground:self.emailTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"Login" sender:self];
            
//            self.firstView.delegate = self;
//            UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
//            [logoutButton addTarget:self action:@selector(logoutButtonTapped:) forControlEvents:UIControlEventTouchDown];
//            [logoutButton setTitle:@"Log out" forState:UIControlStateNormal];
//            UIBarButtonItem *logoutButtonItem = [[UIBarButtonItem alloc] initWithCustomView:logoutButton];
//            self.navigationItem.backBarButtonItem = logoutButtonItem;

/*            [self.navigationItem.backBarButtonItem setTarget:self];
            [self.navigationItem.backBarButtonItem setAction:@selector(logoutButtonTap:)];
            [self.navigationItem.backBarButtonItem setTitle:@"Log Out"]; */
            NSLog(@"User Logged In Successfully");
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
    
//    PFQuery *checkCredentials = [PFUser query];
//    [checkCredentials whereKey:@"emailAddress" equalTo:self.emailTextField.text];
//    [checkCredentials whereKey:@"password" equalTo:self.passwordTextField.text];
//
//    [checkCredentials findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if(!error) {
//            NSLog(@"Successfully retrieved: %@", objects);
//            
//            //            [myQuotes addObjectsFromArray:objects];
//            //            [self.tableView reloadData];
//            [self performSegueWithIdentifier:@"Login" sender:self];
//        }
//        else {
//            NSString *networkError = [[error userInfo] objectForKey:@"error"];
//            NSLog(@"Error: %@", networkError);
//        }
//    }];
}

- (IBAction)signupButtonTapped:(id)button {
    PFUser *user = [PFUser user];
    user.username = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
//            [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
            NSLog(@"Successfully retrieved");
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
}

@end
