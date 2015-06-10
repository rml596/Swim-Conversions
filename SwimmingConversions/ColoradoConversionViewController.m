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

NSArray *coloradoPickerData1;
NSArray *coloradoPickerData2;
NSArray *niscaPickerData1;
NSArray *niscaPickerData2;

NSString *convertSCY;
NSString *convertSCM;
NSString *convertLCM;
int segmentedCourseValue;
int segmentedTypeValue;
int segmentedGenderValue;


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

    
    coloradoPickerData1=@[@"50",@"100",@"200",@"400",@"500"];
    coloradoPickerData2=@[@"Fly",@"Back",@"Breast",@"Free",@"I.M."];
    niscaPickerData1=@[@"50",@"100",@"200",@"400/500"];
    niscaPickerData2=@[@"Fly",@"Back",@"Breast",@"Free",@"I.M.",@"Medly Relay",@"Free Relay"];
    
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
        return [coloradoPickerData1 count];
    }
    else {
        return [coloradoPickerData2 count];
    }
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
    //used for picker
    // Component 0 should load the pickerData1 values, Component 1 will have the pickerData2 values
    if (component == 0) {
        return [coloradoPickerData1 objectAtIndex:row];
    }
    else if (component == 1) {
        return [coloradoPickerData2 objectAtIndex:row];
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
    else if (segmentedTypeValue==0){
        //if selected USA
        if (segmentedCourseValue==0) {
            //SCY is Selected (and entered)
            if (distance==0) {
                //50s
                if(strokeType==0){
                    //fly
                    [self coloradoFiftyFlyConversionSCYtoSCM];
                    [self coloradoFiftyFlyConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoFiftyBackConversionSCYtoSCM];
                    [self coloradoFiftyBackConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoFiftyBreastConversionSCYtoSCM];
                    [self coloradoFiftyBreastConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                    }
                else if (strokeType==3){
                    //free
                    [self coloradoFiftyFreeConversionSCYtoSCM];
                    [self coloradoFiftyFreeConversionSCYtoLCM];
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
                    [self coloradoHundredFlyConversionSCYtoSCM];
                    [self coloradoHundredFlyConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                //back
                    [self coloradoHundredBackConversionSCYtoSCM];
                    [self coloradoHundredBackConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoHundredBreastConversionSCYtoSCM];
                    [self coloradoHundredBreastConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoHundredFreeConversionSCYtoSCM];
                    [self coloradoHundredFreeConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoHundredIMConversionSCYtoSCM];
                    [self coloradoHundredIMConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
            }
            else if (distance==2){
                //200s
                if(strokeType==0){
                    //fly
                    [self coloradoTwoHundredFlyConversionSCYtoSCM];
                    [self coloradoTwoHundredFlyConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoTwoHundredBackConversionSCYtoSCM];
                    [self coloradoTwoHundredBackConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoTwoHundredBreastConversionSCYtoSCM];
                    [self coloradoTwoHundredBreastConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoTwoHundredFreeConversionSCYtoSCM];
                    [self coloradoTwoHundredFreeConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoTwoHundredIMConversionSCYtoSCM];
                    [self coloradoTwoHundredIMConversionSCYtoLCM];
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
                    [self coloradoFiveHundredFreeConversionSCYtoSCM];
                    [self coloradoFiveHundredFreeConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoFourHundredIMConversionSCYtoSCM];
                    [self coloradoFourHundredIMConversionSCYtoLCM];
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
                    [self coloradoFiveHundredFreeConversionSCYtoSCM];
                    [self coloradoFiveHundredFreeConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoFourHundredIMConversionSCYtoSCM];
                    [self coloradoFourHundredIMConversionSCYtoLCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertLCM;
                }
            }
        }
        else if (segmentedCourseValue==1){
            //SCM is selected (and entered)
            if (distance==0) {
                //50s
                if(strokeType==0){
                    //fly
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFiftyFlyConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFiftyBackConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFiftyBreastConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFiftyFreeConversionSCMtoLCM];
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
                    [self coloradoConversionSCMtoSCY];
                    [self hundredFlyConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoHundredBackConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoHundredBreastConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoHundredFreeConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoHundredIMConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
            }
            else if (distance==2){
                //200s
                if(strokeType==0){
                    //fly
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoTwoHundredFlyConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoTwoHundredBackConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoTwoHundredBreastConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoTwoHundredFreeConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoTwoHundredIMConversionSCMtoLCM];
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
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFourHundredFreeConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFourHundredIMConversionSCMtoLCM];
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
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFourHundredFreeConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoConversionSCMtoSCY];
                    [self coloradoFourHundredIMConversionSCMtoLCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertLCM;
                }
            }
        }
        else if (segmentedCourseValue==2){
            //if LCM is selected (and entered)
            if (distance==0) {
                //50s
                if(strokeType==0){
                    //fly
                    [self coloradoFiftyFlyConversionLCMtoSCY];
                    [self coloradoFiftyFlyConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoFiftyBackConversionLCMtoSCY];
                    [self coloradoFiftyBackConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoFiftyBreastConversionLCMtoSCY];
                    [self coloradoFiftyBreastConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoFiftyFreeConversionLCMtoSCY];
                    [self coloradoFiftyFreeConversionLCMtoSCM];
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
                    [self coloradoHundredFlyConversionLCMtoSCY];
                    [self coloradoHundredFlyConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoHundredBackConversionLCMtoSCY];
                    [self coloradoHundredBackConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoHundredBreastConversionLCMtoSCY];
                    [self coloradoHundredBreastConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoHundredFreeConversionLCMtoSCY];
                    [self coloradoHundredFreeConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoHundredIMConversionLCMtoSCY];
                    [self coloradoHundredIMConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
            }
            else if (distance==2){
                //200s
                if(strokeType==0){
                    //fly
                    [self coloradoTwoHundredFlyConversionLCMtoSCY];
                    [self coloradoTwoHundredFlyConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==1){
                    //back
                    [self coloradoTwoHundredBackConversionLCMtoSCY];
                    [self coloradoTwoHundredBackConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==2){
                    //breast
                    [self coloradoTwoHundredBreastConversionLCMtoSCY];
                    [self coloradoTwoHundredBreastConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==3){
                    //free
                    [self coloradoTwoHundredFreeConversionLCMtoSCY];
                    [self coloradoTwoHundredFreeConversionLCMtoSCM];
                    self.output1.text=convertSCY;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoTwoHundredIMConversionLCMtoSCY];
                    [self coloradoTwoHundredIMConversionLCMtoSCM];
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
                    [self coloradoFiveHundredFreeConversionLCMtoSCY];
                    [self coloradoFourHundredFreeConversionLCMtoSCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoFourHundredIMConversionLCMtoSCY];
                    [self coloradoFourHundredIMConversionLCMtoSCM];
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
                    [self coloradoFiveHundredFreeConversionLCMtoSCY];
                    [self coloradoFourHundredFreeConversionLCMtoSCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertSCM;
                }
                else if (strokeType==4){
                    //IM
                    [self coloradoFourHundredIMConversionLCMtoSCY];
                    [self coloradoFourHundredIMConversionLCMtoSCM];
                    self.output1.text=convertSCM;
                    self.output2.text=convertSCM;
                }
            }
        }
    }
    else if(segmentedTypeValue==1){
        //if NISCA is selected
        
    }
}


-(IBAction)dismissKeyboard:(id)sender{
    [sender resignFirstResponder];      //You need a method that allows the user to dismiss the keyboard by tapping
                                        //anywhere on the screen if you're using a decimal keypad. Not required if you're going to use a standard qwerty keyboard. I think the former makes more sense.
}
- (IBAction)courseSegmentedAction:(id)sender {
    //based on what the user selects, sets an int to be used in another method
    if (_courseSegmentedControl.selectedSegmentIndex==0) {
        //if selected on SCY
        segmentedCourseValue=0;
    }
    else if (_courseSegmentedControl.selectedSegmentIndex==1){
        //if selected on SCM
        segmentedCourseValue=1;
    }
    else if (_courseSegmentedControl.selectedSegmentIndex==2){
        //if selected on LCM
        segmentedCourseValue=2;
    }
}
- (IBAction)typeSegmentedAction:(id)sender {
    //based on what the user enters, runs USA conversions or NISCA
    if (_typeSegmentedControl.selectedSegmentIndex==0) {
        segmentedTypeValue=0;
    }
    else if (_typeSegmentedControl.selectedSegmentIndex==1){
        segmentedTypeValue=1;
    }
}
- (IBAction)genderSegmentedAction:(id)sender {
    if (_genderSegmentedControl.selectedSegmentIndex==0) {
        segmentedGenderValue=0;
    }
    else if (_genderSegmentedControl.selectedSegmentIndex==1){
        segmentedGenderValue=1;
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
-(NSString *)coloradoFiftyFlyConversionSCYtoSCM{
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
-(NSString *)coloradoHundredFlyConversionSCYtoSCM{
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
-(NSString *)coloradoTwoHundredFlyConversionSCYtoSCM{
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
-(NSString *)coloradoFiftyBackConversionSCYtoSCM{
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
-(NSString *)coloradoHundredBackConversionSCYtoSCM{
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
-(NSString *)coloradoTwoHundredBackConversionSCYtoSCM{
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
-(NSString *)coloradoFiftyBreastConversionSCYtoSCM{
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
-(NSString *)coloradoHundredBreastConversionSCYtoSCM{
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
-(NSString *)coloradoTwoHundredBreastConversionSCYtoSCM{
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
-(NSString *)coloradoFiftyFreeConversionSCYtoSCM{
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
-(NSString *)coloradoHundredFreeConversionSCYtoSCM{
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
-(NSString *)coloradoTwoHundredFreeConversionSCYtoSCM{
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
-(NSString *)coloradoFiveHundredFreeConversionSCYtoSCM{
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
-(NSString *)coloradoHundredIMConversionSCYtoSCM{
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
-(NSString *)coloradoTwoHundredIMConversionSCYtoSCM{
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
-(NSString *)coloradoFourHundredIMConversionSCYtoSCM{
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
-(NSString *)coloradoFiftyFlyConversionSCYtoLCM{
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
-(NSString *)coloradoHundredFlyConversionSCYtoLCM{
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
-(NSString *)coloradoTwoHundredFlyConversionSCYtoLCM{
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
-(NSString *)coloradoFiftyBackConversionSCYtoLCM{
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
-(NSString *)coloradoHundredBackConversionSCYtoLCM{
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
-(NSString *)coloradoTwoHundredBackConversionSCYtoLCM{
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
-(NSString*)coloradoFiftyBreastConversionSCYtoLCM{
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
-(NSString *)coloradoHundredBreastConversionSCYtoLCM{
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
-(NSString *)coloradoTwoHundredBreastConversionSCYtoLCM{
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
-(NSString *)coloradoFiftyFreeConversionSCYtoLCM{
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
-(NSString *)coloradoHundredFreeConversionSCYtoLCM{
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
-(NSString *)coloradoTwoHundredFreeConversionSCYtoLCM{
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
-(NSString *)coloradoFiveHundredFreeConversionSCYtoLCM{
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
-(NSString *)coloradoHundredIMConversionSCYtoLCM{
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
-(NSString *)coloradoTwoHundredIMConversionSCYtoLCM{
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
-(NSString *)coloradoFourHundredIMConversionSCYtoLCM{
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
-(NSString *)coloradoConversionSCMtoSCY{
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
-(NSString *)coloradoFiftyFlyConversionSCMtoLCM{
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
-(NSString *)coloradoTwoHundredFlyConversionSCMtoLCM{
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
-(NSString *)coloradoFiftyBackConversionSCMtoLCM{
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
-(NSString *)coloradoHundredBackConversionSCMtoLCM{
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
-(NSString *)coloradoTwoHundredBackConversionSCMtoLCM{
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
-(NSString *)coloradoFiftyBreastConversionSCMtoLCM{
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
-(NSString *)coloradoHundredBreastConversionSCMtoLCM{
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
-(NSString *)coloradoTwoHundredBreastConversionSCMtoLCM{
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
-(NSString *)coloradoFiftyFreeConversionSCMtoLCM{
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
-(NSString *)coloradoHundredFreeConversionSCMtoLCM{
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
-(NSString *)coloradoTwoHundredFreeConversionSCMtoLCM{
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
-(NSString *)coloradoFourHundredFreeConversionSCMtoLCM{
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
-(NSString *)coloradoHundredIMConversionSCMtoLCM{
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
-(NSString *)coloradoTwoHundredIMConversionSCMtoLCM{
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
-(NSString *)coloradoFourHundredIMConversionSCMtoLCM{
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
-(NSString *)coloradoFiftyFlyConversionLCMtoSCM{
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
-(NSString *)coloradoHundredFlyConversionLCMtoSCM{
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
-(NSString *)coloradoTwoHundredFlyConversionLCMtoSCM{
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
-(NSString *)coloradoFiftyBackConversionLCMtoSCM{
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
-(NSString *)coloradoHundredBackConversionLCMtoSCM{
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
-(NSString *)coloradoTwoHundredBackConversionLCMtoSCM{
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
-(NSString *)coloradoFiftyBreastConversionLCMtoSCM{
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
-(NSString *)coloradoHundredBreastConversionLCMtoSCM{
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
-(NSString *)coloradoTwoHundredBreastConversionLCMtoSCM{
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
-(NSString *)coloradoFiftyFreeConversionLCMtoSCM{
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
-(NSString *)coloradoHundredFreeConversionLCMtoSCM{
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
-(NSString *)coloradoTwoHundredFreeConversionLCMtoSCM{
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
-(NSString *)coloradoFourHundredFreeConversionLCMtoSCM{
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
-(NSString *)coloradoHundredIMConversionLCMtoSCM{
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
-(NSString *)coloradoTwoHundredIMConversionLCMtoSCM{
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
-(NSString *)coloradoFourHundredIMConversionLCMtoSCM{
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
-(NSString *)coloradoFiftyFlyConversionLCMtoSCY{
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
-(NSString *)coloradoHundredFlyConversionLCMtoSCY{
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
-(NSString *)coloradoTwoHundredFlyConversionLCMtoSCY{
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
-(NSString *)coloradoFiftyBackConversionLCMtoSCY{
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
-(NSString *)coloradoHundredBackConversionLCMtoSCY{
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
-(NSString *)coloradoTwoHundredBackConversionLCMtoSCY{
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
-(NSString *)coloradoFiftyBreastConversionLCMtoSCY{
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
-(NSString *)coloradoHundredBreastConversionLCMtoSCY{
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
-(NSString *)coloradoTwoHundredBreastConversionLCMtoSCY{
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
-(NSString *)coloradoFiftyFreeConversionLCMtoSCY{
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
-(NSString *)coloradoHundredFreeConversionLCMtoSCY{
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
-(NSString *)coloradoTwoHundredFreeConversionLCMtoSCY{
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
-(NSString *)coloradoFiveHundredFreeConversionLCMtoSCY{
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
-(NSString *)coloradoHundredIMConversionLCMtoSCY{
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
-(NSString *)coloradoTwoHundredIMConversionLCMtoSCY{
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
-(NSString *)coloradoFourHundredIMConversionLCMtoSCY{
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




- (IBAction)show:(id)sender {
}

- (IBAction)hide:(id)sender {
}
@end