//
//  SmartTableViewCell.m
//  PaintingAddiction
//
//  Created by 李莹 on 14-4-8.
//  Copyright (c) 2014年 Binly Lee. All rights reserved.
//

#import "SmartTableViewCell.h"

@implementation SmartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

+(NSString *)cellIdentifier{
    return NSStringFromClass([self class]);
}

+ (id)cellForTableView:(UITableView *)tableView{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[self alloc] initWithCellIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id) initWithCellIdentifier:(NSString *)cellID{
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
}

+ (CGFloat) heightForCellWithContent:(id)content{
    return 60;
}

@end
