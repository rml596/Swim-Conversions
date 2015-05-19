//
//  WebViewController.h
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/29/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end
