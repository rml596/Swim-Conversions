//
//  ColoradoConversionViewController.m
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/15/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "ColoradoConversionViewController.h"
#import "WebViewController.h"
#import <Social/Social.h>

@interface ColoradoConversionViewController ()

@end

@implementation ColoradoConversionViewController

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
double convertedSeconds;



- (void)viewDidLoad{
    /*
    //adds "done" to keyboard to dismiss it
     
     
    UIToolbar* toolbar = [UIToolbar new];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
    id space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    toolbar.items = @[space, doneButton];
    
    self.minutes.inputAccessoryView = toolbar;
    self.seconds.inputAccessoryView = toolbar;
    self.miliseconds.inputAccessoryView = toolbar;
    */
    
    
    [super viewDidLoad];

    
    pickerData1=@[@"50",@"100",@"200",@"400",@"500"];
    pickerData2=@[@"Fly",@"Back",@"Breast",@"Free",@"I.M."];
    
    self.strokePicker.dataSource=self;
    self.strokePicker.delegate=self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //used for picker
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //used for picker
    if (component == 0) {
        return [pickerData1 count];
    }
    else {
        return [pickerData2 count];
    }
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
    //used for picker
    // Component 0 should load the pickerData1 values, Component 1 will have the pickerData2 values
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
    //finds what is selected in picker
    //based on the component (column), sets an int to be used by other methods
    if(component==0){
        //this looks at the first column and sets an int to what the row is selected in that column
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
        //this looks at the second column and sets an int to what the row is selected in that column
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
    //actually runs the methods to convert the times based on what the Int values are in the pickerview
    
        //if there is nothing entered in the textfields, it displays a message
    if ([self.minutes.text doubleValue]==0&&[self.seconds.text doubleValue]==0&&[self.miliseconds.text doubleValue]==0) {
        self.output1.text=@"No time entered";
        self.output2.text=@"";
    }
    //based on the SegmentedView, a diffrent formula is selected to run
    else if (segmentedValue==0) {
        //SCY is Selected (and entered)
        if (distance==0) {
            //50s
            if(strokeType==0){
                //fly
                [self fiftyFlyConversionSCYtoSCM];
                [self fiftyFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self fiftyBackConversionSCYtoSCM];
                [self fiftyBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self fiftyBreastConversionSCYtoSCM];
                [self fiftyBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
                }
            else if (strokeType==3){
                //free
                [self fiftyFreeConversionSCYtoSCM];
                [self fiftyFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                //fly
                [self hundredFlyConversionSCYtoSCM];
                //[self hundredFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self hundredBackConversionSCYtoSCM];
                [self hundredBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self hundredBreastConversionSCYtoSCM];
                [self hundredBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                //free
                [self hundredFreeConversionSCYtoSCM];
                [self hundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self hundredIMConversionSCYtoSCM];
                [self hundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                //fly
                [self twoHundredFlyConversionSCYtoSCM];
                [self twoHundredFlyConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self twoHundredBackConversionSCYtoSCM];
                [self twoHundredBackConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self twoHundredBreastConversionSCYtoSCM];
                [self twoHundredBreastConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                //free
                [self twoHundredFreeConversionSCYtoSCM];
                [self twoHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self twoHundredIMConversionSCYtoSCM];
                [self twoHundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self fiveHundredFreeConversionSCYtoSCM];
                [self fiveHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self fourHundredIMConversionSCYtoSCM];
                [self fourHundredIMConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==4){
        //500s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self fiveHundredFreeConversionSCYtoSCM];
                [self fiveHundredFreeConversionSCYtoLCM];
                self.output1.text=convertSCM;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
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
                //fly
                [self conversionSCMtoSCY];
                [self fiftyFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self conversionSCMtoSCY];
                [self fiftyBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self conversionSCMtoSCY];
                [self fiftyBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                //free
                [self conversionSCMtoSCY];
                [self fiftyFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                //fly
                [self conversionSCMtoSCY];
                [self hundredFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self conversionSCMtoSCY];
                [self hundredBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self conversionSCMtoSCY];
                [self hundredBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                //free
                [self conversionSCMtoSCY];
                [self hundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self conversionSCMtoSCY];
                [self hundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                //fly
                [self conversionSCMtoSCY];
                [self twoHundredFlyConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==1){
                //back
                [self conversionSCMtoSCY];
                [self twoHundredBackConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==2){
                //breast
                [self conversionSCMtoSCY];
                [self twoHundredBreastConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==3){
                //free
                [self conversionSCMtoSCY];
                [self twoHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self conversionSCMtoSCY];
                [self twoHundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self conversionSCMtoSCY];
                [self fourHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
                [self conversionSCMtoSCY];
                [self fourHundredIMConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
        }
        else if (distance==4){
            //500s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self conversionSCMtoSCY];
                [self fourHundredFreeConversionSCMtoLCM];
                self.output1.text=convertSCY;
                self.output2.text=convertLCM;
            }
            else if (strokeType==4){
                //IM
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
                //fly
                [self fiftyFlyConversionLCMtoSCY];
                [self fiftyFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==1){
                //back
                [self fiftyBackConversionLCMtoSCY];
                [self fiftyBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==2){
                //breast
                [self fiftyBreastConversionLCMtoSCY];
                [self fiftyBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==3){
                //free
                [self fiftyFreeConversionLCMtoSCY];
                [self fiftyFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==4){
                //IM
                self.output1.text=@"There is no 50 I.M.";
                self.output2.text=@"";
            }
        }
        else if (distance==1) {
            //100s
            if(strokeType==0){
                //fly
                [self hundredFlyConversionLCMtoSCY];
                [self hundredFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==1){
                //back
                [self hundredBackConversionLCMtoSCY];
                [self hundredBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==2){
                //breast
                [self hundredBreastConversionLCMtoSCY];
                [self hundredBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==3){
                //free
                [self hundredFreeConversionLCMtoSCY];
                [self hundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==4){
                //IM
                [self hundredIMConversionLCMtoSCY];
                [self hundredIMConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
        }
        else if (distance==2){
            //200s
            if(strokeType==0){
                //fly
                [self twoHundredFlyConversionLCMtoSCY];
                [self twoHundredFlyConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==1){
                //back
                [self twoHundredBackConversionLCMtoSCY];
                [self twoHundredBackConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==2){
                //breast
                [self twoHundredBreastConversionLCMtoSCY];
                [self twoHundredBreastConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==3){
                //free
                [self twoHundredFreeConversionLCMtoSCY];
                [self twoHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
            else if (strokeType==4){
                //IM
                [self twoHundredIMConversionLCMtoSCY];
                [self twoHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCY;
                self.output2.text=convertSCM;
            }
        }
        else if (distance==3){
            //400s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 400 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 400 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 400 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self fiveHundredFreeConversionLCMtoSCY];
                [self fourHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertSCM;
            }
            else if (strokeType==4){
                //IM
                [self fourHundredIMConversionLCMtoSCY];
                [self fourHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertSCM;
            }
        }
        else if (distance==4){
            //500s
            if(strokeType==0){
                //fly
                self.output1.text=@"There is no 500 Fly";
                self.output2.text=@"";
            }
            else if (strokeType==1){
                //back
                self.output1.text=@"There is no 500 Back";
                self.output2.text=@"";
            }
            else if (strokeType==2){
                //breast
                self.output1.text=@"There is no 500 Breast";
                self.output2.text=@"";
            }
            else if (strokeType==3){
                //free
                [self fiveHundredFreeConversionLCMtoSCY];
                [self fourHundredFreeConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertSCM;
            }
            else if (strokeType==4){
                //IM
                [self fourHundredIMConversionLCMtoSCY];
                [self fourHundredIMConversionLCMtoSCM];
                self.output1.text=convertSCM;
                self.output2.text=convertSCM;
            }
        }
    }
}


-(IBAction)dismissKeyboard:(id)sender{
    [sender resignFirstResponder];      //You need a method that allows the user to dismiss the keyboard by tapping
                                        //anywhere on the screen if you're using a decimal keypad. Not required if you're going to use a standard qwerty keyboard. I think the former makes more sense.
}
- (IBAction)segmentedAction:(id)sender {
    //based on what the user selects, sets an int to be used in another method
    if (_segmentedControl.selectedSegmentIndex==0) {
        //if selected on SCY
        segmentedValue=0;
    }
    else if (_segmentedControl.selectedSegmentIndex==1){
        //if selected on SCM
        segmentedValue=1;
    }
    else if (_segmentedControl.selectedSegmentIndex==2){
        //if selected on LCM
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
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredFlyConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredFlyConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)fiftyBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredBackConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)fiftyBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)hundredBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)twoHundredBreastConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)fiftyFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
}
-(NSString *)hundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);

    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)fiveHundredFreeConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925)-6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
    
};
-(NSString *)twoHundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;

};
-(NSString *)fourHundredIMConversionSCYtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
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
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)hundredFlyConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredFlyConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2.8;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)fiftyBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)hundredBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredBackConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)fiftyBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)hundredBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)twoHundredBreastConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)fiftyFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime*1.11+.8;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);

    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
}
-(NSString *)hundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+1.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=fullTime*1.11+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)fiveHundredFreeConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*.8925);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
}
-(NSString *)hundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+1.6;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
}
-(NSString *)twoHundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+3.2;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
    
};
-(NSString *)fourHundredIMConversionSCYtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11)+6.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
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
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
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
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)hundredFlyConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime+1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredFlyConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)fiftyBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)hundredBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredBackConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)fiftyBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)hundredBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)twoHundredBreastConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString*)fiftyFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime+.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
}
-(NSString *)hundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)twoHundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)fourHundredFreeConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
};
-(NSString *)hundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
    
};
-(NSString *)twoHundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
    
};
-(NSString *)fourHundredIMConversionSCMtoLCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertLCM=[NSString stringWithFormat:@"LCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertLCM=[NSString stringWithFormat:@"LCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertLCM;
}


//Conversion Formulas/Methods LCM-SCM
-(NSString *)fiftyFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-.7);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=fullTime-1.4;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredFlyConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-2.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)fiftyBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredBackConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-2.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)fiftyBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)hundredBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)twoHundredBreastConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString*)fiftyFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime-.8);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
   if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
}
-(NSString *)hundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)twoHundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)fourHundredFreeConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
};
-(NSString *)hundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.6);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
    
};
-(NSString *)twoHundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-3.2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
    
};
-(NSString *)fourHundredIMConversionLCMtoSCM{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-6.4);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCM=[NSString stringWithFormat:@"SCM= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCM=[NSString stringWithFormat:@"SCM= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCM;
}


//Conversion Formulas/Methods LCM-SCY
-(NSString *)fiftyFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-.7)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)hundredFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime-1.4)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)twoHundredFlyConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue];
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-2.8)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)fiftyBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-.6)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)hundredBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.2)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)twoHundredBackConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-2.4)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString*)fiftyBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString*)hundredBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime+2);
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString*)twoHundredBreastConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-4)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString*)fiftyFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    
    convertedTime=(fullTime-.8)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
}
-(NSString *)hundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.6)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)twoHundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-3.2)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)fiveHundredFreeConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-6.4)/.8925;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
};
-(NSString *)hundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-1.6)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
    
};
-(NSString *)twoHundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-3.2)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
    
};
-(NSString *)fourHundredIMConversionLCMtoSCY{
    doubleMinutes = [self.minutes.text doubleValue]*60;
    doubleSeconds = [self.seconds.text doubleValue];
    doubleMiliseconds = [self.miliseconds.text doubleValue]/10;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime-6.4)/1.11;
    convertedMinutes=(int)convertedTime/60;
    convertedSeconds=convertedTime-(convertedMinutes*60);
    
    if (convertedSeconds<10)
        convertSCY=[NSString stringWithFormat:@"SCY= %d:0%.2f",convertedMinutes,convertedSeconds];
    else
        convertSCY=[NSString stringWithFormat:@"SCY= %d:%.2f",convertedMinutes,convertedSeconds];
    return convertSCY;
}


@end