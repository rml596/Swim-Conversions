//
//  ViewController.m
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/15/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

NSArray *pickerData1;
NSArray *pickerData2;
NSString *convertSCY;
NSString *convertSCM;
NSString *convertLCM;
int segmentedValue;

int distance;
int strokeType;

double fullTime;
double doubleSeconds;
double doubleMinutes;
double doubleMiliseconds;
double convertedTime;

int convertedMinutes;
int convertedSeconds;
int convertedMiliseconds;



- (void)viewDidLoad{
    [super viewDidLoad];

    
    pickerData1=@[@"50",@"100",@"200",@"400",@"500"];
    pickerData2=@[@"Fly",@"Back",@"Breast",@"Free",@"I.M."];
    /*[@"50 Free",@"100 Free", @"200 Free", @"100 Fly", @"200 Fly", @"100 Back", @"200 Back",@"100 Breast", @"200 Breast"];*/
    
    self.strokePicker.dataSource=self;
    self.strokePicker.delegate=self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [pickerData1 count];
    }
    else {
        return [pickerData2 count];
    }
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
    //return _pickerData[component][row];
    // Component 0 should load the array1 values, Component 1 will have the array2 values
    if (component == 0) {
        return [pickerData1 objectAtIndex:row];
    }
    else if (component == 1) {
        return [pickerData2 objectAtIndex:row];
    }
    return nil;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0){
        if (row==0) {
            distance=0;
        }
        else if (row==1){
            distance=1;
        }
        else if (row==2){
            distance=2;
        }
        else if(row==3){
            distance=3;
        }
        else if (row==4){
            distance=4;
        }
    }
    if (component==1) {
        if (row==0) {
            strokeType=0;
        }
        else if (row==1){
            strokeType=1;
        }
        else if (row==2){
            strokeType=2;
        }
        else if(row==3){
            strokeType=3;
        }
        else if (row==4){
            strokeType=4;
        }
    }
}


- (IBAction)convert:(id)sender{
    //based on input selects what formula to use
    if (segmentedValue==0) {
        //SCY is Selected (and entered)
        if (distance==0) {
            //50s
            if(strokeType==0){
                [self fiftyFlyConversionSCYtoSCM];
                [self fiftyFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self fiftyBackConversionSCYtoSCM];
                [self fiftyBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self fiftyBreastConversionSCYtoSCM];
                [self fiftyBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
                }
            else if (strokeType==3){
                [self fiftyFreeConversionSCYtoSCM];
                [self fiftyFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                [self hundredFlyConversionSCYtoSCM];
                [self hundredFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self hundredBackConversionSCYtoSCM];
                [self hundredBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self hundredBreastConversionSCYtoSCM];
                [self hundredBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self hundredFreeConversionSCYtoSCM];
                [self hundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self hundredIMConversionSCYtoSCM];
                [self hundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                [self twoHundredFlyConversionSCYtoSCM];
                [self twoHundredFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self twoHundredBackConversionSCYtoSCM];
                [self twoHundredBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self twoHundredBreastConversionSCYtoSCM];
                [self twoHundredBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self twoHundredFreeConversionSCYtoSCM];
                [self twoHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self twoHundredIMConversionSCYtoSCM];
                [self twoHundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self fiveHundredFreeConversionSCYtoSCM];
                [self fiveHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self fourHundredIMConversionSCYtoSCM];
                [self fourHundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==4){
        //500s
            if(strokeType==0){
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self fiveHundredFreeConversionSCYtoSCM];
                [self fiveHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self fourHundredIMConversionSCYtoSCM];
                [self fourHundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
    }
    else if (segmentedValue==1){
        //SCM is selected (and entered)
        if (distance==0) {
            //50s
            if(strokeType==0){
                [self conversionSCMtoSCY];
                [self fiftyFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self conversionSCMtoSCY];
                [self fiftyBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self conversionSCMtoSCY];
                [self fiftyBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self conversionSCMtoSCY];
                [self fiftyFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                [self conversionSCMtoSCY];
                [self hundredFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self conversionSCMtoSCY];
                [self hundredBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self conversionSCMtoSCY];
                [self hundredBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self conversionSCMtoSCY];
                [self hundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self conversionSCMtoSCY];
                [self hundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                [self conversionSCMtoSCY];
                [self twoHundredFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self conversionSCMtoSCY];
                [self twoHundredBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self conversionSCMtoSCY];
                [self twoHundredBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self conversionSCMtoSCY];
                [self twoHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self conversionSCMtoSCY];
                [self twoHundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self conversionSCMtoSCY];
                [self fiveHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self conversionSCMtoSCY];
                [self fourHundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==4){
            //500s
            if(strokeType==0){
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self conversionSCMtoSCY];
                [self fiveHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self conversionSCMtoSCY];
                [self fourHundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
    }
    else if (segmentedValue==2){
        //if LCM is selected (and entered)
        if (distance==0) {
            //50s
            if(strokeType==0){
                [self fiftyFlyConversionLCMtoSCY];
                [self fiftyFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self fiftyBackConversionLCMtoSCY];
                [self fiftyBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self fiftyBreastConversionLCMtoSCY];
                [self fiftyBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self fiftyFreeConversionLCMtoSCY];
                [self fiftyFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                [self hundredFlyConversionLCMtoSCY];
                [self hundredFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self hundredBackConversionLCMtoSCY];
                [self hundredBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self hundredBreastConversionLCMtoSCY];
                [self hundredBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self hundredFreeConversionLCMtoSCY];
                [self hundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self hundredIMConversionLCMtoSCY];
                [self hundredIMConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                [self twoHundredFlyConversionLCMtoSCY];
                [self twoHundredFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                [self twoHundredBackConversionLCMtoSCY];
                [self twoHundredBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                [self twoHundredBreastConversionLCMtoSCY];
                [self twoHundredBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                [self twoHundredFreeConversionLCMtoSCY];
                [self twoHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self twoHundredIMConversionLCMtoSCY];
                [self twoHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self fiveHundredFreeConversionLCMtoSCY];
                [self fourHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self fourHundredIMConversionLCMtoSCY];
                [self fourHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==4){
            //500s
            if(strokeType==0){
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                [self fiveHundredFreeConversionLCMtoSCY];
                [self fourHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                [self fourHundredIMConversionLCMtoSCY];
                [self fourHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    [super touchesBegan:touches withEvent:event];
}
-(IBAction)dismissKeyboard:(id)sender{
    [sender resignFirstResponder];      //You need a method that allows the user to dismiss the keyboard by tapping
                                        //anywhere on the screen if you're using a decimal keypad. Not required if you're going to use a standard qwerty keyboard. I think the former makes more sense.
}
- (IBAction)segmentedAction:(id)sender {
    if (_segmentedControl.selectedSegmentIndex==0) {
        segmentedValue=0;
    }
    else if (_segmentedControl.selectedSegmentIndex==1){
        segmentedValue=1;
    }
    else if (_segmentedControl.selectedSegmentIndex==2){
        segmentedValue=2;
    }
}
- (IBAction)tweet:(id)sender{
    NSArray *activityItems;
    activityItems = @[self.output1.text];

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
    
}

///////////This was the method needed to properly configure the webView//////////////////////


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showWebView"])
    {
        NSString *url = @"http://www.swimswam.com/news/";
        WebViewController *webVC = [segue destinationViewController];
        webVC.urlString = url;
    
    }
}

//Conversion Formulas/Methods for SCY-SCM
-(NSString *)fiftyFlyConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)hundredFlyConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)twoHundredFlyConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)fiftyBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)hundredBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)twoHundredBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString*)fiftyBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString*)hundredBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString*)twoHundredBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString*)fiftyFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
}
-(NSString *)hundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)twoHundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)fiveHundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925)-6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*.8925-6.4)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
};
-(NSString *)hundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
    
};
-(NSString *)twoHundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;

};
-(NSString *)fourHundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCM=[NSString stringWithFormat:@"SCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCM;
}





//Conversion Formulas/Methods SCY-LCM
-(NSString *)fiftyFlyConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11+.7);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+.7)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredFlyConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+1.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFlyConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2.8;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+2.8)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fiftyBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+1.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+2.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+1)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)hundredBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)twoHundredBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11+.8;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+.8)*10;

    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}
-(NSString *)hundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+1.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fiveHundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*.8925)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}
-(NSString *)hundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+1.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+1.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}
-(NSString *)twoHundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
    
};
-(NSString *)fourHundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11+6.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}






//Conversion Formulas/Methods SCM-SCY
-(NSString *)conversionSCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime/1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds/1.11)*10;
    
    convertSCY=[NSString stringWithFormat:@"SCY= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};





//Conversion Formula/Methods SCM-LCM
-(NSString *)fiftyFlyConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.7);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.7)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredFlyConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFlyConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.8)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fiftyBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)hundredBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)twoHundredBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime+.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.8)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}
-(NSString *)hundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fiveHundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925)-6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+6.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
    
};
-(NSString *)twoHundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
    
};
-(NSString *)fourHundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+6.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}





//Conversion Formulas/Methods LCM-SCM
-(NSString *)fiftyFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.7);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.7)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.8)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fiftyBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)hundredBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)twoHundredBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString*)fiftyFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime+.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.8)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}
-(NSString *)hundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)twoHundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)fourHundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds-6.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
};
-(NSString *)hundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.6)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
    
};
-(NSString *)twoHundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
    
};
-(NSString *)fourHundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+6.4)*10;
    
    convertLCM=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertLCM;
}




//Conversion Formulas/Methods LCM-SCY
-(NSString *)fiftyFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.7);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.7)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)hundredFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.4)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)twoHundredFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.8)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)fiftyBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.6)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)hundredBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.2)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)twoHundredBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2.4)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString*)fiftyBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString*)hundredBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+2)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString*)twoHundredBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+4)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString*)fiftyFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime+.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+.8)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
}
-(NSString *)hundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds*1.11)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)twoHundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)fiveHundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925)-6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+6.4)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
};
-(NSString *)hundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+1.6)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
    
};
-(NSString *)twoHundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+3.2)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
    
};
-(NSString *)fourHundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=(int)convertedTime%60;
    convertedMiliseconds=(doubleMiliseconds+6.4)*10;
    
    convertSCY=[NSString stringWithFormat:@"LCM= %d:%02d.%02d",convertedMinutes,convertedSeconds,convertedMiliseconds];
    return convertSCY;
}


@end