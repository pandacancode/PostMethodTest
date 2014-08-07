//
//  PostMethodTestAppDelegate.h
//  PostMethodTest
//
//  Created by on 04/07/11.
//  Copyright 2011 All rights reserved.
//

#import <UIKit/UIKit.h>

@class PostMethodTestViewController;

@interface PostMethodTestAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PostMethodTestViewController *viewController;

@end
