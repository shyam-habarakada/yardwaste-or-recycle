//
//  YORMainViewController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface YORMainViewController : UIViewController <YORFlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)showInfo:(id)sender;

@end
