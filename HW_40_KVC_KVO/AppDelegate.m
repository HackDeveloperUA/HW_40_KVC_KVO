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

    NSMutableArray* tmp = [[NSMutableArray alloc] init];

    
    NSInteger randomIndex = arc4random() % 5;
    
    // create student
    for (int i=0; i<=10; i++) {
        ASStudent* student = [[ASStudent alloc] init];
        [tmp addObject:student];
       
        if (i == randomIndex) {
            [student addObserver:self forKeyPath:@"firstName"
                         options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                         context:nil];
            
            NSLog(@"Я тот избранный ! %@",[student description]);
        }
    }


    NSLog(@"\n\n\n -------ОБЩИЙ СПИСОК СТУДЕНТОВ--------  \n");
    [self printAllStudents:tmp];
    NSLog(@" -----------------------------  \n\n\n");
    
    
    
    
    // add friends
    NSLog(@" ----------ДОБАВЛЯЕМ ДРУЗЕЙ--------- \n");
    for (ASStudent* obj in tmp) {
        
        NSInteger index = [tmp indexOfObject:obj];
        
        if (index != [tmp count]-1) {
            
            ASStudent* himFriend = [tmp objectAtIndex:index+1];
            [obj setValue:himFriend forKeyPath:@"friend"];
        } else {
            ASStudent* himFriend = [tmp firstObject];
            [obj setValue:himFriend forKeyPath:@"friend"];
        }
    }
    NSLog(@" -----------------------------  \n\n\n");

    
    
    
    
    
    
    NSLog(@"Я избранный MyName = %@  Friend Name = %@",[[tmp objectAtIndex:randomIndex]firstName],
                                                       [[tmp objectAtIndex:randomIndex] valueForKeyPath:@"friend.firstName"]);
    
    NSLog(@"\n -----------------------------  \n\n\n");

    
    
    // change name
    NSLog(@"\n\n\n -------МЕНЯЕМ ИМЯ--------  \n");
  
    for (ASStudent* obj in tmp) {
        
        obj.firstName = @"Any Name";
        [obj setValue:@" Any Friend Name !" forKeyPath:@"friend.firstName"];
    }
    
    
    NSLog(@"\n\n\n -------ОБЩИЙ СПИСОК СТУДЕНТОВ--------  \n");
    [self printAllStudents:tmp];
    
    [[tmp objectAtIndex:randomIndex] removeObserver:self forKeyPath:@"firstName"];

    return YES;
}

-(void) printAllStudents:(NSArray*) array {
    
    for (ASStudent* obj in array) {
        NSLog(@"%@",[obj description]);
    }
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSLog(@"\n\n\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    
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
