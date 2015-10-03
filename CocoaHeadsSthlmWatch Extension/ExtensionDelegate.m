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

@end