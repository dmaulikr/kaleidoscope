//
//  OCViewController.m
//  Kaleidoscope
//
//  Created by James Carlson on 2/14/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#import "OCViewController.h"
#import "OCDynamicView.h"

@interface OCViewController ()


@end



@implementation OCViewController {
    
    
}

- (void) updateUI {
    
    self.statusLabel.text = [NSString stringWithFormat:@"%d", self.dynamicView.frameCount];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dynamicView = [[OCDynamicView alloc] initWithFrame:CGRectMake(0, 0, 320, 520)];
    
    [self.view addSubview:self.dynamicView];
    
    self.dynamicView.mvc = self;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
