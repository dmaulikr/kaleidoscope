//
//  OCDynamicView.h
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCViewController;

// #import <QuartzCore/QuartzCore.h>

@interface OCDynamicView : UIView {
    
    CGLayerRef layer;
    
    CGContextRef layerContext;
    
    NSTimer* timer;
    
}

@property (assign) BOOL running;
@property (assign) float frameRate;
@property (assign) int frameCount;
@property (strong, nonatomic) OCViewController *mvc;

@end
