//
//  OCBrownianmotion.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/16/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCBrownianMotion.h"
#include "OCUtilities.h"


@implementation OCBrownianMotion {
    
    float x, y;
    float r, g, b, alpha;
    float diameter, maxStep;
    
}

- (void) configureFrameWidth: (int) w {
    
    self.frameWidth = w;
    
}

- (void) configureFrameHeight: (int) h {
    
    self.frameHeight = h;
    
}


- (void) initState {
    
    x = self.frameWidth/2;
    y = self.frameHeight/2;
    
    r = urandom();
    g = urandom();
    b = urandom();
    alpha = IRandom(0.1, 0.12);
    
    diameter = 10;
    maxStep = 25;
    
}

- (void) updateState  {
    
    x += IRandom(-maxStep, maxStep);
    y += IRandom(-maxStep, maxStep);
    
    if ((x < 0) || (x > self.frameWidth)) {
        [self initState];
    }
    
    if ((y < 0) || (y > self.frameHeight)) {
        [self initState];
    }
    
}

- (void) drawFrame: (CGContextRef) c {
    
    CGContextSetRGBFillColor(c, r, g, b, alpha);
    
    CGContextFillEllipseInRect(c,CGRectMake(x, y, diameter, diameter));
    
}


@end
