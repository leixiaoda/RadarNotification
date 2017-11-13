//
//  ViewController.m
//  RadarNotification
//
//  Created by dalei on 2017/11/2.
//  Copyright © 2017年 dalei. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice-Hardware.h"
#import <UserNotifications/UserNotifications.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UNNotificationAction *actionReply = [UNNotificationAction actionWithIdentifier:@"reply" title:@"Reply" options:UNNotificationActionOptionNone];
    UNNotificationAction *actionCancel = [UNNotificationAction actionWithIdentifier:@"cancel" title:@"Cancel" options:UNNotificationActionOptionNone];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"message" actions:@[actionReply, actionCancel] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
    
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithArray:@[category]]];
    
    [self sendLocalNotifications];
}

- (void)sendLocalNotifications {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Radar's App";
    content.body = @"This is a notification";
    content.badge = @3;
    content.categoryIdentifier = @"message";
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"sampleRequest" content:content trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"heihei");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

