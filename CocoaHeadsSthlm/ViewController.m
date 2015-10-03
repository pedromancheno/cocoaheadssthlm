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
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(didReceiveEmoji:)
     name:PhoneToWatchConnectivityControllerDidReceiveEmoji
     object:nil];
    
    [self.tapGestureRecognizer addTarget:self action:@selector(didTapOnView)];
    
    
    
    NSString *emoji = [[NSUserDefaults standardUserDefaults] objectForKey:@"emoji"];
    self.emojiLabel.text = emoji ? : @"😅";
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"color"];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    self.view.backgroundColor = color ? : [UIColor blackColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.tapGestureRecognizer removeTarget:self action:@selector(didTapOnView)];
  }

- (void)didReceiveEmoji:(NSNotification *)notification
{
    NSString *emoji = notification.object;
    [self.emojiLabel setText:emoji];
    [[NSUserDefaults standardUserDefaults] setObject:emoji forKey:@"emoji"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didTapOnView
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *randomColor = [UIColor colorWithHue:hue
                                      saturation:saturation
                                      brightness:brightness alpha:1];
    
    [self.view setBackgroundColor:randomColor];

    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:randomColor];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSError *error;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.connectivityController updateApplicationColorData:colorData
                                                         error:&error];
    
    if (error) {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Error"
                                            message:error.localizedDescription
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                              style:UIAlertActionStyleDefault
                                                            handler:nil];
        
        [alertController addAction:alertAction];
        
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
    }
}

@end
