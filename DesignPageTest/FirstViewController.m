//
//  FirstViewController.m
//  DesignPageTest
//
//  Created by Michael Parris on 12/28/13.
//  Copyright (c) 2013 Michael Parris. All rights reserved.
//

#import "FirstViewController.h"
#import "NSString+FontAwesome.h"
#import <Parse/Parse.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize textSizeSlider, textText, sliderTickMarks, smallTextLabel, largeTextLabel, boldLabel, italicsLabel, underlineLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self tickMarksForSlider:textSizeSlider inView:sliderTickMarks];
    
    smallTextLabel.font = [UIFont fontWithName:@"FontAwesome" size:14];
    largeTextLabel.font = [UIFont fontWithName:@"FontAwesome" size:26];
    smallTextLabel.text = [NSString awesomeIcon:FaFont];
    largeTextLabel.text = [NSString awesomeIcon:FaFont];
    
    boldLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    italicsLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    underlineLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    
    boldLabel.text = [NSString awesomeIcon:FaBold];
    italicsLabel.text = [NSString awesomeIcon:FaItalic];
    underlineLabel.text = [NSString awesomeIcon:FaUnderline];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(UISlider*)slider {
    int index = (int)(slider.value + 0.5);
    [slider setValue:index animated:NO];
    int fontSize = index*2 + 12;
    
//    UIFontDescriptor *fontDes = [textText.font.fontDescriptor p]
    
    textText.font = [UIFont fontWithDescriptor:textText.font.fontDescriptor size:fontSize];
}

- (IBAction)changeButtonPressed:(id)sender {
    NSString *textValue = [textText text];
    float value = [textValue floatValue];
    if (value < 0)
        value = 0;
    if (value > 100)
        value = 100;
    textSizeSlider.value = value;
    textText.text = [NSString stringWithFormat:@"%.1f", value];
    if ([textText canResignFirstResponder])
        [textText resignFirstResponder];
}

- (IBAction)boldButtonPressed:(UIButton *)button {
//    UIFontDescriptor *bodyFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    UIFontDescriptor *bodyFontDescriptor = textText.font.fontDescriptor;
    UIFontDescriptor *boldBodyFontDescriptor = nil;
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:textText.font.pointSize];
    
//    if ((textText.font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) != 0) {
    if ([textText.font.fontName isEqualToString:boldFont.fontName]) {
        boldBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits & ~UIFontDescriptorTraitBold)];
    }
    else {
        boldBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    }
    
    textText.font = [UIFont fontWithDescriptor:boldBodyFontDescriptor size:textText.font.pointSize];
}

- (IBAction)italicButtonPressed:(UIButton *)button {
    UIFontDescriptor *bodyFontDescriptor = textText.font.fontDescriptor;
    UIFontDescriptor *italicBodyFontDescriptor = nil;
    
    UIFont *italicFont = [UIFont italicSystemFontOfSize:textText.font.pointSize];
    
    if ([textText.font.fontName isEqualToString:italicFont.fontName]) {
        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits & ~UIFontDescriptorTraitItalic)];
    }
    else {
        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic];
    }
    
    textText.font = [UIFont fontWithDescriptor:italicBodyFontDescriptor size:textText.font.pointSize];
}

- (IBAction)underlineButtonPressed:(UIButton *)button {
    UIFontDescriptor *bodyFontDescriptor = textText.font.fontDescriptor;
    UIFontDescriptor *underlineBodyFontDescriptor = nil;
    
//    UIFont *underlineFont = [UIFont :textText.font.pointSize];
    
    NSDictionary *underlineAttribute = @{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle) };
    
    underlineBodyFontDescriptor = [[textText.font fontDescriptor] fontDescriptorByAddingAttributes:underlineAttribute];
    
    
//    if ([textText.font.fontName isEqualToString:italicFont.fontName]) {
//        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits & ~UIFontDescriptorTraitItalic)];
//    }
//    else {
//        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic];
//    }
    
    textText.font = [UIFont fontWithDescriptor:underlineBodyFontDescriptor size:textText.font.pointSize];
}

- (UIView*)tickMarksForSlider:(UISlider *)slider inView:(UIView *)view {
//    int ticks = (int)slider.maximumValue;
    int ticks = 6;
    int sliderWidth = slider.frame.size.width;
    
    // these variables help us calculate how far to move the next tick to the left in order to // place them directly under our slider's stopping points.
//    float offset = (ticks < 10) ? 2.7 : 1.1;
    float tickOffset = sliderWidth / ticks;
    
    float tickXPos = 0;
    
    // initialize view to return
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, slider.frame.size.width, slider.frame.size.height);
    view.backgroundColor = [UIColor clearColor];
    
    // make a UIImageView with tick for each tick in the slider
    for (int i=0; i <= ticks; i++)
    {
        // if we're working on the first value for our slider, don't make a tick mark
        // remove this if statement if you want a starting tick mark
        // you'll have to change the for loop conditions above to i <= ticks if you
        // also want an ending tick mark
        
//        if (i == 0) {
//            
//            // add the offset and a few more pixels of offset (the 5.25) to the
//            // first value since our UISlider has a rounded edge graphic and the actual
//            // 0 value starts just after our edge inset
//            tickXPos += tickOffset+5.25;
//            
//        }
//        else
//        {
        
            // make a new tick mark and add it to the tick marks view
            // we're going to return
            UIView *tick = [[UIView alloc] initWithFrame:CGRectMake(tickXPos, 13, 2, 8)];
            tick.backgroundColor = [UIColor colorWithWhite:0.4 alpha:.8];
//            tick.backgroundColor = [UIColor blackColor];
            
            // you may omit this if you don't want your tick marks to have a shadow
            // but if you have a background that is darker than your tick mark color,
            // they sure look nice!
            tick.layer.shadowColor = [[UIColor whiteColor] CGColor];
            tick.layer.shadowOffset = CGSizeMake(0, 1.0f);
            tick.layer.shadowOpacity = 1;
            tick.layer.shadowRadius = 0;
        
            // add the tick as a subview to the tick mark container view
            [view addSubview:tick];
            
            // advance the x position for the next tick mark and subtract a little to 
            // offset the tick so its center is where we want it.
            tickXPos += tickOffset - 0.4;
            
//        }
    }
    return view;
}

- (IBAction)blackColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor blackColor];
}

- (IBAction)redColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor redColor];
}

- (IBAction)orangeColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor orangeColor];
}

- (IBAction)greenColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor greenColor];
}

- (IBAction)yellowColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor yellowColor];
}

- (IBAction)whiteColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor whiteColor];
}

- (IBAction)blueColorButtonPressed:(UIButton *)button {
    textText.textColor = [UIColor blueColor];
}

- (IBAction)saveButtonPressed:(id)button {
    PFObject *quote = [PFObject objectWithClassName:@"Quote"];
    [quote setObject:textText.text forKey:@"Text"];
//    [quote setObject:textText.textColor. forKey:@"Color"];
    [quote saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Object Uploaded!");
        }
        else {
            NSString *networkError = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", networkError);
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (textText) {
        if ([textText canResignFirstResponder])
            [textText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
