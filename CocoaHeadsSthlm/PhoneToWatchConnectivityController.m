//
//  PhoneToWatchConnectivityController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "PhoneToWatchConnectivityController.h"

#import <WatchConnectivity/WatchConnectivity.h>

typedef void(^MessageReplyHandler)(NSDictionary<NSString *,id> * _Nonnull);

@interface PhoneToWatchConnectivityController () <WCSessionDelegate>

@end

@implementation PhoneToWatchConnectivityController

- (instancetype)init
{
    if (self = [super init]) {
        [WCSession defaultSession].delegate = self;
        [[WCSession defaultSession] activateSession];
    }
    
    return self;
}

- (void)updateApplicationColor:(UIColor *)color
{

}

-   (void)session:(WCSession *)session
didReceiveMessage:(NSDictionary<NSString *,id> *)message
     replyHandler:(MessageReplyHandler)replyHandler
{
    [[NSUserDefaults standardUserDefaults] setObject:message[@"emoji"]
                                              forKey:@"emoji"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
