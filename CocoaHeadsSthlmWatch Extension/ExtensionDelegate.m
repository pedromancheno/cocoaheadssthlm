//
//  ExtensionDelegate.m
//  CocoaHeadsSthlmWatch Extension
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "ExtensionDelegate.h"

#import "WatchToPhoneConnectivityController.h"

@interface ExtensionDelegate ()

@property (strong, nonatomic) WatchToPhoneConnectivityController *connectivityController;

@end

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching
{
    self.connectivityController = [[WatchToPhoneConnectivityController alloc] init];
    
    
}

#pragma mark - Notification Handling

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification
{
    
}

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification withResponseInfo:(NSDictionary *)responseInfo
{
    
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification
{
    
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification withResponseInfo:(NSDictionary *)responseInfo
{
    
}

- (void)didReceiveLocalNotification:(UILocalNotification *)notification
{
    // Called when the user is interacting with your watch app
}

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // Called when the user is interacting with your watch app
}


@end