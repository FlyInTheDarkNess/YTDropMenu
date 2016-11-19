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
    NSArray *arr = [NSArray arrayWithObjects:@"gs",@"ddd",@"rrrr" ,nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"HIHA" ToNavigationController:self.navigationController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dropButtonClick:(id)sender {

}

@end
