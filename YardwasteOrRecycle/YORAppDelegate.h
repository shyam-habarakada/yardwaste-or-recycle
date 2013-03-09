//
//  YORAppDelegate.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YORDataController.h"

@class YORMainViewController;

@interface YORAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) YORDataController *data;

- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) YORMainViewController *mainViewController;

@end
