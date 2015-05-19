//
//  WebViewController.m
//  SwimmingConversions
//
//  Created by Robert Lynch on 4/29/15.
//  Copyright (c) 2015 Robert Lynch Development. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWebRequest];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadWebRequest
{
    NSString *fullURL = @"www.swimswam.com/news/";
    
    NSURL *url = [NSURL URLWithString:fullURL];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:requestObj];
}


-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    [self.activityIndicator startAnimating];
    return YES;
}

-(void) webViewDidFinishLoad: (UIWebView *) webView
{
    [self.activityIndicator stopAnimating];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    [self.activityIndicator stopAnimating];
    NSLog(@"Whoops");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
