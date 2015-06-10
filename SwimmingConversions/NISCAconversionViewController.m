//
//  NISCAconversionViewController.m
//  SwimmingConversions
//
//  Created by Robert Lynch on 6/9/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "NISCAconversionViewController.h"

@implementation NISCAconversionViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.title=NSLocalizedString(@"NISCA", @"NISCA");
        self.tabBarItem.image=[UIImage imageNamed:@"second"];
    }
    return self;
}
@end
