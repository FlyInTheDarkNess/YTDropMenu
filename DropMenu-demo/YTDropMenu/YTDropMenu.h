//
//  YTDropMenu.h
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTDropMenuViewCell.h"
#import "YTViewModel.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

@class YTDropMenu;
@protocol YTDropMenuDelegate <NSObject>


@optional
/*
 *  Config the cell
 */
- (void)configCell:(CGFloat)rowHeight
   BackgroundColor:(UIColor *)backgroundColor
              Font:(UIFont *)font
       CancelImage:(UIImage *)cancelImage
        CheckImage:(UIImage *)checkImage;



@end


@interface YTDropMenu : UIView

@property (nonatomic, strong) NSMutableIndexSet *selectedIndexes;

+ (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
        ToNavigationControllerView:(UIView *)navigationControllerView;


@end
