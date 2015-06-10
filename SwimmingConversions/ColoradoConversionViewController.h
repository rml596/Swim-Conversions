//
//  ColoradoConversionViewController.h
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/15/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoradoConversionViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *courseSegmentedControl;
- (IBAction)courseSegmentedAction:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *minutes;
@property (strong, nonatomic) IBOutlet UITextField *seconds;
@property (strong, nonatomic) IBOutlet UITextField *miliseconds;
@property (strong, nonatomic) IBOutlet UIPickerView *strokePicker;

- (IBAction)convert:(id)sender;


-  (IBAction)dismissKeyboard:(id)sender;
- (IBAction)tweet:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *output1;
@property (strong, nonatomic) IBOutlet UILabel *output2;




@end

