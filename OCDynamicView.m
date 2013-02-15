//
//  OCDynamicView.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCDynamicView.h"
#import "OCViewController.h"

float urandom() {
    // return random number in [0,1]
    
    return arc4random_uniform(1028)/1028.0;
}

@implementation OCDynamicView {
    

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
        
    }
    
    self.running = YES;
    self.frameRate = 10.0;
    [self updateTimer];
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    // Draw into layer
    [self randomTriangle:layerContext];
    
    // Transfer layer to current graphics context
    CGContextRef uictx = UIGraphicsGetCurrentContext();
    CGPoint pt = CGPointMake(0.0, 0.0);
    CGContextDrawLayerAtPoint(uictx, pt, layer);

}

- (void)tick
{
    // Tell the view that it needs to re-draw itself
    
    if (self.running) {  // Go!
        [self setNeedsDisplay];
        self.frameCount++;
        [self.mvc updateUI];
    }
}

- (void) updateTimer {
    // Throw away old timer
    if (timer) {
        NSLog(@"updateTimer:INVALIDATE TIMER:");
        [timer invalidate];
        NSLog(@"TIMER = nil:");
        timer = nil;
        // NSLog(@"TIMER release:");
        // [timer release];
    }
    
    float delay = 1.0/self.frameRate;
    timer = [NSTimer scheduledTimerWithTimeInterval:(delay)
                                             target:self selector:@selector(tick)
                                           userInfo:nil repeats:YES];
    NSLog(@"TIMER UPDATED");
}

- (void) randomTriangle: (CGContextRef) c {
    // Draw random triangle with random fill color.
    
    // Set random fill color to paint triangle.
    CGContextSetRGBFillColor(c, urandom(), urandom(), urandom(), 0.5);
    
    // "Center" of triangle
    float xx = urandom()*self.frame.size.width;
    float yy = urandom()*self.frame.size.height;
   
    // Size of triangle:
    float d = urandom()*150;
    // Vertices of triangle:
    float x1 = IRandom(-d,d) + xx;
    float y1 = IRandom(-d,d) + yy;
    float x2 = IRandom(-d,d) + xx;
    float y2 = IRandom(-d,d) + yy;
    float x3 = IRandom(-d,d) + xx;
    float y3 = IRandom(-d,d) + yy;
    
    // Construct path for triangle
    CGMutablePathRef trianglePath = CGPathCreateMutable();
  CGPathMoveToPoint(trianglePath, NULL, x1, y1);
	CGPathAddLineToPoint(trianglePath, NULL, x2, y2);
	CGPathAddLineToPoint(trianglePath, NULL, x3, y3);
    CGPathCloseSubpath(trianglePath);
    CGContextAddPath(c, trianglePath);
	CGContextFillPath(c);

    
}


// As in Processing, map a from the interval [a,b] affinely to the interval [c,d]
float map( float x, float a, float b, float c, float d) {
    float u = (x-a)/(b-a); // u is in [0,1] if x is in [a,b]
    float v = (d-c)*u + c;
    return v;
}

// return random number interval [a,b]
float IRandom(float a, float b) {
    return map(urandom(), 0, 1, a, b);
}


@end
