//
//  WatchToPhoneConnectivityController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "WatchToPhoneConnectivityController.h"

#import <WatchConnectivity/WatchConnectivity.h>

#import "ExtensionDelegate.h"

@interface WatchToPhoneConnectivityController () <WCSessionDelegate>

@end

@implementation WatchToPhoneConnectivityController

- (instancetype)init
{
    if ([super init]) {
        // Implement!
    }
    
    return self;
}

- (void)sendEmoji:(NSString *)emoji
completion:(EmojiSentCompletion)completion
{
    // Implement
}

// Implement didReceiveApplicationContext: delegate method

@end
