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
        
        // Вешаем все на KVO
        
        
        /*
        [self addObserver:self forKeyPath:@"firstName"
                  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                  context:nil];
        [self addObserver:self forKeyPath:@"lastName"
                  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                  context:nil];
        [self addObserver:self forKeyPath:@"gender"
                  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                  context:nil];

        */
        
    }
   
    
    
   return self;
}



#pragma mark - Setters

/*
-(void) setFirstName:(NSString *)firstName {
    
    _firstName = firstName;
    NSLog(@"Student setFirstName: %@", firstName);

}

-(void) setLastName:(NSString *)lastName {
    
    _lastName = lastName;
    NSLog(@"Student setLastName: %@", lastName);

}


-(void) setGender:(NSInteger)gender {
    
    _gender = gender;
    NSLog(@"Student setGender: %d", gender);
}
*/


- (NSString*) description {
    return [NSString stringWithFormat:@"Student: %@ %@", self.firstName, self.lastName];
}



- (void) setValue:(id)value forKey:(NSString *)key {
    
    NSLog(@"Student setValue:%@ forKey:%@", value, key);
    
    [super setValue:value forKey:key];
}



- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"setValueForUndefinedKey");
}

- (id) valueForUndefinedKey:(NSString *)key {
    NSLog(@"valueForUndefinedKey");
    return nil;
}

- (void) changeName {
    
   // [self willChangeValueForKey:@"name"];
   // _name = @"FakeName";
   //[self didChangeValueForKey:@"name"];
}

-(void) removeHardCoreProperty {
    
    
    [self willChangeValueForKey:@"firstName"];
    [self willChangeValueForKey:@"lastName"];
    [self willChangeValueForKey:@"dateOfBirth"];
    [self willChangeValueForKey:@"gender"];
    [self willChangeValueForKey:@"grade"];

    _firstName   = @"nil";
    _lastName    = @"nil";
    _dateOfBirth = @"nil";
    _gender      = -0;
    _grade       = -0;

    
    [self didChangeValueForKey:@"firstName"];
    [self didChangeValueForKey:@"lastName"];
    [self didChangeValueForKey:@"dateOfBirth"];
    [self didChangeValueForKey:@"gender"];
    [self didChangeValueForKey:@"grade"];

    
}

@end
