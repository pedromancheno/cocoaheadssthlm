//
//  AppDelegate.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "AppDelegate.h"

#import "PhoneToWatchConnectivityController.h"

@interface AppDelegate ()

@property (strong, nonatomic) PhoneToWatchConnectivityController *connectivityController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.connectivityController = [[PhoneToWatchConnectivityController alloc] init];
    
    return YES;
}

@end
