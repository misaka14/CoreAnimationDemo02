//
//  VCView.m
//  核心动画Demo
//
//  Created by 无头骑士 GJ on 16/3/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "VCView.h"
@interface VCView()
/** 保存线路径 */
@property (nonatomic, strong) UIBezierPath *path;
/** 红色的点 */
@property (nonatomic, weak) CALayer *redLayer;

@end
@implementation VCView

+ (Class)layerClass
{
    
    return [CAReplicatorLayer class];
}

- (void)awakeFromNib
{
    // 1、为VCView添加手势
    [self addGestureRecognizer: [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(pan:)]];

    // 2、创建红色的layer
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = CGRectMake(-20, 0, 20, 20);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer: redLayer];
    self.redLayer = redLayer;
    
    // 3、设置复制层属性
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 30;
    repL.instanceDelay = 0.5;
    
    self.path = [UIBezierPath bezierPath];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint currentP = [pan locationInView: self];
    
    if (pan.state == UIGestureRecognizerStateBegan) // 滑动开始的状态
    {
        [self.path moveToPoint: currentP];
    }
    else if(pan.state == UIGestureRecognizerStateChanged) // 滑动过程中的状态
    {
        [self.path addLineToPoint: currentP];
    }
    [self setNeedsDisplay]; // 进行重绘
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke]; // 画线
}

// 开始动画
- (void)startAnim
{
    // 1、添加帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 3;
    [self.redLayer addAnimation: anim forKey: nil];
}

// 重绘
- (void)reDraw
{
    // 停止动画
    [self.redLayer removeAllAnimations];
    
    // 删除路径
    [self.path removeAllPoints];
    
    // 重绘
    [self setNeedsDisplay];
}

@end
