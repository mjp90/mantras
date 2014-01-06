//
//  FirstViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 12/28/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, retain) IBOutlet UISlider *textSizeSlider;
@property (nonatomic, retain) IBOutlet UITextView *textText;
@property (nonatomic, retain) IBOutlet UIView *sliderTickMarks;

@property (nonatomic, retain) IBOutlet UILabel *smallTextLabel;
@property (nonatomic, retain) IBOutlet UILabel *largeTextLabel;

@property (nonatomic, retain) IBOutlet UILabel *boldLabel;
@property (nonatomic, retain) IBOutlet UILabel *italicsLabel;
@property (nonatomic, retain) IBOutlet UILabel *underlineLabel;
@property (nonatomic, retain) IBOutlet UILabel *textSizeLabel;
@property (nonatomic, retain) IBOutlet UILabel *textStyleLabel;
@property (nonatomic, retain) IBOutlet UILabel *colorLabel;
@property (nonatomic, retain) IBOutlet UILabel *fontLabel;
@property (nonatomic, retain) IBOutlet UILabel *imageLabel;

@property (nonatomic) IBOutlet UIImageView *backgroundImage;

@property IBOutlet UIButton *boldButton;
@property IBOutlet UIButton *italicsButton;
@property IBOutlet UIButton *underlineButton;
@property IBOutlet UIButton *blackButton;
@property IBOutlet UIButton *redButton;
@property IBOutlet UIButton *orangeButton;
@property IBOutlet UIButton *greenButton;
@property IBOutlet UIButton *yellowButton;
@property IBOutlet UIButton *whiteButton;
@property IBOutlet UIButton *blueButton;

@property (nonatomic) UIImagePickerController *imagePickerController;


-(IBAction)showImageActions:(id)sender;


- (IBAction)sliderValueChanged:(UISlider*)slider;
- (IBAction)changeButtonPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)button;

- (IBAction)boldButtonPressed:(UIButton*)button;
- (IBAction)italicButtonPressed:(UIButton*)button;
- (IBAction)underlineButtonPressed:(UIButton*)button;
- (IBAction)textSizeButtonPressed:(UIButton*)button;
- (IBAction)textStyleButtonPressed:(UIButton*)button;
- (IBAction)colorButtonPressed:(UIButton*)button;
- (IBAction)fontButtonPressed:(UIButton*)button;
- (IBAction)imageButtonPressed:(UIButton*)button;


- (IBAction)blackColorButtonPressed:(UIButton*)button;
- (IBAction)redColorButtonPressed:(UIButton*)button;
- (IBAction)orangeColorButtonPressed:(UIButton*)button;
- (IBAction)greenColorButtonPressed:(UIButton*)button;
- (IBAction)yellowColorButtonPressed:(UIButton*)button;
- (IBAction)whiteColorButtonPressed:(UIButton*)button;
- (IBAction)blueColorButtonPressed:(UIButton*)button;

- (UIView*)tickMarksForSlider:(UISlider*)slider inView:(UIView*)view;

- (void)clearToolBar;

@end
