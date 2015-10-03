//
//  AppDelegate.h
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhoneToWatchConnectivityController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, nonatomic) PhoneToWatchConnectivityController *connectivityController;

@end

