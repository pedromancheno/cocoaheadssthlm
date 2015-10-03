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
}

- (IBAction)pickerSelected:(NSInteger)value
{
    self.selectedPickerItem = self.pickerItems[value];
}


- (IBAction)applyEmoji
{
    ExtensionDelegate *delegate = [WKExtension sharedExtension].delegate;
    [delegate.connectivityController sendEmoji:self.selectedPickerItem.title];
    
    WKAlertAction *action = [WKAlertAction actionWithTitle:@"Ok!"
                                                     style:WKAlertActionStyleDefault
                                                   handler:^{
                                                       
                                                   }];
    
    [self presentAlertControllerWithTitle:@"Success"
                                  message:@"Your emoji has been applied to the home screen of your iOS App"
                           preferredStyle:WKAlertControllerStyleAlert
                                  actions:@[action]];
}

@end



