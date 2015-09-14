//
//  GroupAnimationVC.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/14.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "GroupAnimationVC.h"

@interface GroupAnimationVC () {
    CALayer *_layer;
}

@end

@implementation GroupAnimationVC

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

    [self groupAnimation];
}

- (void)groupAnimation {

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    CABasicAnimation *basicAnimation = [self rotationAnimation];
    CAKeyframeAnimation *keyframeAnimation = [self translationAnimation];

    animationGroup.animations = @[basicAnimation, keyframeAnimation];
    animationGroup.delegate = self;
    animationGroup.duration = 10.0;
    animationGroup.beginTime = CACurrentMediaTime() + 1;

    [_layer addAnimation:animationGroup forKey:nil];
}

- (CABasicAnimation *)rotationAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    CGFloat toValue = M_PI_2 * 3;
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 *3];
    basicAnimation.autoreverses = true;
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;

    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"KCBasicAnimationProperty_ToValue"];

    return basicAnimation;
}

- (CAKeyframeAnimation *)translationAnimation {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint endPoint = CGPointMake(55, 400);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, endPoint.x, endPoint.y);
    keyframeAnimation.path = path;

    CGPathRelease(path);

    [keyframeAnimation setValue:[NSValue valueWithCGPoint:endPoint] forKey:@"KCKeyframeAnimationProperty_EndPosition"];

    return keyframeAnimation;
}

#pragma mark - Animation 
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAAnimationGroup *animationGroup = (CAAnimationGroup *)anim;
    CABasicAnimation *basicAnimation = animationGroup.animations[0];
    CAKeyframeAnimation *keyframeAnimation = animationGroup.animations[1];
    CGFloat endValue = [[basicAnimation valueForKey:@"KCBasicAnimationProperty_ToValue"] floatValue];
    CGPoint endPoint = [[keyframeAnimation valueForKey:@"KCKeyframeAnimationProperty_EndPosition"] CGPointValue];

    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    _layer.position = endPoint;
    _layer.transform = CATransform3DMakeRotation(endValue, 0, 0, 1);

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
