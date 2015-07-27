//
//  ASStudent.m
//  HW_40_KVC_KVO
//
//  Created by MD on 26.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "ASStudent.h"
#import "ASNameFamalyAndImage.h"

@implementation ASStudent

-(instancetype) init {
    
    
    self = [super init];
    
    if (self) {
        
        ASNameFamalyAndImage* baseInitials = [[ASNameFamalyAndImage alloc] init];
        
        
        NSDate           *now       = [NSDate date];
        NSCalendar       *calendar  = [NSCalendar currentCalendar];
        NSDateComponents *comps     = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
        [comps setYear:[comps year]-((arc4random()%(60-18))+18)];
        [comps setMonth:arc4random()%12];
        [comps setDay:arc4random()%31];
        
        
        
        NSDate *date = [calendar dateFromComponents:comps];
        NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        
        [comps setDay:arc4random()%days.length];
        
        self.firstName   = [[baseInitials valueForKey:@"arrayNames"]objectAtIndex:arc4random()%(NSInteger)[baseInitials.arrayNames count]];
        self.lastName    = [[baseInitials valueForKey:@"arrayFamaly"]objectAtIndex:arc4random()%(NSInteger)[baseInitials.arrayFamaly count]];
       
        self.dateOfBirth = [dateFormatter stringFromDate:date];
        self.gender      = (arc4random()%1000)%2;
        self.grade       = arc4random()%10;
        
        baseInitials = nil;
    }
   
    
    
   return self;
}

@end
