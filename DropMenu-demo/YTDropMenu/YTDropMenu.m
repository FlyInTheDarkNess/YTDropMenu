//
//  YTDropMenu.m
//  DropMenu-demo
//
//  Created by yinjianchen on 19/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "YTDropMenu.h"


@interface YTDropMenu ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSString *navTitle;
@property (nonatomic,strong) NSArray *DataSourceArray;

@end


@implementation YTDropMenu

    CGFloat defaultLineViewHeight = 0.4;
    CGFloat defaultCloseButtonHeight = 28.0;
    CGFloat defaultCloseButtonWidth = 28.0;
    CGFloat defaultNavViewHeight;

- (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
            ToNavigationController:(UINavigationController *)navigationController{

    defaultNavViewHeight = navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self){
   // dropMenu.viewModel = [[YTViewModel alloc]init];

    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, defaultNavViewHeight)];
    [self addSubview:self.navView];
        
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.navView.frame.size.height, ScreenWidth, defaultLineViewHeight)];
    self.lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.lineView];
    
    self.closeButton = [[UIButton alloc]initWithFrame:CGRectMake((self.navView.frame.size.width-defaultCloseButtonWidth -5 ), self.navView.frame.size.height/2 - defaultLineViewHeight/2, defaultCloseButtonWidth, defaultCloseButtonHeight)];
    [self.closeButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    self.tableView = [[UITableView alloc]init];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.tableView];
    self.DataSourceArray = [NSArray arrayWithArray:array];
        
    self.maskView = [[UIView alloc]init];
    self.maskView.alpha = 0.9f;
    self.maskView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.maskView];
    
    [navigationController.view addSubview:self];
    self.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    YTDropMenuViewCell *cell = [YTDropMenuViewCell dropMenuCellWithTableView:self.tableView];
    if(array.count <= 8){
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.lineView.frame.origin.y+self.lineView.frame.size.height, ScreenWidth, cell.frame.size.height * array.count)];
    }else{
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.lineView.frame.origin.y+self.lineView.frame.size.height, ScreenWidth, cell.frame.size.height * 8)];
    }
    
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, self.tableView.frame.origin.y+self.tableView.bounds.size.height, ScreenWidth, ScreenHeight-self.maskView.frame.origin.y)];
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if ([self.selectedIndexes containsIndex:indexPath.row]) {
    //        cell.rightImageView.image = [UIImage imageNamed:@"checkMark"];
    //    } else {
    //        cell.rightImageView.image = nil;
    //    }
    YTDropMenuViewCell *cell = [YTDropMenuViewCell dropMenuCellWithTableView:tableView];
    cell.textLabel.text = self.DataSourceArray[indexPath.row];
    return cell;
}



- (void)closeClick{
    NSLog(@"closeClick");
}


@end
