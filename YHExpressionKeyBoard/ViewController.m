//
//  ViewController.m
//  YHExpressionKeyBoard
//
//  Created by samuelandkevin on 17/2/13.
//  Copyright © 2017年 samuelandkevin. All rights reserved.
//

#import "ViewController.h"
#import "YYKit.h"
#import "YHExpressionKeyboard.h"
#import "Masonry.h"

@interface ViewController ()<UITextViewDelegate,YHExpressionKeyboardDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) YHExpressionKeyboard *v;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initNavigation];
    
    UIScrollView *scrV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrV.backgroundColor = [UIColor orangeColor];
    scrV.contentSize = CGSizeMake(kScreenWidth, kScreenHeight+64);
    scrV.delegate = self;
    [self.view addSubview:scrV];
    
    //表情键盘
    YHExpressionKeyboard *v = [[YHExpressionKeyboard alloc] initWithViewController:self];
    _v = v;
    [self.view addSubview:v];
    
}

- (void)_initNavigation{
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"YHExpressionKeyBoard";
    
    //设置导航栏背景颜色
    UIColor * color = UIColorHex(0e92dd);
    self.navigationController.navigationBar.barTintColor = color;
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor colorWithWhite:0.871 alpha:1.000];
    shadow.shadowOffset = CGSizeMake(0.5, 0.5);
    //    shadow.shadowBlurRadius = 20;
    
    
    //设置导航栏标题颜色
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18],NSShadowAttributeName:shadow};
    
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    
    //设置返回按钮的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

#pragma mark - @protocol UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_v endEditing];
}

#pragma mark - @protocol YHExpressionKeyboardDelegate
- (void)didSelectExtraItem:(NSString *)itemName{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:itemName message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
      
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
   
}

- (void)sendBtnDidTap:(NSString *)text{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
