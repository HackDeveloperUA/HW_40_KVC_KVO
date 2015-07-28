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
        
    [self addObserver:self forKeyPath:@"currentStudent"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:nil];
    
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Observer

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSLog(@"\n\n\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    
}


- (void) addPropertyToObserver:(id)sender forKeyPath:(NSString *)keyPath {
    
    [sender addObserver:self
             forKeyPath:keyPath
                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                context:NULL];
    
}

- (void) removePropertyToObserver:(id)sender forKeyPath:(NSString *)keyPath
{
    [sender removeObserver:self forKeyPath:keyPath];
}



-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"Пошел нахуй");
}




#pragma mark - Method For Bar Button

-(void) refreshTableViewFromArray:(NSMutableArray*)array{
    
    int randomNumber = arc4random()%[array count];

    ASStudent* obj   = [array objectAtIndex:randomNumber];
    
    self.firstNameField.text = [obj valueForKey:@"firstName"];
    self.lastNameField.text  = [obj valueForKey:@"lastName"];

   
    self.genderSegment.selectedSegmentIndex = [[obj valueForKey:@"gender"]intValue];
    self.dateOfBirthLabel.text              = [obj valueForKey:@"dateOfBirth"];
    self.gradeLabel.text                    = [NSString stringWithFormat:@"%.2f",[[obj valueForKey:@"grade"] floatValue]];
    
   self.currentStudent = obj;
}


-(void) refreshTableViewFromObject:(ASStudent*)student{
    
    self.firstNameField.text = [student valueForKey:@"firstName"];
    self.lastNameField.text  = [student valueForKey:@"lastName"];
    
    
    self.genderSegment.selectedSegmentIndex = [[student valueForKey:@"gender"]intValue];
    self.dateOfBirthLabel.text              = [student valueForKey:@"dateOfBirth"];
    self.gradeLabel.text                    = [NSString stringWithFormat:@"%.2f",[[student valueForKey:@"grade"] floatValue]];
    
}



#pragma mark - Action


- (IBAction)firstNameFieldAction:(UITextField*)sender {
    
    [self addPropertyToObserver:self.currentStudent forKeyPath:@"firstName"];
     _currentStudent.firstName = sender.text;
    [self removePropertyToObserver:self.currentStudent forKeyPath:@"firstName"];
    
}



- (IBAction)lastNameFieldAction:(UITextField*)sender {
    
    [self addPropertyToObserver:self.currentStudent forKeyPath:@"lastName"];
    _currentStudent.lastName = sender.text;
    [self removePropertyToObserver:self.currentStudent forKeyPath:@"lastName"];


}

- (IBAction)genderSegmentAction:(UISegmentedControl*)sender {
    
    [self addPropertyToObserver:self.currentStudent forKeyPath:@"gender"];
    _currentStudent.gender = sender.selectedSegmentIndex;
    [self removePropertyToObserver:self.currentStudent forKeyPath:@"gender"];


}

#pragma mark - Action Bar Button


- (IBAction)refreshBarButtonAction:(id)sender {
    [self refreshTableViewFromArray:self.arrayStudents];

}

- (IBAction)removeAllProperty:(id)sender {

    [self.currentStudent removeHardCoreProperty];
    [self refreshTableViewFromObject:self.currentStudent];
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
