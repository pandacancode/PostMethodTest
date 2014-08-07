//
//  PostMethodTestViewController.m
//  PostMethodTest
//
//  Created by on 04/07/11.
//  Copyright 2011 All rights reserved.
//

#import "PostMethodTestViewController.h"

@implementation PostMethodTestViewController

@synthesize ipAddress;
@synthesize activity;

- (void)dealloc
{
    [ipAddress release];
    [activity release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

// ------------------- Connection specific functions ------------------------- //

- (IBAction)buttonClicked:(id)sender 
{
    NSString *postString = [NSString stringWithFormat:
                            @"<OX><MESSAGEHEAD>"
                            "<CLIENTVERSION></CLIENTVERSION><PLATFORM></PLATFORM>"
                            "<LANGUAGE></LANGUAGE><TIMESTAMP>2011-07-05+14:07:54</TIMESTAMP>"
                            "<MOBILENO></MOBILENO><IPADDRESS>NULL</IPADDRESS>"
                            "<USERNAME></USERNAME><PASSWORD>1234</PASSWORD>"
                            "</MESSAGEHEAD></OX>"];
    
    NSLog(@"The POST body - %@",postString);
    
    NSURL *url = [NSURL URLWithString:@"http://www.xyz.com/"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d",[postString length]];
    
    [req addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [activity startAnimating];
    
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if(conn){
        webData = [[NSMutableData data] retain];
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [webData setLength:0];
}
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [webData appendData:data];
}
- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [webData release];
    [connection release];
}
- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"Done.. Recieved Bytes: %d",[webData length]);
    NSString *theXml = [[NSString alloc]
                        initWithBytes:[webData mutableBytes] 
                        length:[webData length] 
                        encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",theXml);
    [theXml release];
    [activity stopAnimating];
    [connection release];
    [webData release];
}
                        
// ------------------- Connection specific functions end ------------------------- //

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
