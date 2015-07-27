//
//  TableViewController.m
//  HW_40_KVC_KVO
//
//  Created by MD on 26.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "TableViewController.h"
#import "ASStudent.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray* arrayStudents;
@property (strong, nonatomic) ASStudent* currentStudent;

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* tmp = [[NSMutableArray alloc] init];
    
    for (int i=0; i<10; i++) {
        ASStudent* student = [[ASStudent alloc] init];
        [tmp addObject:student];
    }
    
    self.arrayStudents = tmp;
    [self refreshTableView:self.arrayStudents];
    
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Refresh

-(void) refreshTableView:(NSMutableArray*)array{
    
    int randomNumber = arc4random()%[array count];
    NSLog(@"x = %d | %d",randomNumber, [array count]);
    ASStudent* obj   = [array objectAtIndex:randomNumber];
    
    self.firstNameField.text = [obj valueForKey:@"firstName"];
    self.lastNameField.text  = [obj valueForKey:@"lastName"];

   
    self.genderSegment.selectedSegmentIndex = [[obj valueForKey:@"gender"]intValue];
    self.dateOfBirthLabel.text              = [obj valueForKey:@"dateOfBirth"];
    self.gradeLabel.text                    = [NSString stringWithFormat:@"%.2f",[[obj valueForKey:@"grade"] floatValue]];
    
    self.currentStudent = obj;
}


-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"Пошел нахуй");
}

#pragma mark - Action


- (IBAction)firstNameFieldAction:(UITextField*)sender {
    
    [self.currentStudent setValue:sender.text forKey:@"firstName"];
    
}


- (IBAction)lastNameFieldAction:(UITextField*)sender {
    [self.currentStudent setValue:sender.text forKey:@"lastName"];

}

- (IBAction)genderSegmentAction:(UISegmentedControl*)sender {
    [self.currentStudent setValue:@(sender.selectedSegmentIndex) forKey:@"gender"];

}

- (IBAction)refreshBarButtonAction:(id)sender {
    [self refreshTableView:self.arrayStudents];
    //[self.tableView reloadData];

}

#pragma mark - Hide Keyboard Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}



#pragma mark - Hide Keyboard Methods


-(void) handleTap:(UITapGestureRecognizer*) tap {
    
    if ([self.firstNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    } else {
         [self.lastNameField resignFirstResponder];
    }
}



@end
