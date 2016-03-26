//
//  DotViewController.m
//  核心动画Demo
//
//  Created by 无头骑士 GJ on 16/3/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "DotViewController.h"
#import "VCView.h"
@interface DotViewController ()
@property (strong, nonatomic) IBOutlet VCView *vcView;

@end

@implementation DotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)start
{
    [self.vcView startAnim];
}
- (IBAction)reDraw
{
    [self.vcView reDraw];
}

@end
