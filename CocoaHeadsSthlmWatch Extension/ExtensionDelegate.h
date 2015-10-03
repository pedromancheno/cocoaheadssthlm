//
//  ExtensionDelegate.h
//  CocoaHeadsSthlmWatch Extension
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@class WatchToPhoneConnectivityController;

@interface ExtensionDelegate : NSObject <WKExtensionDelegate>

@property (readonly, nonatomic) WatchToPhoneConnectivityController *connectivityController;

@end
