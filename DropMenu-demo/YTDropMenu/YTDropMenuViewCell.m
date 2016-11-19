//
//  YTDropMenuViewCell.m
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "YTDropMenuViewCell.h"

@implementation YTDropMenuViewCell

+ (instancetype)dropMenuCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"reuseCell";
    YTDropMenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.checkedView = [[UIImageView alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:cell.checkedView];
    }
    
    return cell;
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat checkedView_width = 17.0f;    
    
    self.checkedView.frame = CGRectMake((self.frame.size.width - checkedView_width * 1.5 ), self.frame.size.height/2 - checkedView_width/2, checkedView_width, checkedView_width);
    
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
