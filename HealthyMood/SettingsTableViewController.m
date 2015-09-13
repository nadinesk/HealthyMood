//
//  SettingsTableViewController.m
//  HealthyMood
//
//  Created by Nadine Khattak on 9/10/15.
//  Copyright (c) 2015 Ensach. All rights reserved.
//

#import "SettingsTableViewController.h"
#import <CoreData/CoreData.h>
#import "Weight.h"
#import "AppDelegate.h"


@interface SettingsTableViewController ()
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;



@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kgCell.textLabel.text = @"kg";
    self.lbCell.textLabel.text = @"lb";
    self.stCell.textLabel.text = @"st";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 3;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    self.kgCell.accessoryType = UITableViewCellAccessoryNone;
    self.lbCell.accessoryType = UITableViewCellAccessoryNone;
    self.stCell.accessoryType = UITableViewCellAccessoryNone;
    
    if (cell.accessoryType == UITableViewCellAccessoryNone)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
 
 
    
   
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}


- (IBAction)save:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (self.kgCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        [defaults setObject:@"kg" forKey:@"unit"];
    } else if (self.lbCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        [defaults setObject:@"lb" forKey:@"unit"];
    } else if (self.stCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        [defaults setObject:@"st" forKey:@"unit"];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Fetch Record
    
    UITableViewCell *kg = self.kgCell;
    UITableViewCell *lb = self.lbCell;
    UITableViewCell *st = self.stCell;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([[defaults objectForKey:@"unit"]  isEqual: @"kg"]) {
        kg.accessoryType = UITableViewCellAccessoryCheckmark;
        lb.accessoryType = UITableViewCellAccessoryNone;
        st.accessoryType = UITableViewCellAccessoryNone;
    }
    else if ([[defaults objectForKey:@"unit"]  isEqual: @"st"]) {
        st.accessoryType = UITableViewCellAccessoryCheckmark;
        kg.accessoryType = UITableViewCellAccessoryNone;
        lb.accessoryType = UITableViewCellAccessoryNone;
    }
    else if ([[defaults objectForKey:@"unit"]  isEqual: @"lb"])  {
        lb.accessoryType = UITableViewCellAccessoryCheckmark;
        kg.accessoryType = UITableViewCellAccessoryNone;
        st.accessoryType = UITableViewCellAccessoryNone;
    }
   
    
}

/*
- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {



    
    
}
 
 */


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
