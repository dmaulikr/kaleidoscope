//
//  OCUtilities.c
//  Dynamics
//
//  Created by James Carlson on 2/17/13.
//  Copyright (c) 2013 James Carlson. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


float urandom() {
    
    // return random number in [0,1]
    
    return arc4random_uniform(1028)/1028.0;
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


