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
NSString *convert;
double fullTime;
double doubleSeconds;
double doubleMinutes;
double doubleMiliseconds;
double convertedTime;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pickerData = @[@[@"50",@"100",@"200",@"NA"],@[@"Fly", @"Free",@"Back",@"Breast"]];
    /*[@"50 Free",@"100 Free", @"200 Free", @"100 Fly", @"200 Fly", @"100 Back", @"200 Back",@"100 Breast", @"200 Breast"];*/
    self.strokePicker.dataSource=self;
    self.strokePicker.delegate=self;
    
    
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/10;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
}
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 4;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
    return _pickerData[component][row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
-(NSString *)fiftyFreeConversion{
    convertedTime=fullTime*1.11+.7;
    convert=@"%d", convertedTime;
    return convert;
};

-(NSString *)hundredFreeConversion{
convertedTime=fullTime*1.11+1.6;
converted=@"%d",convertedTime;
return convert;
};

-(NSString *)twoHundredFreeConversion{
convertedTime=fullTime*1.11+3.2;
converted=@"%d",convertedTime;
return convert;
};







@end




