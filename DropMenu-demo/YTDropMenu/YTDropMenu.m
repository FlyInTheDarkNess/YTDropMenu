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
@property (nonatomic, strong) NSArray *DataSourceArray;
@property (nonatomic, strong) NSMutableIndexSet *selIndexPath;

@end


@implementation YTDropMenu

    CGFloat defaultLineViewHeight = 0.4;
    CGFloat defaultCloseButtonHeight = 17.0;
    CGFloat defaultCloseButtonWidth = 17.0;
    CGFloat defaultNavViewHeight;

    static NSString *cellReuseID = @"reuseID";

- (instancetype)initWithDataSource:(NSArray *)array
                         NavTitile:(NSString *)title
            ToNavigationController:(UINavigationController *)navigationController
{

    defaultNavViewHeight = navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self){

    self.DataSourceArray = [NSArray arrayWithArray:array];
    self.selIndexPath = [[NSMutableIndexSet alloc]init];
        
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, defaultNavViewHeight)];
    self.navView.backgroundColor = [UIColor purpleColor];
        self.navView.alpha = 1.0;
        
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.navView addSubview:self.titleLabel];
        
    [self addSubview:self.navView];
    
    
  
        
        
        
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.navView.frame.size.height, ScreenWidth, defaultLineViewHeight)];
    self.lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.lineView];
    
    self.closeButton = [[UIButton alloc]initWithFrame:CGRectMake((self.navView.frame.size.width-defaultCloseButtonWidth * 2 -3), self.navView.frame.size.height/2 - defaultLineViewHeight/2, defaultCloseButtonWidth, defaultCloseButtonHeight)];
    [self.closeButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    self.tableView = [[UITableView alloc]init];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.tableView];

    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        
    [navigationController.view addSubview:self];
    self.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    YTDropMenuViewCell *cell = [[YTDropMenuViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    
    self.titleLabel.frame = CGRectMake(0, self.closeButton.frame.origin.y - 3, self.navView.frame.size.width, defaultNavViewHeight/3);
    
    if(_DataSourceArray.count<=8){
        self.tableView.frame= CGRectMake(0, self.lineView.frame.origin.y+self.lineView.frame.size.height, ScreenWidth, cell.frame.size.height * _DataSourceArray.count);
    }else{
        self.tableView.frame= CGRectMake(0, self.lineView.frame.origin.y+self.lineView.frame.size.height, ScreenWidth, cell.frame.size.height * 8);
    }
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _DataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YTDropMenuViewCell *cell = [[YTDropMenuViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    if ([self.selIndexPath containsIndex:indexPath.row]){
            cell.checkedView.image = [UIImage imageNamed:@"check"];
        } else {
            cell.checkedView.image = nil;
        }
    cell.textLabel.text = [_DataSourceArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.selIndexPath removeAllIndexes];
    [self.selIndexPath addIndex:indexPath.row];
    [self.tableView reloadData];

}

- (void)closeClick{
    [self hide];
}

- (void)show{
    self.hidden = NO;
}

- (void)hide{
    
    if ([self.delegate respondsToSelector:@selector(dropMenu:didSelectIndexPath:)]) {
        [self.delegate dropMenu:self didSelectIndexPath:self.selIndexPath];
    }
    
    self.hidden = YES;
    
    
}


@end
