//
//  TableViewController.h
//  HW_40_KVC_KVO
//
//  Created by MD on 26.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;


#pragma mark - Action

- (IBAction)firstNameFieldAction:(UITextField*)sender;
- (IBAction)lastNameFieldAction:(UITextField*)sender;
- (IBAction)genderSegmentAction:(UISegmentedControl*)sender;

- (IBAction)refreshBarButtonAction:(id)sender;
- (IBAction)removeAllProperty:(id)sender;

@end
