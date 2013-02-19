//
//  OCDynamicView.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCDynamicView.h"
#import "OCViewController.h"

typedef enum {should_clear, was_cleared} clearState;


@implementation OCDynamicView {
    
    CGLayerRef layer;
    
    CGContextRef layerContext;
    
    NSTimer* timer;
    
    clearState clear_state;
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Set up layer and layerContext for off-screen drawing.
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGSize layerSize = self.frame.size;
        layer = CGLayerCreateWithContext(ctx, layerSize, NULL);
        layerContext = CGLayerGetContext(layer);
        clear_state = was_cleared;
        
    }
    
    self.running = YES;
    self.frameRate = 10.0;
    [self updateTimer];
    return self;
}

- (void) initDynamicalSystem {
    
    [self.ds configureFrameHeight:self.frame.size.height];
    [self.ds configureFrameWidth:self.frame.size.width];
    [self.ds initState];
}

- (void)drawRect:(CGRect)rect
{
    
    if (clear_state == was_cleared) {
        
        // If we are not clearing the drawing, then
        // update dynamical system and have it draw into layer
        [self.ds updateState];
        [self.ds drawFrame:layerContext];
    }
    
    // Transfer layer to current graphics context
    CGContextRef uictx = UIGraphicsGetCurrentContext();
    CGPoint pt = CGPointMake(0.0, 0.0);
    CGContextDrawLayerAtPoint(uictx, pt, layer);
    
    if (clear_state == should_clear) {
        clear_state = was_cleared;
    }
    
}

- (void)tick
{
    // Tell the view that it needs to re-draw itself
    
    if (self.running || clear_state == should_clear) {  // Go!
        [self setNeedsDisplay];
        self.frameCount++;
        [self.reportingViewController updateStatusOfDynamicView];
    }
}

- (void) updateTimer {
    
    // Throw away old timer
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    
    // set up new timer with new frame rate
    float delay = 1.0/self.frameRate;
    timer = [NSTimer scheduledTimerWithTimeInterval:(delay)
                                             target:self selector:@selector(tick)
                                           userInfo:nil repeats:YES];
}

- (void) clear {
    
    // Set things up to clear screen (fill with black) the next time
    // that drawRect is called. Here clear_state is set to should_clear.
    // After drawRect fills the screen with black, clear_state is set
    // back to was_cleared
    
    CGContextSetRGBFillColor(layerContext, 0, 0, 0, 1.0);
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGContextFillRect(layerContext, rect);
    [self.ds initState];
    clear_state = should_clear;
    self.frameCount = -1;
}

- (void) updateFrameRate: (float) f {
    
    self.frameRate = f;
    [self updateTimer];
}

@end
