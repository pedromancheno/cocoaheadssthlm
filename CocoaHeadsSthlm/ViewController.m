//
//  ViewController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "ViewController.h"

#import "PhoneToWatchConnectivityController.h"

#import "AppDelegate.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(didReceiveEmoji:)
     name:PhoneToWatchConnectivityControllerDidReceiveEmoji
     object:nil];
    
    NSString *emoji = [[NSUserDefaults standardUserDefaults] objectForKey:@"emoji"];
    self.emojiLabel.text = emoji ? : @"😅";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveEmoji:(NSNotification *)notification
{
    NSString *emoji = notification.object;
    [self.emojiLabel setText:emoji];
    [[NSUserDefaults standardUserDefaults] setObject:emoji forKey:@"emoji"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
