//
//  WatchToPhoneConnectivityController.h
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^EmojiSentCompletion)(BOOL success, NSError *error);

@interface WatchToPhoneConnectivityController : NSObject

- (void)sendEmoji:(NSString *)emoji
       completion:(EmojiSentCompletion)completion;

@end
