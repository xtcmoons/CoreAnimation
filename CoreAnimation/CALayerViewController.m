//
//  CALayerViewController.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/12.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "CALayerViewController.h"

#define WIDTH 50
#define PHOTO_HEIGHT 150

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self drawMylayer];
    [self drawContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)drawContext {
    CALayer *layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    layer.position = CGPointMake(160, 200);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = PHOTO_HEIGHT / 2;

    layer.masksToBounds = YES;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.delegate = self;
    [self.view.layer addSublayer:layer];

    [layer setNeedsDisplay];

}

- (void)drawMylayer {

    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor colorWithRed:0 green:146 / 255.0 blue:1.0 alpha:1].CGColor;
    layer.position = self.view.center;
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH / 2;

    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = 0.9;

    layer.anchorPoint = CGPointZero;

    [self.view.layer addSublayer:layer];


    CALayer *layer1 = [[CALayer alloc] init];
    layer1.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:146 / 255.0 blue:1.0 alpha:1].CGColor;
    layer1.position = self.view.center;
    layer1.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer1.cornerRadius = WIDTH / 2;

    layer1.shadowColor = [UIColor grayColor].CGColor;
    layer1.shadowOffset = CGSizeMake(2, 2);
    layer1.shadowOpacity = 0.9;

    [self.view.layer addSublayer:layer1];

}

#pragma mark - Delegate 
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);

    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);

    UIImage *image = [UIImage imageNamed:@"photo"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);



    CGContextRestoreGState(ctx);
}


/*
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __FUNCTION__);

    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers[0];
    CGFloat width = layer.bounds.size.width;
    if (width == WIDTH) {
        width = WIDTH * 4;
    } else {
        width = WIDTH;
    }

    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width / 2;
}
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
