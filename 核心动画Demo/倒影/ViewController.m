//
//  ViewController.m
//  倒影
//
//  Created by 无头骑士 GJ on 16/3/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",self.view.layer);
    CAReplicatorLayer *repL =   (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    //旋转是绕着复制层的锚点进行的.
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    repL.instanceRedOffset -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceBlueOffset -= 0.1;
    repL.instanceAlphaOffset -= 0.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
