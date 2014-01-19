//
//  LoginViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 1/9/14.
//  Copyright (c) 2014 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface LoginViewController : UIViewController <FirstViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;

@property (nonatomic, retain) FirstViewController *firstView;

- (IBAction)loginButtonTapped:(id)button;
- (IBAction)signupButtonTapped:(id)button;
- (IBAction)logoutButtonTap:(id)sender;

@end
