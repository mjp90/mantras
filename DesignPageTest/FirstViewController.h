//
//  FirstViewController.h
//  DesignPageTest
//
//  Created by Michael Parris on 12/28/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController

@property (nonatomic, retain) IBOutlet UISlider *textSizeSlider;
@property (nonatomic, retain) IBOutlet UITextView *textText;
@property (nonatomic, retain) IBOutlet UIView *sliderTickMarks;

@property (nonatomic, retain) IBOutlet UILabel *smallTextLabel;
@property (nonatomic, retain) IBOutlet UILabel *largeTextLabel;

@property (nonatomic, retain) IBOutlet UILabel *boldLabel;
@property (nonatomic, retain) IBOutlet UILabel *italicsLabel;
@property (nonatomic, retain) IBOutlet UILabel *underlineLabel;

- (IBAction)sliderValueChanged:(UISlider*)slider;
- (IBAction)changeButtonPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)button;

- (IBAction)boldButtonPressed:(UIButton*)button;
- (IBAction)italicButtonPressed:(UIButton*)button;
- (IBAction)underlineButtonPressed:(UIButton*)button;

- (IBAction)blackColorButtonPressed:(UIButton*)button;
- (IBAction)redColorButtonPressed:(UIButton*)button;
- (IBAction)orangeColorButtonPressed:(UIButton*)button;
- (IBAction)greenColorButtonPressed:(UIButton*)button;
- (IBAction)yellowColorButtonPressed:(UIButton*)button;
- (IBAction)whiteColorButtonPressed:(UIButton*)button;
- (IBAction)blueColorButtonPressed:(UIButton*)button;

- (UIView*)tickMarksForSlider:(UISlider*)slider inView:(UIView*)view;

@end
