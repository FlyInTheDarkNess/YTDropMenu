//
//  ViewController.m
//  DropMenu-demo
//
//  Created by yinjianchen on 18/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "ViewController.h"
#import "YTDropMenu.h"

@interface ViewController ()<YTDropMenuDelegate>

@property (nonatomic,strong) YTDropMenu *dropMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = [NSArray arrayWithObjects:@"gs",@"ddd",@"rrrr",@"asdfs" ,nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"HIHA" ToNavigationController:self.navigationController];
    self.dropMenu.isMultiselect = YES;
    self.dropMenu.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dropButtonClick:(id)sender {
    [self.dropMenu show];
    
    [self.dropMenu setAllColor:[UIColor blackColor]];
}

- (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath{
    NSLog(@"selected index  %ld", [selIndexPath firstIndex]);
}

- (void)dropMenu:(YTDropMenu *)dropMenu didMultiSelectIndexPaths:(NSIndexSet *)selIndexSet{
    NSLog(@"mutiselected %@",selIndexSet.description);
}

@end
