//
//  ViewController.h
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/15/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *minutes;
@property (strong, nonatomic) IBOutlet UITextField *seconds;
@property (strong, nonatomic) IBOutlet UITextField *miliseconds;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) IBOutlet UIPickerView *strokePicker;

-(IBAction)convertTimes:(id)sender;
-(IBAction)dismissKeyboard:(id)sender;


@end

