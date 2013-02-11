//
//  SMXViewController.m
//  Sam
//
//  Created by Simon Maddox on 11/02/2013.
//  Copyright (c) 2013 Simon Maddox. All rights reserved.
//

#import "SMXViewController.h"

@interface SMXViewController () <UIWebViewDelegate>
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic) NSInteger networkCounter;
@end

@implementation SMXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.networkCounter = 0;
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://digitalhatproto.appspot.com/"]]];
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (self.networkCounter == 0){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
    
    self.networkCounter++;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.networkCounter--;
    
    if (self.networkCounter == 0){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
}

@end
