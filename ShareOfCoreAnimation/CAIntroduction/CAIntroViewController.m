//
//  CAIntroViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/8/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "CAIntroViewController.h"

@interface CAIntroViewController ()

@end

@implementation CAIntroViewController

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

- (IBAction)kitRotateAction:(id)sender
{
    [UIView animateWithDuration:1.f animations:^
    {
        self.demoImgView.transform = CGAffineTransformMakeRotation(M_PI/2);
    }
    completion:^(BOOL finished)
    {
        self.demoImgView.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)caRotateAction:(id)sender
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    rotation.fromValue = @(0); rotation.toValue = @(M_PI/2);
    rotation.duration = 1.f; rotation.repeatCount = /*INFINITY*/ 1;
    
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    // rotation.fillMode = kCAFillModeForwards;
    // rotation.removedOnCompletion = NO;
    
    // self.demoImgView.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    [self.demoImgView.layer addAnimation:rotation forKey:@"an_roate"];
}

- (IBAction)XRotateAction:(id)sender
{
    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    TransformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
    
    TransformAnim.cumulative = YES; TransformAnim.duration = 3; TransformAnim.repeatCount = 2;
    
    [self.demoImgView.layer addAnimation:TransformAnim forKey:nil];
}

- (IBAction)YRotateAction:(id)sender
{
    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    TransformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
    
    TransformAnim.cumulative = YES; TransformAnim.duration = 3; TransformAnim.repeatCount = 2;
    
    [self.demoImgView.layer addAnimation:TransformAnim forKey:nil];
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
