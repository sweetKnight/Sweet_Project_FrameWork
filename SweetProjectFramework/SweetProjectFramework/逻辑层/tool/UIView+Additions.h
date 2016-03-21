//
//  UIView+Additions.h
//  touchTest
//
//  Created by 周智伟 on 15/5/21.
//  Copyright (c) 2015年 mr.song. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  用于查找到所在的viewController
 */
@interface UIView (Additions)
-(UIViewController *)viewController;
@end
