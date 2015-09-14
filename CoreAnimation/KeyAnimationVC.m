//
//  KeyAnimationVC.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/14.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "KeyAnimationVC.h"

@interface KeyAnimationVC () {
    CALayer *_layer;
}

@end

@implementation KeyAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    self.view = imageView;

    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"petal"].CGImage;
    [self.view.layer addSublayer:_layer];

    [self translationAnimation];
//    [self transitionAnimationWithPath];
}

- (void)transitionAnimationWithPath {
    CAKeyframeAnimation *keyframeAnimatino = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);

    keyframeAnimatino.path = path;

    CGPathRelease(path);

    keyframeAnimatino.duration = 8.0;
    keyframeAnimatino.beginTime = CACurrentMediaTime() + 1;

    [_layer addAnimation:keyframeAnimatino forKey:@"KCKeyframeAnimation_Position"];

}

- (void)translationAnimation {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    NSValue *key1 = [NSValue valueWithCGPoint:_layer.position];
    NSValue *key2 = [NSValue valueWithCGPoint:CGPointMake(80, 200)];
    NSValue *key3 = [NSValue valueWithCGPoint:CGPointMake(40, 400)];
    NSValue *key4 = [NSValue valueWithCGPoint:CGPointMake(50, 500)];

    keyframeAnimation.values = @[key1, key2, key3, key4];

    keyframeAnimation.duration = 8.0;
    keyframeAnimation.beginTime = CACurrentMediaTime() + 2;
    keyframeAnimation.keyTimes = @[@(0.0), @(.5), @(0.7), @(1.0)];
    keyframeAnimation.calculationMode = kCAAnimationPaced;

    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
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
