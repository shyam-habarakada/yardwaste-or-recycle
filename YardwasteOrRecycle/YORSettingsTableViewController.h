//
//  YORSettingsTableViewController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/24/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YORSettingsTableViewController;

@protocol YORSettingsTableViewControllerDelegate
- (void)settingsViewControllerDidFinish:(YORSettingsTableViewController *)controller;
@end

@interface YORSettingsTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <YORSettingsTableViewControllerDelegate> viewDidFinishDelegate;

- (IBAction)done:(id)sender;

@end
