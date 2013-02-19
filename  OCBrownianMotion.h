//
//  OCBrownianMotion.h
//  Kaleidoscope
//
//  Created by James Carlson on 2/16/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCDynamicalSystem.h"

@interface OCBrownianMotion : NSObject <OCDynamicalSystem>

@property (assign) int frameWidth, frameHeight;


@end
