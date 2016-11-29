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
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImgView;

@property (nonatomic,strong) YTDropMenu *dropMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = [NSArray arrayWithObjects:@"CELTICS",@"CLIPPERS",@"WARRIORS",nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"Teams" ToNavigationController:self.navigationController];
    NSArray *array = @[@"1",@"2",@"3"];
    [self.dropMenu setCelliconsArray:array];
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
    if([selIndexPath firstIndex] == 0){
    
    }
    
    if([selIndexPath firstIndex] == 1){
    
    }
    
    if([selIndexPath firstIndex] == 1){
    
    }
}


@end
