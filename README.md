# YTDropMenu
A drop menu with cancel button.
![](https://github.com/YinTokey/YTDropMenu/blob/master/menu.gif?raw=true)
# Useage
```
#import "YTDropMenu.h"
```
```
@interface ViewController ()<YTDropMenuDelegate>
@property (nonatomic,strong) YTDropMenu *dropMenu;

```
```
    // Set up titile array
    NSArray *arr = [NSArray arrayWithObjects:@"CELTICS",@"CLIPPERS",@"WARRIORS",nil];
    self.dropMenu = [[YTDropMenu alloc ]initWithDataSource:arr NavTitile:@"Teams" ToNavigationController:self.navigationController];
    self.dropMenu.delegate = self;
    
    // Set the images array, if you do not need to display imagess, skip this step
    NSArray *array = @[@"1",@"2",@"3"];
    [self.dropMenu setCelliconsArray:array];
    
    // Set background color
    [self.dropMenu setAllColor:[UIColor colorWithRed:55/255.0f green:112/255.0f blue:126/255.0f alpha:1.0f]];
 ```
 
 ```
 // Show it
 - (IBAction)dropButtonClick:(id)sender {
    [self.dropMenu show];
}
 ```
 ```
 // delegate , indexPath ,just like the useage of tableview
 - (void)dropMenu:(YTDropMenu *)dropMenu didSelectIndexPath:(NSIndexSet *)selIndexPath
 ```
