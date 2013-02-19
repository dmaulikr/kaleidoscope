//
//  OCDynamicalSystem.h
//  Dynamics
//
//  Created by James Carlson on 2/17/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OCDynamicalSystem <NSObject>

- (void) configureFrameWidth: (int) w;
- (void) configureFrameHeight: (int) h;

- (void) initState;
- (void) updateState;

- (void) drawFrame: (CGContextRef) c;

@end
