//
//  OCDynamicView.h
//  Dynamics
//
//  Created by James Carlson on 2/18/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCDynamicalSystem.h"
#import "OCDynamicViewReporter.h"


@class OCViewController;

@interface OCDynamicView : UIView

@property (assign) BOOL running;
@property (assign) float frameRate;
@property (assign) int frameCount;

@property (strong, nonatomic) id <OCDynamicalSystem> ds;
@property (strong, nonatomic) id <OCDynamicViewReporter> reportingViewController;

- (void) initDynamicalSystem;
- (void) clear;
- (void) updateFrameRate: (float) f;

@end
