//
//  WatchToPhoneConnectivityController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "WatchToPhoneConnectivityController.h"

#import <WatchConnectivity/WatchConnectivity.h>

@interface WatchToPhoneConnectivityController () <WCSessionDelegate>

@end

@implementation WatchToPhoneConnectivityController

- (instancetype)init
{
    if ([super init]) {
        [WCSession defaultSession].delegate = self;
        [[WCSession defaultSession] activateSession];
    }
    
    return self;
}

- (void)sendEmoji:(NSString *)emoji
completion:(EmojiSentCompletion)completion
{
    if (emoji) {
        [[WCSession defaultSession]
         sendMessage:@{@"emoji" : emoji}
         replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
             
             if ([replyMessage[@"response"] boolValue]) {
                 if (completion) {
                     completion(YES, nil);
                 }
             } else {
                 NSError *unknownError = [NSError errorWithDomain:@"CocoaHedsSthlm"
                                                             code:-1111
                                                         userInfo:nil];
                 if (completion) {
                     completion(NO, unknownError);
                 }
             }
             
         } errorHandler:^(NSError * _Nonnull error) {
             if (completion) {
                 completion(NO, error);
             }
         }];
    }
    // Implement!
}

@end
