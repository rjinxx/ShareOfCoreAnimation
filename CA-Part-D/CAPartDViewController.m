//
//  CAPartDViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/11/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "CAPartDViewController.h"

@interface CAPartDViewController ()
{
    NSInteger _zIndicator;
}
@end

@implementation CAPartDViewController

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
    _zIndicator = 1;
    
    [self.cardA.layer setCornerRadius:20];
    [self.cardB.layer setCornerRadius:20];
}

- (IBAction)ReShuffle:(id)sender
{
    _zIndicator = -_zIndicator;
    
    // Animation group for cardA
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @(_zIndicator);
    zPosition.toValue = @(-_zIndicator);
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[[NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(90, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]];
    position.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[ zPosition, rotation, position ];
    group.duration = 1.2;
    
    self.cardA.layer.zPosition = -_zIndicator;
    [self.cardA.layer addAnimation:group forKey:@"shuffle"];
    
    // Animation group for cardB
    CABasicAnimation *zPosition1 = [CABasicAnimation animation];
    zPosition1.keyPath = @"zPosition";
    zPosition1.fromValue = @(-_zIndicator);
    zPosition1.toValue = @(_zIndicator);
    zPosition1.duration = 1.2;
    
    CAKeyframeAnimation *rotation1 = [CAKeyframeAnimation animation];
    rotation1.keyPath = @"transform.rotation";
    rotation1.values = @[ @0, @(-0.14), @0 ];
    rotation1.duration = 1.2;
    rotation1.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    CAKeyframeAnimation *position1 = [CAKeyframeAnimation animation];
    position1.keyPath = @"position";
    position1.values = @[[NSValue valueWithCGPoint:CGPointZero],
                         [NSValue valueWithCGPoint:CGPointMake(-85, -20)],
                         [NSValue valueWithCGPoint:CGPointZero]];
    position1.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    position1.additive = YES;
    position1.duration = 1.2;
    
    CAAnimationGroup *group1 = [[CAAnimationGroup alloc] init];
    group1.animations = @[ zPosition1, rotation1, position1 ];
    group1.duration = 1.2;
    
    self.cardB.layer.zPosition = _zIndicator;
    [self.cardB.layer addAnimation:group1 forKey:@"shuffle"];
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
