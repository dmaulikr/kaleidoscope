//
//  OCDynamicalSystem.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/16/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCRandomShapes.h"
#import "OCUtilities.h"


@implementation OCRandomShapes {
    
    
}

- (void) configureFrameWidth: (int) w {
    
    self.frameWidth = w;
    
}

- (void) configureFrameHeight: (int) h {
    
    self.frameHeight = h;

}


- (void) initState {
    
    
}

- (void) updateState  {

    
}


 - (void) drawFrame: (CGContextRef) c {
     // Draw random triangle with random fill color.
     
     // Set random fill color to paint triangle.
     CGContextSetRGBFillColor(c, urandom(), urandom(), urandom(), 0.25);
     
     // "Center" of triangle
     float cx = urandom()*self.frameWidth;
     float cy = urandom()*self.frameHeight;
     
     // Size of triangle is a random number
     float d = 10 + urandom()*150;
     // Vertices of triangle: center + random component
     float x1 = cx + IRandom(-d,d);
     float y1 = cy + IRandom(-d,d);
     float x2 = cx + IRandom(-d,d);
     float y2 = cy + IRandom(-d,d);
     float x3 = cx + IRandom(-d,d);
     float y3 = cy + IRandom(-d,d);
     
     // Construct path for triangle and fill it with color
     CGMutablePathRef trianglePath = CGPathCreateMutable();
     CGPathMoveToPoint(trianglePath, NULL, x1, y1);
     CGPathAddLineToPoint(trianglePath, NULL, x2, y2);
     CGPathAddLineToPoint(trianglePath, NULL, x3, y3);
     CGPathCloseSubpath(trianglePath);
     CGContextAddPath(c, trianglePath);
     CGContextFillPath(c);
 }
 

@end
