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
        [WCSession defaultSession].delegate = self;
        [[WCSession defaultSession] activateSession];
    }
    
    return self;
}

- (void)updateApplicationColorData:(NSData *)colorData error:(NSError **)error
{
    if (colorData) {
        [[WCSession defaultSession] updateApplicationContext:@{@"appColorData" : colorData}
                                                       error:error];
    }
}

-   (void)session:(WCSession *)session
didReceiveMessage:(NSDictionary<NSString *,id> *)message
     replyHandler:(MessageReplyHandler)replyHandler
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:PhoneToWatchConnectivityControllerDidReceiveEmoji
                                                            object:message[@"emoji"]];
        
        if (replyHandler) {
            replyHandler(@{@"response" : @YES});
        }
    });
}

@end
