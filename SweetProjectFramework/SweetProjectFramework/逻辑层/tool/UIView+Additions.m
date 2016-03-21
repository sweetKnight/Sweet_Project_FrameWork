//
//  UIView+Additions.m
//  touchTest
//
//  Created by 周智伟 on 15/5/21.
//  Copyright (c) 2015年 mr.song. All rights reserved.
//

#import "UIView+Additions.h"
#import "UIViewController+DismissKeyboard.h"

@implementation UIView (Additions)
-(UIViewController *)viewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }else{
            next = [next nextResponder];
        }
    } while (next != nil);
    return nil;
}
@end
