//
//  CanDelectTableViewCell.h
//  TangRen
//
//  Created by 冯剑锋 on 16/2/3.
//  Copyright © 2016年 KeJiang. All rights reserved.
//

#import "SmartTableViewCell.h"
typedef void(^DelectButtonClick)(NSIndexPath * index);
@interface CanDelectTableViewCell : SmartTableViewCell

@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UIImageView * deleteImageView;
@property (nonatomic, strong) UIButton * deleteButton;
@property (nonatomic, copy) DelectButtonClick block;
@property (nonatomic, strong) NSIndexPath * index;

@end
