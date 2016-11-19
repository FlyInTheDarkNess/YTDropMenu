//
//  YTDropMenu.m
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "YTDropMenu.h"


@interface YTDropMenu ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSString *navTitle;
@property (nonatomic, strong) YTViewModel *viewModel;


//@property (nonatomic,strong) UIView *mainView;

@end


@implementation YTDropMenu

+ (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
        ToNavigationControllerView:(UIView *)navigationControllerView{

    CGFloat defaultNavViewHeight = 55.0;
    CGFloat defaultLineViewHeight = 0.4;
    CGFloat defaultCloseButtonHeight = 36.0;
    CGFloat defaultCloseButtonWidth = 36.0;
    
    
    YTDropMenu *dropMenu = [[YTDropMenu alloc]initWithFrame:[UIScreen mainScreen].bounds];
    dropMenu.viewModel = [[YTViewModel alloc]init];
    
    dropMenu.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, defaultNavViewHeight)];
    [dropMenu addSubview:dropMenu.navView];
    
    dropMenu.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, dropMenu.navView.frame.size.height, ScreenWidth, defaultLineViewHeight)];
    dropMenu.lineView.backgroundColor = [UIColor blackColor];
    [dropMenu addSubview:dropMenu.lineView];
    
    dropMenu.closeButton = [[UIButton alloc]initWithFrame:CGRectMake((dropMenu.navView.frame.size.width-defaultCloseButtonWidth -5 ), dropMenu.navView.frame.size.height/2 - defaultLineViewHeight/2, defaultCloseButtonWidth, defaultCloseButtonHeight)];
    [dropMenu.closeButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [dropMenu.closeButton addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    [dropMenu addSubview:dropMenu.closeButton];
    
    YTDropMenuViewCell *cell = [YTDropMenuViewCell dropMenuCellWithTableView:dropMenu.tableView];
    if(array.count <= 8){
        dropMenu.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, cell.bounds.size.height * array.count)];
    }else{
       dropMenu.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, cell.bounds.size.height * 8)];
        
    }
    [dropMenu.tableView setSeparatorInset:UIEdgeInsetsZero];
    [dropMenu.tableView setLayoutMargins:UIEdgeInsetsZero];
    dropMenu.tableView.dataSource = dropMenu.viewModel;
    dropMenu.tableView.delegate = dropMenu.viewModel;
    [dropMenu addSubview:dropMenu.tableView];
    
    dropMenu.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, dropMenu.tableView.frame.origin.y+dropMenu.tableView.bounds.size.height, ScreenWidth, ScreenHeight-dropMenu.maskView.frame.origin.y)];
    dropMenu.maskView.alpha = 0.9f;
    dropMenu.maskView.backgroundColor = [UIColor lightGrayColor];
    [dropMenu addSubview:dropMenu.maskView];
    
    [navigationControllerView addSubview:dropMenu];
  //  dropMenu.hidden = YES;
    
    return dropMenu;
}

#pragma mark - UITableView DataSource





- (void)closeClick{
    NSLog(@"closeClick");
}


@end
