//
//  YORSettingsTableViewController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/24/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORSettingsTableViewController.h"

@interface YORSettingsTableViewController ()
- (UITableViewCell *)cellForAccountNumberHelp:(UITableView *)tableView;
- (UITableViewCell *)cellForAccountNumber:(UITableView *)tableView;
@end

@implementation YORSettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(toggleEdit)];
        
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSAssert(section == 0, @"settings table should have one section");
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell = [self cellForAccountNumberHelp:tableView];
                    break;
                case 1:
                    cell = [self cellForAccountNumber:tableView];
                    break;
                default:
                    NSAssert(FALSE, @"no such row");
                    break;
            }
            break;
            
        default:
            NSAssert(FALSE, @"no such section");
            break;
    }
    
    NSAssert(cell, @"could not produce a cell");
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSAssert(section == 0, @"settings table should have one section");
    return @"Find the account number in your Seattle Public Utilities bill and type it in for accurate results.";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        UITableViewCell* cell = [self cellForAccountNumberHelp:tableView];
        return cell.contentView.bounds.size.height;
    }
    else
    {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Settings table cell helpers

- (UITableViewCell *)cellForAccountNumberHelp:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"CellForAccountNumberHelp"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YORAccountNumberInfoTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (UITableViewCell *)cellForAccountNumber:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"CellForAccountNumber";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"Account";
        
    UITextField *uitf = [[UITextField alloc] initWithFrame:CGRectMake(160, 0, 180, 25)];
    
    uitf.adjustsFontSizeToFitWidth = YES;
    uitf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    uitf.returnKeyType = UIReturnKeyDone;
    uitf.textColor = [UIColor darkTextColor];
    uitf.backgroundColor = [UIColor clearColor];
    uitf.autocorrectionType = UITextAutocorrectionTypeNo;
    uitf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    uitf.clearsOnBeginEditing = NO;
    uitf.textAlignment = UITextAlignmentRight;
    // uitf.tag = indexPath.row;
    uitf.placeholder = @"2-111111-000000";
    // uitf.text = [textFieldArray objectAtIndex:indexPath.row];
    uitf.delegate = self;
    
    [uitf setEnabled: YES];
    
    cell.accessoryView = uitf;
    
    return cell;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    return YES;
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.viewDidFinishDelegate settingsViewControllerDidFinish:self];
}

@end
