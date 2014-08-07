//
//  PostMethodTestViewController.h
//  PostMethodTest
//
//  Created by on 04/07/11.
//  Copyright 2011 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostMethodTestViewController : UIViewController {
 
    IBOutlet UITextField *ipAddress;
    IBOutlet UIActivityIndicatorView *activity;
    
    NSMutableData *webData;
    NSMutableString *result;
    NSURLConnection *conn;
}

@property (nonatomic, retain) UITextField *ipAddress;
@property (nonatomic, retain) UIActivityIndicatorView *activity;

- (IBAction)buttonClicked:(id)sender;

@end
