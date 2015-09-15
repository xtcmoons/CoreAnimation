//
//  BaseAnimationViewController.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/12.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController () {
    CALayer *_layer;
    UIImageView *_imageView;
}


@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    UIImageView *backView = [[UIImageView alloc] initWithImage:backgroundImage];
    backView.userInteractionEnabled = YES;
    self.view = backView;

    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.anchorPoint = CGPointMake(0.5, 0.5);
    _layer.contents = (id)[UIImage imageNamed:@"petal"].CGImage;
    [self.view.layer addSublayer:_layer];
     */

    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"petal"]];
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /*
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
     */

//    [UIView animateWithDuration:5.0 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
//        _imageView.center = location;
//    } completion:^(BOOL finished) {
//        NSLog(@"finished");
//    }];


    /*创建弹性动画
     damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
     velocity:弹性复位的速度
     */
    /*
    [UIView animateWithDuration:5.0
                          delay:0.1
         usingSpringWithDamping:0.4
          initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _imageView.center = location;

                     }
                     completion:^(BOOL finished) {

                         NSLog(@"finished");
                     }];
     */


    [UIView animateWithDuration:5.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         [UIView addKeyframeWithRelativeStartTime:0.0
                                                 relativeDuration:0.5
                                                       animations:^{
                                                           _imageView.center = CGPointMake(80.0, 220.0);
                                                       }];

                         [UIView addKeyframeWithRelativeStartTime:0.5
                                                 relativeDuration:0.25
                                                       animations:^{
                                                           _imageView.center = CGPointMake(45.0, 300.0);
                                                       }];

                         [UIView addKeyframeWithRelativeStartTime:0.75
                                                 relativeDuration:0.25
                                                       animations:^{
                                                           _imageView.center = CGPointMake(55.0, 400.0);
                                                       }];
                     } completion:^(BOOL finished) {
                     }];

}

#pragma mark - animation
- (void)translatonAnimation:(CGPoint)location {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue = [NSValue valueWithCGPoint:location];
    basicAnimation.duration = 5.0;

    basicAnimation.delegate = self;

    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"KCBasicAnimationLocation"];

    [_layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Translation"];
}

- (void)rotationAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];

    basicAnimation.duration = 5.0;
    basicAnimation.autoreverses = true;
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    [_layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Rotation"];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    CGPoint location = [touch locationInView:self.view];
//
//    [self translatonAnimation:location];
//
//    [self rotationAnimation];
//}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animation(%@) start.\r _layer.frame =", anim);
    NSLog(@"%@", [_layer animationForKey:@"KCBasicAnimation_Translation"]);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    _layer.position = [[anim valueForKey:@"KCBasicAnimationLocation"] CGPointValue];

    [CATransaction commit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
