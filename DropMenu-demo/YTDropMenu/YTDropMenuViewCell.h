//
//  YTDropMenuViewCell.h
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTDropMenuViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView* checkedView;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
