//
//  YORMainViewController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORFlipsideViewController.h"
#import "YORDataController.h"

@interface YORMainViewController : UIViewController <YORFlipsideViewControllerDelegate>

@property (strong, nonatomic) YORDataController *data;

@property (retain) IBOutlet UILabel *nextCollectionDateLabel;
@property (retain) IBOutlet UILabel *yardwasteOrRecycleLabel;

- (IBAction)showInfo:(id)sender;

@end
