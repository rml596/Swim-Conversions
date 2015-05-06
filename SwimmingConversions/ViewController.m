//
//  ViewController.m
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/15/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *_pickerData;
double fullTime;
double doubleSeconds;
double doubleMinutes;
double doubleMiliseconds;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pickerData =@[@[@"50",@"100", @"200"],
                   @[@"Fly",@"Back",@"Breast", @"Free", @"I.M."]];
    self.strokePicker.dataSource=self;
    self.strokePicker.delegate=self;
    
    
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/10;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
}
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerData.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
    return _pickerData[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
@end
