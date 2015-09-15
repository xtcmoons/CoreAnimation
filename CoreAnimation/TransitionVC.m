//
//  TransitionVC.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/14.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "TransitionVC.h"

#define IMAGE_COUNT 5

@interface TransitionVC () {
    UIImageView *_imageView;
    NSInteger _currentIndex;
}

@end

@implementation TransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _imageView = [[UIImageView alloc] init];
    _imageView.frame = [UIScreen mainScreen].bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"fish0"];
    [self.view addSubview:_imageView];

    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];

    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
}

- (void)leftSwipe:(UISwipeGestureRecognizer *)gesture {

    [self transitionAnimation:YES];
}

- (void)rightSwipe:(UISwipeGestureRecognizer *)gesture {
    [self transitionAnimation:NO];
}

- (void)transitionAnimation:(BOOL)isNext {
    /*
    CATransition *transition = [[CATransition alloc] init];
//    transition.type = @"oglFlip";
    [transition setType:kCATransitionFade];

    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    } else {
        transition.subtype = kCATransitionFromLeft;
    }

    transition.duration = 1.0f;
     */

    UIViewAnimationOptions option;
    if (isNext) {
        option = UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromRight;
    } else {
        option = UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromLeft;
    }

    [UIView transitionWithView:_imageView
                      duration:1.0
                       options:option
                    animations:^{
                        _imageView.image = [self getImage:isNext];
                    } completion:^(BOOL finished) {

                    }];

}

- (UIImage *)getImage:(BOOL)isNext {
    if (isNext) {
        _currentIndex = (_currentIndex + 1) % IMAGE_COUNT;
    } else {
        _currentIndex = (_currentIndex - 1 + IMAGE_COUNT) % IMAGE_COUNT;
    }

    NSString *imageName = [NSString stringWithFormat:@"fish%ld.png", _currentIndex];

    return [UIImage imageNamed:imageName];
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
