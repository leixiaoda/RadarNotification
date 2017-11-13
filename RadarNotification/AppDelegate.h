//
//  AppDelegate.h
//  RadarNotification
//
//  Created by dalei on 2017/9/21.
//  Copyright © 2017年 dalei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <PushKit/PushKit.h>
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_9_3
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

