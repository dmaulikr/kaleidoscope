//
//  OCViewController.h
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCDynamicViewReporter.h"

@class OCDynamicView;
@class OCRandomShapes;  // XX //


@interface OCViewController : UIViewController <OCDynamicViewReporter>

@property(strong, nonatomic) OCDynamicView *dynamicView;

@property (strong, nonatomic) OCRandomShapes *ds; // XX //

@property (weak, nonatomic) IBOutlet UILabel *statusLabel, *frameRateLabel;

@property (weak, nonatomic) IBOutlet UIButton *startStopButton, *clearButton, *plusButton, *minusButton;


-(IBAction)startStop:(id)sender;

-(IBAction)clear:(id)sender;

-(IBAction)increaseFrameRate:(id)sender;

-(IBAction)decreaseFrameRate:(id)sender;

- (void) updateStatusOfDynamicView;

@end
