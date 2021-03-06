//
//  YORFlipsideViewController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YORFlipsideViewController;

@protocol YORFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(YORFlipsideViewController *)controller;
@end

@interface YORFlipsideViewController : UIViewController

@property (weak, nonatomic) id <YORFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
