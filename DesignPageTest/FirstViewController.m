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

@synthesize textSizeSlider, textText, sliderTickMarks, smallTextLabel, largeTextLabel,
    boldLabel, italicsLabel, underlineLabel, boldButton, italicsButton, underlineButton,
    textSizeLabel, textStyleLabel, colorLabel, fontLabel, imageLabel,
    blackButton, redButton, orangeButton, greenButton, yellowButton, whiteButton, blueButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
    
    
//    [textText sizeToFit];
//    [textText layoutIfNeeded];
//    CGRect noJumpFrame = [[textText layoutManager] usedRectForTextContainer:[textText textContainer]];
//    textText.frame = noJumpFrame;
    
    self.firstLoad = YES;
    
    [self tickMarksForSlider:textSizeSlider inView:sliderTickMarks];
    if(self.navigationController.navigationItem)
        NSLog(@"Not nil");
    else
        NSLog(@"Nil");
    [self.navigationController setNavigationBarHidden:YES];
    self.fontNameArray = [UIFont familyNames];
//    self.fontNameArray = [NSArray arrayWithArray:[[UIFont familyNames] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
    
    smallTextLabel.font = [UIFont fontWithName:@"FontAwesome" size:14];
    largeTextLabel.font = [UIFont fontWithName:@"FontAwesome" size:26];
    smallTextLabel.text = [NSString awesomeIcon:FaFont];
    largeTextLabel.text = [NSString awesomeIcon:FaFont];
    
    boldLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    italicsLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    underlineLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    textSizeLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    textStyleLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
//    colorLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    fontLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    imageLabel.font = [UIFont fontWithName:@"FontAwesome" size:20];
    
    boldLabel.text = [NSString awesomeIcon:FaBold];
    italicsLabel.text = [NSString awesomeIcon:FaItalic];
    underlineLabel.text = [NSString awesomeIcon:FaUnderline];
    textSizeLabel.text = [NSString awesomeIcon:FaTextHeight];
    textStyleLabel.text = [NSString awesomeIcon:FaList];
//    colorLabel.text = [NSString awesomeIcon:FaPencil];
    fontLabel.text = [NSString awesomeIcon:FaComments];
    imageLabel.text = [NSString awesomeIcon:FaPictureO];
    
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.textText addGestureRecognizer:tap];
//    [tap release];
    
//    UITouch *touchEvent = [touches anyObject];
    //    CGPoint location = [touchEvent locationInView:self.view];
    //    [UIView beginAnimations:@"Dragging" context:nil];
    //    self.view.frame = CGRectMake(location.x, location.y, self.view.frame.size.width, self.view.frame.size.height);
    //    [UIView commitAnimations];
    
    
    
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // There is not a camera on this device, so don't show the camera button.
//    }
//    [self.textColorButton setImage:[UIImage imageNamed:@"Mantra-Icon-Color-Bucket.png"] forState:UIControlStateNormal];
    
}

// Called Before New Text is Put In
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    CGRect noJumpFrame = [[textView layoutManager] usedRectForTextContainer:[textView textContainer]];
////    if (noJumpFrame.size.width > 280 - textView.frame.origin.x)
//    NSLog(@"Text Container Before width: %@, text height: %@", [NSString stringWithFormat:@"%f", noJumpFrame.size.width], [NSString stringWithFormat:@"%f", noJumpFrame.size.height]);
//    
//    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, noJumpFrame.size.width + 20, noJumpFrame.size.height + 15);
//    return YES;
//}

// Passes textView with new view before rendered
//-(void)textViewDidChange:(UITextView *)textView {
//    CGRect noJumpFrame = [[textView layoutManager] usedRectForTextContainer:[textView textContainer]];
////    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, noJumpFrame.size.width + 20, noJumpFrame.size.height + 15);
//    float extendedWidth = noJumpFrame.size.width;
//    if (extendedWidth > 280)
//        textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, 280, textText.frame.size.height);
//    NSLog(@"Text Container Width: %f, Height:%f", noJumpFrame.size.width, noJumpFrame.size.height);
//    NSLog(@"Text View Width: %f, Height:%f", textText.frame.size.width, textText.frame.size.height);
//    
//    // HACKY LOGIC. TRY TO FIND BETTER WAY
////    if (self.firstLoad == YES) {
////        self.firstLoad = NO;
////        textText.frame = noJumpFrame;
////        return;
////    }
////    if (textText.frame.size.width + noJumpFrame.size.width > 280)
////        noJumpFrame.size.width = 280;
////    else
////        noJumpFrame.size.width += textText.frame.size.width;
//    
//    if (noJumpFrame.size.width > 280)
//        noJumpFrame.size.width = 280;
////    if (noJumpFrame.size.height)
//
//    textText.frame = noJumpFrame;
//}

- (void)panView:(UIPanGestureRecognizer *)recognizer {
    CGPoint location = [recognizer translationInView:self.textText];
    CGRect noJumpFrame = [[textText layoutManager] usedRectForTextContainer:[textText textContainer]];
//    float newX = recognizer.view.center.x + location.x;
//    float newY = recognizer.view.center.y + location.y;
    
    
    
    float xO = recognizer.view.frame.origin.x;
    float yO = recognizer.view.frame.origin.y;
    
    float newX = xO + location.x;
    float newY = yO + location.y;
    
//     NSLog(@"View Center: X: %@ Y: %@", [NSString stringWithFormat:@"%f", recognizer.view.center.x], [NSString stringWithFormat:@"%f", recognizer.view.center.y]);
    NSLog(@"View Origin: X: %@ Y: %@", [NSString stringWithFormat:@"%f", recognizer.view.frame.origin.x], [NSString stringWithFormat:@"%f", recognizer.view.frame.origin.y]);
    NSLog(@"Move To: X: %@ Y: %@", [NSString stringWithFormat:@"%f", location.x], [NSString stringWithFormat:@"%f", location.y]);
    
    
    if (newX < 0)
        newX = 0;
    else if (noJumpFrame.size.width > (280 - xO - location.x - 2))
        newX = xO;
    if (newY < 0)
        newY = 0;
    else if (noJumpFrame.size.height > (300 - (yO + location.y + 10)))
        newY = yO;
    
    NSLog(@"Text Size X: %@ New Y: %@", [NSString stringWithFormat:@"%f", noJumpFrame.size.width], [NSString stringWithFormat:@"%f", noJumpFrame.size.height]);
    NSLog(@"New X: %@ New Y: %@", [NSString stringWithFormat:@"%f", newX], [NSString stringWithFormat:@"%f", newY]);
    
    
//    if (newX < 140)
//        newX = 140;
//    else if (newX > 400)
//        newX = 400;
//    
//    if (newY < 150)
//        newY = 150;
//    else if (newY > 400)
//        newY = 400;
    NSUInteger length = [self.textText.text length];
    
//    recognizer.view.center = CGPointMake(newX, newY);
    recognizer.view.frame = CGRectMake(newX, newY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
    [recognizer setTranslation:CGPointMake(0, 0)inView:self.textText];
    
    
    
    //    CGPoint location = [touchEvent locationInView:self.view];
    //    [UIView beginAnimations:@"Dragging" context:nil];
    //    self.view.frame = CGRectMake(location.x, location.y, self.view.frame.size.width, self.view.frame.size.height);
    //    [UIView commitAnimations];
}

//- (NSComparisonResult)localizedCaseInsensitiveCompare:(FontNameAndFeatures *)aFontNameAndFeatures {
//	return ([self.fontName localizedCaseInsensitiveCompare:aFontNameAndFeatures.fontName]);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButtonTapped:(id)sender {
    [PFUser logOut];
    NSLog(@"User Logged Out Successfully");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clearToolBar {
    // Clear Text Sizing Tools
    textSizeSlider.hidden = YES;
    sliderTickMarks.hidden = YES;
    smallTextLabel.hidden = YES;
    largeTextLabel.hidden = YES;
    
    // Clear Text Styling Tools
    boldLabel.hidden = YES;
    italicsLabel.hidden = YES;
    underlineLabel.hidden = YES;
    boldButton.hidden = YES;
    italicsButton.hidden = YES;
    underlineButton.hidden = YES;
    
    
    // Clear Color Tools
    blackButton.hidden = YES;
    redButton.hidden = YES;
    orangeButton.hidden = YES;
    greenButton.hidden = YES;
    yellowButton.hidden = YES;
    whiteButton.hidden = YES;
    blueButton.hidden = YES;
    
    // Clear Font Tool
    self.fontPicker.hidden = YES;
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Button 1");
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.modalPresentationStyle = UIModalPresentationCurrentContext;
        imagePicker.delegate = self;
        self.imagePickerController = imagePicker;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    else if (buttonIndex == 1){
        NSLog(@"Button 2");
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.modalPresentationStyle = UIModalPresentationCurrentContext;
//        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
//        imagePickerController.showsCameraControls = NO;
        self.imagePickerController = imagePicker;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.backgroundImage setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];

    
//    TO MAKE IMAGE BLACK AND WHITE
//    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage]; // this image we get from UIImagePickerController
//    
//    CGColorSpaceRef colorSapce = CGColorSpaceCreateDeviceGray();
//    CGContextRef context = CGBitmapContextCreate(nil, originalImage.size.width, originalImage.size.height, 8, originalImage.size.width, colorSapce, kCGImageAlphaNone);
//    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
//    CGContextSetShouldAntialias(context, NO);
//    CGContextDrawImage(context, CGRectMake(0, 0, originalImage.size.width, originalImage.size.height), [originalImage CGImage]);
//    
//    CGImageRef bwImage = CGBitmapContextCreateImage(context);
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSapce);
//    
//    UIImage *resultImage = [UIImage imageWithCGImage:bwImage]; // This is result B/W image.
//    CGImageRelease(bwImage);
    
}

//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touchEvent = [touches anyObject];
//    CGPoint location = [touchEvent locationInView:self.view];
//    [UIView beginAnimations:@"Dragging" context:nil];
//    self.view.frame = CGRectMake(location.x, location.y, self.view.frame.size.width, self.view.frame.size.height);
//    [UIView commitAnimations];
//}

- (IBAction)showImageActions:(id)sender {
    UIActionSheet *imageAction = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"" destructiveButtonTitle:@"" otherButtonTitles:@"Choose Photo", @"Take Photo", nil];
    imageAction.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [imageAction  showInView:self.view];
//    [imageAction release];
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

- (IBAction)textSizeButtonPressed:(UIButton *)button {
    [self clearToolBar];
    
    textSizeSlider.hidden = NO;
    sliderTickMarks.hidden = NO;
    smallTextLabel.hidden = NO;
    largeTextLabel.hidden = NO;
}

- (IBAction)textStyleButtonPressed:(UIButton *)button {
    [self clearToolBar];
    
    boldLabel.hidden = NO;
    italicsLabel.hidden = NO;
    underlineLabel.hidden = NO;
    boldButton.hidden = NO;
    italicsButton.hidden = NO;
    underlineButton.hidden = NO;
}

- (IBAction)colorButtonPressed:(UIButton *)button {
    [self clearToolBar];
    
    blackButton.hidden = NO;
    redButton.hidden = NO;
    orangeButton.hidden = NO;
    greenButton.hidden = NO;
    yellowButton.hidden = NO;
    whiteButton.hidden = NO;
    blueButton.hidden = NO;
    
    if ([button isSelected]) {
        [button setImage:[UIImage imageNamed:@"Mantra-Icon-Color-Bucket.png"] forState:UIControlStateNormal];
    }
    else {
        [button setImage:[UIImage imageNamed:@"Mantra-Icon-Color-Bucket-(pressed).png"] forState:UIControlStateNormal];
    }
}

- (IBAction)fontButtonPressed:(UIButton *)button {
    [self clearToolBar];
    
    self.fontPicker.hidden = NO;
    
}

- (IBAction)imageButtonPressed:(UIButton *)button {
    UIActionSheet *imageAction = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose Photo", @"Take Photo", nil];
    imageAction.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [imageAction  showInView:self.view];
//    [imageAction dismissWithClickedButtonIndex:imageAction.cancelButtonIndex animated:YES];
}

- (IBAction)boldButtonPressed:(UIButton *)button {
//    UIFontDescriptor *bodyFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    UIFontDescriptor *bodyFontDescriptor = textText.font.fontDescriptor;
    UIFontDescriptor *boldBodyFontDescriptor = nil;
    
//    UIFont *boldFont = [UIFont boldSystemFontOfSize:textText.font.pointSize];
    
//    if ((textText.font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) != 0) {
    //    if ([textText.font.fontName isEqualToString:boldFont.fontName]) {
    if (button.selected) {
        button.selected = NO;
        boldBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits & ~UIFontDescriptorTraitBold)];
    }
    else {
        button.selected = YES;
        boldBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits |UIFontDescriptorTraitBold)];
        
    }
    
    textText.font = [UIFont fontWithDescriptor:boldBodyFontDescriptor size:textText.font.pointSize];
}

- (IBAction)italicButtonPressed:(UIButton *)button {
    UIFontDescriptor *bodyFontDescriptor = textText.font.fontDescriptor;
    UIFontDescriptor *italicBodyFontDescriptor = nil;
    
    if (button.selected) {
        button.selected = NO;
        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits & ~UIFontDescriptorTraitItalic)];
    }
    else {
        button.selected = YES;
        italicBodyFontDescriptor = [bodyFontDescriptor fontDescriptorWithSymbolicTraits:(bodyFontDescriptor.symbolicTraits |UIFontDescriptorTraitItalic)];
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
    UIGraphicsBeginImageContextWithOptions(self.designView.bounds.size, NO, 0.0);
    CGContextClipToRect(UIGraphicsGetCurrentContext(), self.designView.bounds);
    [self.designView.layer renderInContext:UIGraphicsGetCurrentContext()];
    [self.designView drawViewHierarchyInRect:self.designView.bounds afterScreenUpdates:NO];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.backgroundImage setImage:viewImage];
    textText.text = @"";
    
    
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:UIImagePNGRepresentation(viewImage)];
    
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            PFObject *userPhoto = [PFObject objectWithClassName:@"Quote"];
            [userPhoto setObject:imageFile forKey:@"image"];
//            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
//            PFUser *user = [PFUser currentUser];
//            [userPhoto setObject:user forKey:@"user"];
            
            [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
//                    [self refresh:nil];
                }
                else {
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    textText.text = @"";
    self.backgroundImage.image = nil;
    
    
//    [self.backgroundImage setBackgroundColor:[UIColor greenColor]];
//    [self.textText setHidden:YES];
    
//    PFObject *quote = [PFObject objectWithClassName:@"Quote"];
//    [quote setObject:textText.text forKey:@"Text"];
////    [quote setObject:textText.textColor. forKey:@"Color"];
//    [quote saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"Object Uploaded!");
//        }
//        else {
//            NSString *networkError = [[error userInfo] objectForKey:@"error"];
//            NSLog(@"Error: %@", networkError);
//        }
//    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (textText) {
        if ([textText canResignFirstResponder])
            [textText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

#pragma mark Picker Delegate methods

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[UIFont familyNames] count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        [tView setFont:[UIFont fontWithName:[self.fontNameArray objectAtIndex:row] size:20.0]];
        tView.textAlignment = NSTextAlignmentCenter;
        
        
    }
    tView.text = [self.fontNameArray objectAtIndex:row];
    // Fill the label text here
    
    return tView;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.fontNameArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Font Name: %@", [self.fontNameArray objectAtIndex:row]);
    [textText setFont:[UIFont fontWithName:[self.fontNameArray objectAtIndex:row] size:textText.font.pointSize]];
}

@end
