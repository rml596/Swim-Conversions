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

NSArray *_pickerData; //could divide this up into two arrays of raceTimes and raceStyles
NSString *convert;

double fullTime;
double doubleSeconds;
double doubleMinutes;
double doubleMiliseconds;
double convertedTime;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pickerData = @[@[@"50",@"100",@"200",@"NA"],@[@"Fly", @"Free",@"Back",@"Breast"]];
    /*[@"50 Free",@"100 Free", @"200 Free", @"100 Fly", @"200 Fly", @"100 Back", @"200 Back",@"100 Breast", @"200 Breast"];*/
    
    self.strokePicker.dataSource=self;
    self.strokePicker.delegate=self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/10;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
}


///////////////////////////////////////data source methods//////////////////////////////////////////////////////////////

-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _pickerData.count;
}
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component
{
    return _pickerData[component][row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////delegate methods////////////////////////////////////////////////


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //You'll use this method to get the selected row and component number and use it to get the the appropriate method
    //maybe use a switch statement with the different methods for each case (index)...or something like this.
    //see http://nscookbook.com/2013/01/ios-programming-recipe-9-adding-multiple-columns-to-uipickerview/
    
    switch (row)
    {
        case 0:
            [self fiftyFreeConversion];
            break;
        case 1:
            [self hundredFreeConversion];
            
        default:
            break;
    }
    
    // you also need a method like updateLabel to update the main label at the top with the converted data.
    //that would also be called here or in the actual conversion methods at the end
    
    
}

-(IBAction)dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];      //You need a method that allows the user to dismiss the keyboard by tapping
                                        //anywhere on the screen if you're using a decimal keypad. Not required if you're going to use a standard qwerty keyboard. I think the former makes more sense.
}



- (IBAction)convertTimes:(id)sender
{
    
    
}

-(NSString *)fiftyFreeConversion
{
    
    convertedTime=fullTime*1.11+.7;
    convert = @"%d", convertedTime;     //This conversion can only be done within a method
    return convert;
};

-(NSString *)hundredFreeConversion
{
    convertedTime=fullTime*1.11+1.6;
    convert=@"%d",convertedTime;        //This conversion can only be done within a method
    return convert;
};

-(NSString *)twoHundredFreeConversion
{
    convertedTime=fullTime*1.11+3.2;
    convert=@"%d",convertedTime;        //This conversion can only be done within a method
    return convert;
};







@end




