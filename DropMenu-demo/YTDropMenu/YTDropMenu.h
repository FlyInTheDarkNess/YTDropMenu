//
//  YTDropMenu.h
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTDropMenuViewCell.h"


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

- (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath;

@end


@interface YTDropMenu : UIView

@property (nonatomic, weak) id <YTDropMenuDelegate> delegate;


- (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
            ToNavigationController:(UINavigationController *)navigationController;

- (void)show;

- (void)hide;

- (void)setAllColor;

@end
