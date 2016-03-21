//
//  BaseTabBarController.m
//  TangRen
//
//  Created by CNBJCHENRJM021 on 16/2/2.
//  Copyright © 2016年 KeJiang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseViewController.h"


@interface BaseTabBarController ()
@property (nonatomic, strong) NSArray * imageArray;
@property (nonatomic, strong) NSArray * imageSelectArray;
@end

@implementation BaseTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.tabBar.translucent  = NO;
    for (UIBarItem *item in self.tabBar.items) {
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:11.0f],NSFontAttributeName, [UIColor colorWithRed:224.0f/255.0 green:232.0f/255.0 blue:238.0f/255.0 alpha:1.0],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
        
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:11.0f],NSFontAttributeName, [UIColor colorWithRed:224.0f/255.0 green:110.0f/255.0 blue:2.0f/255.0 alpha:1.0],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    }
    
    
    //自定义Tab bar button
    self.imageArray = [NSArray arrayWithObjects:@"tabbar_store_noSelect",@"tabbar_makeTeaPeople_noSelect",@"tabbar_Magazine_noSelect",@"tabbar_mine_noSelect",nil];
    self.imageSelectArray = [NSArray arrayWithObjects:@"tabbar_store_Select",@"tabbar_makeTeaPeople_Select",@"tabbar_Magazine_Select",@"tabbar_mine_Select",nil];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width/self.imageArray.count;
    for (int i= 0; i < self.imageArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width*i, 0, width, 64.0);
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[self.imageSelectArray objectAtIndex:i]] forState:UIControlStateSelected];
        [btn setAdjustsImageWhenHighlighted:NO];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-15.0f, 0, 0, 0)];
        btn.tag = 747800+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (0 == i) {
            [btn setSelected:YES];
            [btn setImage:[UIImage imageNamed:[self.imageSelectArray objectAtIndex:0]] forState:UIControlStateNormal];
        }
        [self.tabBar addSubview:btn];
    }
}

-(void)btnClick:(id)sender
{
    for (int i = 0; i< self.imageArray.count; i++) {
        UIButton *btn = [self.view viewWithTag:747800+i];
        [btn setSelected:NO];
        [btn setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:i]] forState:UIControlStateNormal];
    }
    
    UIButton *btn = (UIButton *)sender;
    [btn setSelected:YES];
    [btn setImage:[UIImage imageNamed:[self.imageSelectArray objectAtIndex:btn.tag-747800]] forState:UIControlStateSelected];
    NSInteger index = btn.tag-747800;
    self.selectedIndex = index;
    
    [self.viewControllers[btn.tag-747800] popToRootViewControllerAnimated:YES];
}

@end
