//
//  YTDropMenuViewCell.m
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "YTDropMenuViewCell.h"

@implementation YTDropMenuViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:13.0];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.checkedView = [[UIImageView alloc]init];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.checkedView];
        self.backgroundColor = [UIColor purpleColor];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat checkedView_width = 17.0f;    
    
    self.checkedView.frame = CGRectMake((self.frame.size.width - checkedView_width * 2 ), self.frame.size.height/2 - checkedView_width/2, checkedView_width, checkedView_width);
    
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
