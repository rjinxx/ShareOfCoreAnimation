//
//  CASupplementViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/8/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "CASupplementViewController.h"

@interface CASupplementViewController ()
{
    BOOL isGoingUP;
}
@end

@implementation CASupplementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (IBAction)shapeLayerDisplay:(id)sender
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(70, 70)
                                                        radius:50.f
                                                    startAngle:0
                                                      endAngle:2*M_PI
                                                     clockwise:YES];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    
    self.demoImgView.layer.mask = shape;
}

- (IBAction)presentationLayerDis:(id)sender
{
    CGFloat sHeight     = [UIScreen mainScreen].bounds.size.height;
    NSNumber *fromValue = @165.f;
    NSNumber *toValue   = @(sHeight * 2.f / 3.f);
    NSNumber *endValue  = toValue;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 1;
/*
    if (!isGoingUP) {
        isGoingUP = YES;
        animation.fromValue = fromValue;
        animation.toValue = toValue;
        endValue = toValue;
    }
    else {
        isGoingUP = NO;
        animation.fromValue = toValue;
        animation.toValue = fromValue;
        endValue = fromValue;
    }
    
    self.demoImgView.layer.position = CGPointMake(self.demoImgView.layer.position.x, [endValue intValue]);
    
    NSString *key = [NSString stringWithFormat:@"ani-move"];
    [self.demoImgView.layer addAnimation:animation forKey:key];
*/

    if (!isGoingUP)
    {
        isGoingUP = YES;
        animation.fromValue = @([self.demoImgView.layer.presentationLayer position].y);
        animation.toValue = toValue;
        endValue = toValue;
    }
    else
    {
        isGoingUP = NO;
        animation.fromValue = @([self.demoImgView.layer.presentationLayer position].y);
        animation.toValue = fromValue;
        endValue = fromValue;
    }
    self.demoImgView.layer.position = CGPointMake(self.demoImgView.layer.position.x, [endValue intValue]);
    
    NSString *key = [NSString stringWithFormat:@"ani-move"];
    [self.demoImgView.layer addAnimation:animation forKey:key];
}

- (IBAction)backToMainView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
