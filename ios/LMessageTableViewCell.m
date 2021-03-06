//
//  LMessageTableViewCell.m
//  LiveKit
//
//  Created by 文宗 on 16/9/20.
//  Copyright © 2016年 Yuanyin Guoji. All rights reserved.
//

#import "LMessageTableViewCell.h"
#import "sSDStatus.h"

@implementation LMessageTableViewCell
+ (LMessageTableViewCell *)cellWithTableView:(UITableView *)tableView{
    //全局静态变量
    static NSString *ID = @"lalala";
    
    LMessageTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[LMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加子控件
        //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        _iconView = iconView;
        _iconView.layer.cornerRadius = 10;
        _iconView.layer.masksToBounds = YES;
        _iconView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:iconView];
        //文字
        UILabel *textLabel = [[UILabel alloc] init];
        _CommentLabel = textLabel;
        _CommentLabel.layer.cornerRadius = 10;
        _CommentLabel.layer.masksToBounds = YES;
        _CommentLabel.font = [UIFont systemFontOfSize:14];
        _CommentLabel.numberOfLines = 0;  //换行
        //_CommentLabel.backgroundColor = [UIColor clearColor];
        _CommentLabel.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.3];
        [self.contentView addSubview:textLabel];
        
//        UILabel *UserLabel = [[UILabel alloc]init];
//        _UserName = UserLabel;
//        _UserName.font = [UIFont systemFontOfSize:14];
//        _UserName.numberOfLines = 0;  //换行
//        [self.contentView addSubview:textLabel];
        
    }
    return self;
}

- (void)setStatusFrame:(LiveCellFrame *)statusFrame{
    
    _statusFrame = statusFrame;
    
    [self settingData];
    
    [self settingFrame];
}
//设置内容数据
- (void)settingData{
    sSDStatus *status = _statusFrame.status;
    //设置头像
    _iconView.image = [UIImage imageNamed:status.icon];
    //设置评论的内容
    _CommentLabel.text = status.text;
   // _UserName.text = status.UserName;
    _CommentLabel.textColor = [UIColor whiteColor];
}
//设置子控件的大小
- (void)settingFrame{
    //头像位置
    _iconView.frame = _statusFrame.iconF;
    //评论位置
    _CommentLabel.frame = _statusFrame.textF;
  
    [self.contentView addSubview:_iconView];
    [self.contentView addSubview:_CommentLabel];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
