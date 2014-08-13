//
//  LayerPropertyViewController.m
//  ShareOfCoreAnimation
//
//  Created by xjin on 8/11/14.
//  Copyright (c) 2014 ArcSoft. All rights reserved.
//

#import "LayerPropertyViewController.h"
#import "DemoLayer.h"

@interface LayerPropertyViewController ()
{
    int tick;
}
@property (nonatomic, strong) DemoLayer *demoLayer;

@end

@implementation LayerPropertyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tick = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DemoLayer *layer = [[DemoLayer alloc] init];
    [layer setFrame:CGRectMake(135, 100, 50, 50)];
    [self.view.layer addSublayer:layer];
    [self setDemoLayer:layer];
   
    UIImage *image = [UIImage imageNamed:@"Snowman"];
    self.layerView.layer.contents = (__bridge id)(image.CGImage);
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsScale = image.scale;
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:0.25];
}

- (IBAction)movePostionAction:(id)sender
{
    // [self.demoLayer moveLayerPosition];
    
    [self.demoLayer moveLayerWithAnimation];
}

- (void)addStretchableImage:(UIImage *)image
          withContentCenter:(CGRect)rect
                    toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    //set contentsCenter
    layer.contentsCenter = rect;
}

- (void)changeImage
{
    UIImage *image = [UIImage imageNamed:@"Snowman"];
    
    CGRect rect = CGRectZero; if (tick > 5) tick = 0;
    
    switch (tick)
    {
        case 0:
            rect = CGRectMake(0, 0, 1, 0.75);
            break;
            
        case 1:
            rect = CGRectMake(0, 0, 1, 0.5);
            break;
            
        case 2:
            rect = CGRectMake(0, 0.25, 1, 0.5);
            break;
            
        case 3:
            rect = CGRectMake(0, 0.25, 1, 0.75);
            break;
            
        case 4:
            rect = CGRectMake(0, 0.5, 1, 1);
            break;
            
        case 5:
            rect = CGRectMake(0, 0.25, 1, 1);
            break;
            
        default:
            rect = CGRectMake(0, 0, 1, 1);
            break;
    }
    
    tick++;
    
    [self addStretchableImage:image withContentCenter:rect toLayer:self.layerView.layer];
    
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:0.1];
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
