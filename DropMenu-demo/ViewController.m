//
//  ViewController.m
//  DropMenu-demo
//
//  Created by yinjianchen on 18/11/2016.
//  Copyright © 2016 YinTokey. All rights reserved.
//

#import "ViewController.h"
#import "YTDropMenu.h"

@interface ViewController ()

@property (nonatomic,strong) YTDropMenu *dropMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@"gg",@"kk",@"ll"];
    self.dropMenu = [YTDropMenu initWithDataSource:arr NavTitile:@"HIHA" ToNavigationControllerView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dropButtonClick:(id)sender {

}

@end
