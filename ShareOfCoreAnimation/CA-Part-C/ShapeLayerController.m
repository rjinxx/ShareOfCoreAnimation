//
//  ShapeLayerController.m
//  ShareOfCoreAnimation
//
//  Created by Rylan on 3/13/15.
//  Copyright (c) 2015 ArcSoft. All rights reserved.
//

#import "ShapeLayerController.h"
#import "ShapeAniLayer.h"

@interface ShapeLayerController ()

@property (nonatomic, strong) ShapeAniLayer *shapeLayer;
@property (nonatomic, retain) UIBezierPath *pathA;
@property (nonatomic, retain) UIBezierPath *pathB;

@end

@implementation ShapeLayerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat sWidth   = [UIScreen mainScreen].bounds.size.width;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((sWidth - 100.f)/2.f, 50, 100, 50)];
    [button setTitle:@"Re-animate" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(ReAnimation) forControlEvents:UIControlEventTouchUpInside];
    [button setExclusiveTouch:YES];
    [self.view addSubview:button];
    
    CGFloat xRigth      = (sWidth - 35.f);
    CGFloat mHeight     = (sWidth - 2 * 35.f) * 537.f / 600.f;
    
    CGPoint bottomLeft  = CGPointMake(35.f, mHeight + 250.f);
    CGPoint topLeft     = CGPointMake(35.f, 250.f);
    CGPoint bottomRight = CGPointMake(xRigth, mHeight + 250.f);
    CGPoint topRight    = CGPointMake(xRigth, 250.f);
    CGPoint roofTip     = CGPointMake(sWidth / 2.f, mHeight + xRigth / 2.f);
    
    CGPoint leftTemp    = CGPointMake(80.f, mHeight - 100.f);
    CGPoint rightTemp   = CGPointMake(sWidth - 80.f, mHeight - 100.f);

    UIBezierPath *path  = [UIBezierPath bezierPath];
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
    
    self.shapeLayer = [[ShapeAniLayer alloc] init];
    self.shapeLayer.position = CGPointMake(100, 100);
    self.shapeLayer.path = self.pathA.CGPath;
    self.shapeLayer.fillColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:self.shapeLayer];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"test.jpg"]];
    imageView.layer.mask = self.shapeLayer;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake((sWidth - 71.f)/2.f, 550, 71, 24)];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setExclusiveTouch:YES];
    [self.view addSubview:backBtn];
}

- (void)ReAnimation
{
    if (self.shapeLayer.path == self.pathA.CGPath)
    {
        self.shapeLayer.path = self.pathB.CGPath;
    }
    else
    {
        self.shapeLayer.path = self.pathA.CGPath;
    }
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.pathA = nil;
    self.pathB = nil;
    self.shapeLayer = nil;
}

@end
