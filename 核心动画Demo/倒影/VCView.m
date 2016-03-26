//
//  VCView.m
//  核心动画Demo
//
//  Created by 无头骑士 GJ on 16/3/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "VCView.h"

@implementation VCView

//返回当前View中layer的类型
+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

@end
