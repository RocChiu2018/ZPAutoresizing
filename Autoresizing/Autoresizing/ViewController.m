//
//  ViewController.m
//  Autoresizing
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 sunco. All rights reserved.
//

/**
 屏幕适配经历如下的几个阶段：
 1、最开始在屏幕尺寸相对来说比较少的情况下，一般是根据不同屏幕的尺寸来写死控件的尺寸；
 2、后来开始用Autoresizing技术来适配不同屏幕的尺寸，但是这种技术有明显的不足之处，不能满足屏幕适配的需要；
 3、在iOS6以后开始使用Autolayout技术来完成屏幕适配的工作，这种技术可以满足屏幕适配的需要。
 
 利用Autoresizing技术来完成屏幕适配的话有两种方式，但是不管使用哪种方式必须在xib文件中把视图控制器的Autolayout功能关闭以后才能使用：
 1、在xib文件中通过可视化的方式使用：
 xib文件中Autoresizing的正方形外面的四个虚线代表着控件与四周的间距都是不固定的，如果想要让控件与某个边缘的间距是固定的的话就要点击所代表的那个虚线，届时虚线就会变成实线，代表着已经约束好这个间距了；
 xib文件中Autoresizing的正方形里面的两个虚线代表着控件的宽和高不随屏幕尺寸的变化而成比例的变化，想要让控件的尺寸随着屏幕尺寸的变化而成比例变化的话就要点击相应的虚线，届时虚线就会变成实线，代表着已经约束好这个尺寸了。
 2、在普通文件中通过代码的方式使用：
 要设置控件的autoresizingMask属性，枚举如下：
 typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
 UIViewAutoresizingNone                 = 0,  不设置Autoresizing
 UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,  控件左边的间距是伸缩的，即右边的间距是固定的（右边是实线）
 UIViewAutoresizingFlexibleWidth        = 1 << 1,  控件的宽度是伸缩的，即控件的宽度会随着父控件尺寸的变化而成比例的变化（里面的横线是实线）
 UIViewAutoresizingFlexibleRightMargin  = 1 << 2,  控件右边的间距是伸缩的，即左边的间距是固定的（左边是实线）
 UIViewAutoresizingFlexibleTopMargin    = 1 << 3,  控件顶部的间距是伸缩的，即底部的间距是固定的（底部是实线）
 UIViewAutoresizingFlexibleHeight       = 1 << 4,  控件的高度是伸缩的，即控件的高度会随着父控件尺寸的变化而成比例的变化（里面的竖线是实线）
 UIViewAutoresizingFlexibleBottomMargin = 1 << 5   控件底部的间距是伸缩的，即顶部的间距是固定的（顶部是实线）
 };
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //通过代码的方式设置Autoresizing
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    
    CGFloat wh = 100;
    CGFloat x = self.view.bounds.size.width - wh;
    CGFloat y = self.view.bounds.size.height - wh;
    blueView.frame = CGRectMake(x, y, wh, wh);
    
    //想让控件始终保持在屏幕的右下角
    blueView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:blueView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
