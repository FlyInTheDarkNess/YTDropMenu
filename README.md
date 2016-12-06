# YTDropMenu
A drop menu with cancel button.
![](https://github.com/YinTokey/YTDropMenu/blob/master/menu.gif?raw=true)
# 使用方法：
```
#import "YTDropMenu.h"
```
```
@interface ViewController ()<YTDropMenuDelegate>
@property (nonatomic,strong) YTDropMenu *dropMenu;

```
```
    // 设置标题数组
    NSArray *arr = [NSArray arrayWithObjects:@"CELTICS",@"CLIPPERS",@"WARRIORS",nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"Teams" ToNavigationController:self.navigationController];
    self.dropMenu.delegate = self;
    
    // 设置图片数组，如果不需要展示图片，这一步可以不做
    NSArray *array = @[@"1",@"2",@"3"];
    [self.dropMenu setCelliconsArray:array];
    
    //设置背景颜色
    [self.dropMenu setAllColor:[UIColor colorWithRed:55/255.0f green:112/255.0f blue:126/255.0f alpha:1.0f]];
 ```
 
 ```
 //调用， 显示它
 - (IBAction)dropButtonClick:(id)sender {
    [self.dropMenu show];
}
 ```
 ```
 // 实现代理方法，定位到点击的indexPath
 - (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath
 ```
