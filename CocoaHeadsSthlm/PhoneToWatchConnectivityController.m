//
//  PhoneToWatchConnectivityController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "PhoneToWatchConnectivityController.h"

#import "AppDelegate.h"

#import <WatchConnectivity/WatchConnectivity.h>

typedef void(^MessageReplyHandler)(NSDictionary<NSString *,id> * _Nonnull);

@interface PhoneToWatchConnectivityController () <WCSessionDelegate>

@end

@implementation PhoneToWatchConnectivityController

- (instancetype)init
{
    if (self = [super init]) {
        // Implement!
    }
    
    return self;
}

- (void)updateApplicationColorData:(NSData *)colorData error:(NSError **)error
{
    // Implement!
}

// Implement didReceiveMessage Delegate method!

@end
