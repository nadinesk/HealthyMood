//
//  WeighEntryTypeTableViewController.h
//  HealthyMood
//
//  Created by Nadine Khattak on 11/9/15.
//  Copyright © 2015 Ensach. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAuth1Controller.h"


@interface WeighEntryTypeTableViewController : UITableViewController
{
    NSString *userId;
    NSString *date;

}
@property (weak, nonatomic) IBOutlet UITableViewCell *autoWeightEntrySelection;

@property (weak, nonatomic) IBOutlet UITableViewCell *manualWeightCell;
@property (weak, nonatomic) IBOutlet UISwitch *authSwitch;

@property (weak, nonatomic) IBOutlet UITableViewCell *authorizeCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *logoutCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *viewWeightInfo;
@property (weak, nonatomic) IBOutlet UILabel *accessTokenLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessTokenSecretLabel;
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;
@property (weak, nonatomic) IBOutlet UIButton *authorizeWithingsButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutWithingsButton;

@end
