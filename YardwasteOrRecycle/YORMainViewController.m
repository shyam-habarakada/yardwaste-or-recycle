//
//  YORMainViewController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORMainViewController.h"

@interface YORMainViewController ()

@end

@implementation YORMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(YORFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    YORFlipsideViewController *controller = [[YORFlipsideViewController alloc] initWithNibName:@"YORFlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
