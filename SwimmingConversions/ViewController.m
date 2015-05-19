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

NSArray *_pickerData; //could divide this up into two arrays of raceTimes and raceStyles
NSString *convert;

double fullTime;
double doubleSeconds;
double doubleMinutes;
double doubleMiliseconds;
double convertedTime;



- (void)viewDidLoad
{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
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
            if(component==0){
                [self fiftyFlyConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==1){
                [self fiftyBackConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==2){
                [self fiftyBreastConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==3){
                [self fiftyFreeConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            break;
        case 1:
            if(component==0){
                [self hundredFlyConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==1){
                [self hundredBackConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==2){
                [self hundredBreastConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==3){
                [self hundredFreeConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            break;
        case 2:
            if(component==0){
                [self twoHundredFlyConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==1){
                [self twoHundredBackConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==2){
                [self twoHundredBreastConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            else if (component==3){
                [self twoHundredFreeConversion];
                self.output.text=[NSString stringWithFormat:@"%g", convertedTime];
            }
            break;
        case 4:
            self.output.text=@"Thanks for using our App!";
            break;
            
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

- (IBAction)tweet:(id)sender
{
    
    
    /*
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"I love using this app!"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }*/
    
    
    NSArray *activityItems;
    activityItems = @[self.output.text];
    
    //NSArray *activityActions;
    
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
    
}




-(double)fiftyFlyConversion
{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    
    convertedTime=(fullTime*1.11+.7);
    return convertedTime;
};
-(double)hundredFlyConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;
    

    convertedTime=fullTime*1.11+1.4;
    return convertedTime;
};
-(double)twoHundredFlyConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+.7;
    return convertedTime;
};
-(double)fiftyBackConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+.6;
    return convertedTime;
};
-(double)hundredBackConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+1.2;
    return convertedTime;
};
-(double)twoHundredBackConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+2.4;
    return convertedTime;
};
-(double)fiftyBreastConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+1;
    return convertedTime;
};
-(double)hundredBreastConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+2;
    return convertedTime;
};
-(double)twoHundredBreastConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+3.2;
    return convertedTime;};
-(double)fiftyFreeConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    
    convertedTime=fullTime*1.11+.8;
    return convertedTime;};

-(double)hundredFreeConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+1.6;
    return convertedTime;
};

-(double)twoHundredFreeConversion{
    doubleMinutes = [self.minutes.text doubleValue];
    doubleSeconds = [self.seconds.text doubleValue]/60;
    doubleMiliseconds = [self.miliseconds.text doubleValue]/100;
    fullTime=doubleMinutes+doubleSeconds+doubleMiliseconds;

    convertedTime=fullTime*1.11+3.2;
    return convertedTime;
};

///////////This was the method needed to properly configure the webView//////////////////////


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showWebView"])
    {
        NSString *url = @"http://www.swimswam.com/news/";
        WebViewController *webVC = [segue destinationViewController];
        webVC.urlString = url; 
    
    }
}

@end




