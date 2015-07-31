//
//  AppDelegate.m
//  HW_40_KVC_KVO
//
//  Created by MD on 26.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "AppDelegate.h"
#import "ASStudent.h"
#import "ASNameFamalyAndImage.h"


@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray* arrayStudents;
@property (strong, nonatomic) ASStudent* currentStudent;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSMutableArray* allStudents = [[NSMutableArray alloc] init];

    
    
    // create student
    for (int i=0; i<=15; i++) {
        ASStudent* student = [[ASStudent alloc] init];
        [allStudents addObject:student];
       
    }

    NSMutableArray* arrayNames = [allStudents valueForKeyPath:@"@distinctUnionOfObjects.firstName"];
    NSNumber* minAge = [allStudents valueForKeyPath:@"@min.dateOfBirth"];
    NSNumber* maxAge = [allStudents valueForKeyPath:@"@max.dateOfBirth"];

    NSNumber* sumAllGrade  = [allStudents valueForKeyPath:@"@max.grade"];
    NSNumber* averageGrade = [allStudents valueForKeyPath:@"@avg.grade"];
    
    NSLog(@"Array Names = %@",arrayNames);
    
    NSLog(@"minAge = %@",minAge);
    NSLog(@"maxAge = %@",maxAge);

    NSLog(@"sumAllGrade = %@",sumAllGrade);
    NSLog(@"averageGrade = %@",averageGrade);


    return YES;
}

-(void) printAllStudents:(NSArray*) array {
    
    for (ASStudent* obj in array) {
        NSLog(@"%@",[obj description]);
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
