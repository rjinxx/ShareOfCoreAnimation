//
//  DemoLayer.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/11/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "DemoLayer.h"

@implementation DemoLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.contents = (id)[UIImage imageNamed:@"tracker"].CGImage;
        [self setContentsGravity:kCAGravityResizeAspect];
    }
    return self;
}

- (void)moveLayerPosition
{
    // [CATransaction setDisableActions:YES];

    CGFloat endPoint = self.position.y > 250 ? 150 : 450;
    
    [self setPosition:CGPointMake(self.position.x, endPoint)];
}

- (void)moveLayerWithAnimation
{
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:1.5f] forKey:kCATransactionAnimationDuration];
    
    CGFloat endPoint = self.position.y > 250 ? 150 : 450;
    [self setPosition:CGPointMake(self.position.x, endPoint)];
    
    [CATransaction commit];
}


@end
