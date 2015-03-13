//
//  CAPartCViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/8/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "CAPartCViewController.h"
#import "ShapeLayerController.h"

@interface CAPartCViewController ()

@property (nonatomic, retain) CAShapeLayer *animationLayer;
@property (nonatomic, retain) UIBezierPath *pathA;
@property (nonatomic, retain) UIBezierPath *pathB;
@property (nonatomic, retain) UIBezierPath *pathC;

@end

@implementation CAPartCViewController

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
    
    [self setupAnimationLayer];
}

- (void)setupAnimationLayer
{
    [self.demoImgView removeFromSuperview]; self.demoImgView = nil;
    
    CGPoint bottomLeft 	= CGPointMake(35.f, 400.f);
    CGPoint topLeft		= CGPointMake(35.f, 200.f);
    CGPoint bottomRight = CGPointMake(285.f, 400.f);
    CGPoint topRight	= CGPointMake(285.f, 200.f);
    CGPoint roofTip		= CGPointMake(160.f, 300.f);
    
    CGPoint leftTemp    = CGPointMake(80.f, 150.f);
    CGPoint rightTemp   = CGPointMake(240.f, 150.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:roofTip];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:bottomLeft];
    [self setPathA:path];
    
    UIBezierPath *pathB = [UIBezierPath bezierPath];
    [pathB moveToPoint:bottomLeft];
    [pathB addLineToPoint:topLeft];
    [pathB addCurveToPoint:topRight controlPoint1:leftTemp controlPoint2:rightTemp];
    [pathB addLineToPoint:bottomRight];
    [pathB addLineToPoint:bottomLeft];
    [self setPathB:pathB];
    
    UIBezierPath *pathC = [UIBezierPath bezierPath];
    [pathC moveToPoint:bottomLeft];
    [pathC addLineToPoint:topLeft];
    [pathC addLineToPoint:topRight];
    [pathC addLineToPoint:bottomRight];
    [pathC addLineToPoint:bottomLeft];
    [self setPathC:pathC];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = nil;
    pathLayer.fillColor = [UIColor greenColor].CGColor;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"test.jpg"]];
    imageView.layer.mask = pathLayer;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView];
    [self setDemoImgView:imageView];

    [self setAnimationLayer:pathLayer];
}

- (void)startAnimation
{
    [self.animationLayer removeAllAnimations];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"path";
    animation.values = @[ (id)self.pathA.CGPath, (id)self.pathB.CGPath, (id)self.pathC.CGPath ];
    animation.keyTimes = @[ @0, @(4 / 6.0), @1 ];
    animation.duration = .6f;
    [self.animationLayer addAnimation:animation forKey:@"Shape"];
    self.animationLayer.path = self.pathC.CGPath;
}

- (IBAction)resetAction:(id)sender
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = .25f;
    pathAnimation.fromValue = (id)self.pathC.CGPath;
    pathAnimation.toValue = (id)self.pathA.CGPath;
    [self.animationLayer addAnimation:pathAnimation forKey:@"path-reset"];
    self.animationLayer.path = self.pathA.CGPath;
}

- (IBAction)animateAction:(id)sender
{
    [self startAnimation];
}

- (IBAction)backToMainView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)customLayerAction:(id)sender
{
    ShapeLayerController *layVC = [[ShapeLayerController alloc] init];
    [self presentViewController:layVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
