//
//  ViewController.m
//  CocoaHeadsSthlm
//
//  Created by Pedro Mancheno on 03/10/15.
//  Copyright © 2015 Lifesum. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *emoji = [[NSUserDefaults standardUserDefaults] objectForKey:@"emoji"] ? : @"☺️";
    [self.emojiLabel setText:emoji];
}

@end
