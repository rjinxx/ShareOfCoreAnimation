//
//  CoreAnimationIntro.h
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/11/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

// Main Framework of Core Animation define in QuartzCore.framework
/*
1. CALayer
   CALayer manages image-based content and allows you to perform animations on than content.
   CALayer VS UIView.
 
2. CAAnimation
   CAAnimation is an abstract animation class. It provides support for Core Animation.
   Main subclass: CABasicAnimation, CAKeyframeAnimation.
 
3. CADisplaylink
   Similar to NSTimer, used to display and refresh animation content in UI.
   Refer to "Pop" animation of Facebook.

4. CATransaction
   CATransaction is the Core Animation mechanism for batching multiple layer-tree operations into
   atomic updates to the render tree.

5. CAMediaTimingFunction
   CAMediaTiming Function represents one segment of a function that defines the pacing of an animation as 
   a timing curve.
*/