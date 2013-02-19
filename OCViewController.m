//
//  OCViewController.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCViewController.h"
#import "OCDynamicView.h"
#import "OCRandomShapes.h"  // XX //


@interface OCViewController ()


@end



@implementation OCViewController {
    
    
}

- (void) updateStatusOfDynamicView {
    
    self.statusLabel.text = [NSString stringWithFormat:@"%d", self.dynamicView.frameCount];
    
    self.frameRateLabel.text = [NSString stringWithFormat:@"%1.0f", self.dynamicView.frameRate];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dynamicView = [[OCDynamicView alloc] initWithFrame:CGRectMake(0, 0, 320, 515)];
    [self.view addSubview:self.dynamicView];
    self.dynamicView.reportingViewController = self;                // wire main view controller to dynamicView
    [self setStartStopButtonTitle];
    
    self.ds = [[OCRandomShapes alloc] init];  // set up dynamical system  // XX //
    self.dynamicView.ds = self.ds;              // wire it to the dynamicView
    [self.dynamicView initDynamicalSystem];     // initialize the dynamical system
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/////////////////////////////////////////////////////////////////
/// USER INTERACTION
/////////////////////////////////////////////////////////////////

- (void) setStartStopButtonTitle {
    
    if (self.dynamicView.running) {
        [self.startStopButton setTitle: @"Stop" forState: UIControlStateNormal];
    } else {
        [self.startStopButton setTitle: @"Go" forState: UIControlStateNormal];
    }
}

- (IBAction)startStop:(id)sender {
    
    self.dynamicView.running = !self.dynamicView.running;
    [self setStartStopButtonTitle];
}

- (IBAction)clear:(id)sender {
    
    [self.dynamicView clear];
    [self setStartStopButtonTitle];
}


-(IBAction)increaseFrameRate:(id)sender {
    
    [self.dynamicView updateFrameRate:self.dynamicView.frameRate + 1];
    
}

-(IBAction)decreaseFrameRate:(id)sender {
    if (self.dynamicView.frameRate > 1) {
        [self.dynamicView updateFrameRate:self.dynamicView.frameRate - 1];
    }
    
}

@end
