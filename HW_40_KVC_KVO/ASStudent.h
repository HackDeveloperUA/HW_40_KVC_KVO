//
//  ASStudent.h
//  HW_40_KVC_KVO
//
//  Created by MD on 26.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASStudent : NSObject


@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;

@property (strong,nonatomic)  NSString*   dateOfBirth;

@property (assign, nonatomic) NSInteger gender;
@property (assign, nonatomic) float     grade;

-(void) removeHardCoreProperty;

@end
