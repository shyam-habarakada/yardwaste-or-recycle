//
//  YORFlipsideViewController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORFlipsideViewController.h"

@interface YORFlipsideViewController ()

@end

@implementation YORFlipsideViewController {
    YORSettingsTableViewController *settingsTableViewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        settingsTableViewController = [[YORSettingsTableViewController alloc] init];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = settingsTableViewController;
    self.tableView.delegate = settingsTableViewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
