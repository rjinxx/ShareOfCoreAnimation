//
//  ShapeAniLayer.m
//  ShapePathAnimation
//
//  Created by Xiaojun Jin on 7/30/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "ShapeAniLayer.h"

@implementation ShapeAniLayer

- (id)init
{
    if ((self = [super init]))
    {
        self.bounds = CGRectMake(0, 0, 200, 200);
        [self setNeedsDisplay];
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([@"path" isEqualToString:key])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"path"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.duration = 0.6; //[CATransaction animationDuration];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        animation.fromValue = (id)[[self presentationLayer] path];
        return animation;
    }
    return [super actionForKey:key];
}

- (void)display
{
    NSLog(@"path: %@", [self.presentationLayer path]);
}

@end
