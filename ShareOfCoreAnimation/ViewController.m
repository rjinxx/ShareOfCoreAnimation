//
//  ViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/8/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "ViewController.h"
#import "CAIntroViewController.h"
#import "CAPartAViewController.h"
#import "CAPartBViewController.h"
#import "CAPartCViewController.h"
#import "CASupplementViewController.h"
#import "LayerPropertyViewController.h"
#import "CAPartDViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (IBAction)introAction:(id)sender
{
    CAIntroViewController *introVC = [[CAIntroViewController alloc] init];
    [self presentViewController:introVC animated:YES completion:nil];
}

- (IBAction)layerPropertyAction:(id)sender
{
    LayerPropertyViewController *layerVC = [[LayerPropertyViewController alloc] init];
    [self presentViewController:layerVC animated:YES completion:nil];
}

- (IBAction)partAAction:(id)sender
{
    CAPartAViewController *partAVC = [[CAPartAViewController alloc] init];
    [self presentViewController:partAVC animated:YES completion:nil];
}

- (IBAction)partBAction:(id)sender
{
    CAPartBViewController *partBVC = [[CAPartBViewController alloc] init];
    [self presentViewController:partBVC animated:YES completion:nil];
}

- (IBAction)partCAction:(id)sender
{
    CAPartCViewController *partCVC = [[CAPartCViewController alloc] init];
    [self presentViewController:partCVC animated:YES completion:nil];
}

- (IBAction)partDAction:(id)sender
{
    CAPartDViewController *partDVC = [[CAPartDViewController alloc] init];
    [self presentViewController:partDVC animated:YES completion:nil];
}

- (IBAction)supplementAction:(id)sender
{
    CASupplementViewController *sVC = [[CASupplementViewController alloc] init];
    [self presentViewController:sVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
