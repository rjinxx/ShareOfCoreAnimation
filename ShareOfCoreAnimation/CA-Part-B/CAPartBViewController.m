//
//  CAPartBViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/8/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "CAPartBViewController.h"

@interface CAPartBViewController ()

@property (nonatomic, retain) CAShapeLayer *animationLayer;

@end

@implementation CAPartBViewController

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

- (void)setupAnimationLayer
{
    [self.animationLayer removeFromSuperlayer]; self.animationLayer = nil;
    
    CGFloat sWidth      = [UIScreen mainScreen].bounds.size.width;
    CGFloat xRigth      = (sWidth - 35.f);

    CGPoint bottomLeft 	= CGPointMake(35.f, 450.f);
    CGPoint topLeft		= CGPointMake(35.f, 250.f);
    CGPoint bottomRight = CGPointMake(xRigth, 450.f);
    CGPoint topRight	= CGPointMake(xRigth, 250.f);
    CGPoint roofTip		= CGPointMake(sWidth/2.f, 150.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:roofTip];
    [path addLineToPoint:topRight];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:topRight];
    [path addLineToPoint:bottomLeft];
    [path addLineToPoint:bottomRight];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = CGRectMake(35, 100, 250, 200);
    pathLayer.bounds = CGRectMake(35, 100, 250, 200);
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 6.f;
    pathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:pathLayer];
    [self setAnimationLayer:pathLayer];
}

- (IBAction)startAnimation:(id)sender
{
    [self setupAnimationLayer];
    
    [self.animationLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 10.0;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    [self.animationLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
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
