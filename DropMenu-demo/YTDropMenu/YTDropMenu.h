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
/*
 *  single select
 */
- (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath;
/*
 *  multi select
 */
- (void)dropMenu:(YTDropMenu *)dropMenu didMultiSelectIndexPaths:(NSIndexSet *)selIndexSet;
@end


@interface YTDropMenu : UIView

@property (nonatomic,assign)BOOL isMultiselect;

@property (nonatomic,strong)UIColor *allColor;

@property (nonatomic, weak) id <YTDropMenuDelegate> delegate;

@property (nonatomic,strong)NSMutableArray *iconsArray;

- (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
            ToNavigationController:(UINavigationController *)navigationController;

- (void)show;

- (void)hide;

- (void)setAllColor:(UIColor *)color;

- (void)setCelliconsArray:(NSArray *)imageStrArray;

@end
