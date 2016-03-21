//
//  CanDelectTableViewCell.m
//  TangRen
//
//  Created by 冯剑锋 on 16/2/3.
//  Copyright © 2016年 KeJiang. All rights reserved.
//

#import "CanDelectTableViewCell.h"

@interface CanDelectTableViewCell (){
    CGFloat offeseWitdh;
}

@end

@implementation CanDelectTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.layer.cornerRadius = 5;
//        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.userInteractionEnabled = YES;
        [self addSubview:_bgView];
        
        UISwipeGestureRecognizer *leftSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
        leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
        [self.bgView addGestureRecognizer:leftSwipeGesture];
        
        UISwipeGestureRecognizer *rightSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
        rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
        [self.bgView addGestureRecognizer:rightSwipeGesture];
        
        _deleteButton = [[UIButton alloc]init];
        _deleteButton.backgroundColor = getColor(@"DFDFDF");
        [_deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_deleteButton];
        
        _deleteImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shoppingCar_cell_delete"]];
        [self.bgView addSubview:_deleteImageView];
    }
    return self;
}

-(void)layoutSubviews{
    offeseWitdh = 65;
    _bgView.frame = CGRectMake(0, 0, self.bounds.size.width + offeseWitdh, self.bounds.size.height);
    _deleteButton.frame = CGRectMake(self.bounds.size.width, 0, offeseWitdh, self.bounds.size.height);
    _deleteImageView.frame = CGRectMake(0, 0, 18, 18);
    _deleteImageView.center = _deleteButton.center;
}

-(void)leftSwipe:(UISwipeGestureRecognizer *)gesture{
    if (_bgView.frame.origin.x == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            _bgView.frame = CGRectOffset(_bgView.frame, -offeseWitdh+2, 0);
        }];
    }
}

-(void)rightSwipe:(UISwipeGestureRecognizer *)gesture{
    if (_bgView.frame.origin.x == -offeseWitdh+2) {
        [UIView animateWithDuration:0.25 animations:^{
            _bgView.frame = CGRectOffset(_bgView.frame, offeseWitdh-2, 0);
        }];
    }
}

-(void)deleteButtonClick{
    if (_block) {
        _block(_index);
    }
}

@end
