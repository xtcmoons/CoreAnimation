//
//  DisplayLinkVC.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/14.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "DisplayLinkVC.h"

#define IMAGE_COUNT 10

@interface DisplayLinkVC () {
    CALayer *_layer;
    NSInteger _index;
    NSMutableArray *_images;
}

@end

@implementation DisplayLinkVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 87, 32);
    _layer.position = CGPointMake(160, 284);
    [self.view.layer addSublayer:_layer];

    _images = [NSMutableArray array];

    for (int i = 0; i < 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"fish%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [_images addObject:image];
    }

    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)step {
    static int s = 0;
    if (++s%10 == 0) {
        UIImage *image = _images[_index];
        _layer.contents = (id)image.CGImage;
        _index = (_index + 1) % IMAGE_COUNT;
    }
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
