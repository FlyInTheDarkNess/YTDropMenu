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
    self.backgroundImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImgView.clipsToBounds = YES;
    
    
    
    NSArray *arr = [NSArray arrayWithObjects:@"CELTICS",@"CLIPPERS",@"WARRIORS",nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"Teams" ToNavigationController:self.navigationController];
    NSArray *array = @[@"1",@"2",@"3"];
    [self.dropMenu setCelliconsArray:array];
    [self.dropMenu setAllColor:[UIColor colorWithRed:55/255.0f green:112/255.0f blue:126/255.0f alpha:1.0f]];
    self.dropMenu.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dropButtonClick:(id)sender {
    [self.dropMenu show];
    
}

- (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath{
    if([selIndexPath firstIndex] == 0){
        self.backgroundImgView.image = [UIImage imageNamed:@"a"];
    }
    
    if([selIndexPath firstIndex] == 1){
        self.backgroundImgView.image = [UIImage imageNamed:@"b"];
    }
    
    if([selIndexPath firstIndex] == 2){
        self.backgroundImgView.image = [UIImage imageNamed:@"c"];
    }
}


@end
