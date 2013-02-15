//
//  OCViewController.h
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCDynamicView;

@interface OCViewController : UIViewController

@property(strong, nonatomic) OCDynamicView *dynamicView;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (void) updateUI;

@end
