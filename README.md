kaleidoscope
============

Kaleidoscope (objective-c): generate and display random triangles with random colors at user-defined "frame rate." 
Default is 10 frames/sec.  See 

  http://square-the-circle.com/2013/02/14/kaleidoscope/
  
for a typical image created by Kaleidoscope.   Purpose is to exercise and demonstrate the 
OCDynamicView class which features repeated drawing into an offscreen CALayer.  This is 
useful for math and physics animationsas well as for procedural/generative art projects.

Update of 2/18/2013:  Much improved architecture.  The main drawing class, OCDynamicView,
is no longer hardwired to the OCViewController, and the code that draws repeated frames --
random triangles, Brownian motion, whatever -- is now factored out and put in a class
that implements the OCDynamicalSystem protocol.  We call this a dynamical system
class.  The OCDynamicView interacts with the dynamical system only through the 
OCDynamicalSystem protocal.  

Example: Classes implementing the OCDynamicalSystem protocol are OCRandomTriangle, which is
stateless, and OCBrownianMotion, for which the state is (x,y), the current partivle position.
These classes can be "dropped in" and wired to the OCViewController with changes in only 
four lines of code.  We will discuss this more fully later.

NOTE:  After running for a while (about 10,000 steps), the app crashes.  Haven't yet investigate.  Yuuk!
If anyone has a suggestion as to what the trouble is, I would be most grateful.
