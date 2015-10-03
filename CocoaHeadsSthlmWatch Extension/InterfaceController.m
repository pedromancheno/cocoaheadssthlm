//
//  InterfaceController.m
//  CocoaHeadsSthlmWatch Extension
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "InterfaceController.h"

#import "ExtensionDelegate.h"
#import "WatchToPhoneConnectivityController.h"

@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *interfacePicker;
@property (strong, nonatomic) NSArray *pickerItems;
@property (weak, nonatomic) WKPickerItem *selectedPickerItem;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *mainGroup;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    NSArray *emojis = @[
                        @"😅",
                        @"😘",
                        @"😎",
                        @"😆",
                        @"😳",
                        @"😪",
                        @"😰"
                        ];
    
    NSMutableArray<WKPickerItem *> *pickerItems = [NSMutableArray array];
    
    for (NSString *emoji in emojis) {
        WKPickerItem *item = [[WKPickerItem alloc] init];
        item.title = emoji;
        
        [pickerItems addObject:item];
    }
    self.pickerItems = [NSArray arrayWithArray:pickerItems];
    [self.interfacePicker setItems:self.pickerItems];
    
    self.selectedPickerItem = self.pickerItems.firstObject;
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"color"];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    self.mainGroup.backgroundColor = color ? : [UIColor blackColor];
}

- (void)willActivate
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appColorDidChange:)
                                                 name:WatchToPhoneConnectivityControllerDidReceiveAppColor
                                               object:nil];
}

- (void)didDeactivate
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)pickerSelected:(NSInteger)value
{
    self.selectedPickerItem = self.pickerItems[value];
}


- (IBAction)applyEmoji
{
    WKAlertAction *action = [WKAlertAction actionWithTitle:@"Dismiss"
                                                     style:WKAlertActionStyleDefault
                                                   handler:^{
                                                       
                                                   }];
    
    NSString *emoji = self.selectedPickerItem.title;
    
    if (!emoji) {
        return;
    }
    
    ExtensionDelegate *delegate = [WKExtension sharedExtension].delegate;
    [delegate.connectivityController
     sendEmoji:emoji
     completion:^(BOOL success, NSError *error) {
         NSString *alertTitle;
         NSString *message;
         if (success) {
             alertTitle = @"Success";
             message = @"Your emoji has been applied to the home screen of your iOS App";
         } else {
             alertTitle = @"Error";
             message = error.localizedDescription;
         }
         
         [self presentAlertControllerWithTitle:alertTitle
                                       message:message
                                preferredStyle:WKAlertControllerStyleAlert
                                       actions:@[action]];
     }];
    
    [[NSUserDefaults standardUserDefaults] setObject:emoji forKey:@"emoji"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)appColorDidChange:(NSNotification *)notification
{
    NSData *colorData = notification.object;
    UIColor *color =[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    
    if (!color) {
        return;
    }
    
    [self.mainGroup setBackgroundColor:color];
    
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end



