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
#import "CellChatTextLeft.h"
#import "CellChatTextRight.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "UIBarButtonItem+Custom.h"

@interface ViewController ()<UITextViewDelegate,YHExpressionKeyboardDelegate,UITableViewDelegate,UITableViewDataSource,CellChatTextLeftDelegate,CellChatTextRightDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YHExpressionKeyboard *v;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    
    [self _initNavigation];
    
    //tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = RGBCOLOR(244, 244, 244);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexColor = RGBCOLOR(160, 160, 160);
    [self.tableView registerClass:[CellChatTextLeft class] forCellReuseIdentifier:NSStringFromClass([CellChatTextLeft class])];
    [self.tableView registerClass:[CellChatTextRight class] forCellReuseIdentifier:NSStringFromClass([CellChatTextRight class])];
    [self.view addSubview:self.tableView];
    
    
    
    //表情键盘
    YHExpressionKeyboard *v = [[YHExpressionKeyboard alloc] initWithViewController:self aboveView:self.tableView];
    _v = v;
    [self.view addSubview:v];
    
}

- (void)_initNavigation{
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"YHExpressionKeyBoard";
    
    //设置导航栏背景颜色
    UIColor * color = [UIColor orangeColor];
    self.navigationController.navigationBar.barTintColor = color;
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor colorWithWhite:0.871 alpha:1.000];
    shadow.shadowOffset = CGSizeMake(0.5, 0.5);
    
    
    //设置导航栏标题颜色
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18],NSShadowAttributeName:shadow};
    
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    
    //设置返回按钮的颜色
    
    
    //左barButtonItem
    if (self.navigationController.viewControllers[0] != self) {
         self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftItemWithImgName:@"common_leftArrow" target:self selector:@selector(onLeft:)];
    }
   
    
    //右barButtonItem
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithImgName:@"common_rightArrow" target:self selector:@selector(onRight:)];
    
}

#pragma mark - Life
- (void)dealloc{
    DDLog(@"%s",__func__);
}

#pragma mark - Action
- (void)onLeft:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onRight:(UIButton*)sender{
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - @protocol UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataArray.count) {
        YHChatModel *model = self.dataArray[indexPath.row];
        if (model.direction == 0) {
            CellChatTextRight *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CellChatTextRight class])];
            cell.delegate = self;
            cell.indexPath = indexPath;
            [cell setupModel:model];
            return cell;
        }else{
            CellChatTextLeft *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CellChatTextLeft class])];
            cell.delegate = self;
            cell.indexPath = indexPath;
            [cell setupModel:model];
            return cell;
        }
    }
    return [UITableViewCell new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:   (NSInteger)section{
    return _dataArray.count;
}

#pragma mark - @protocol UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataArray.count) {
        YHChatModel *model = self.dataArray[indexPath.row];
        CGFloat height = 0;
        if (model.direction == 0) {
            height = [CellChatTextRight hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                CellChatTextRight *cell = (CellChatTextRight *)sourceCell;
                [cell setupModel:model];
            }];
            
            
        }else{
            height = [CellChatTextLeft hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                CellChatTextLeft *cell = (CellChatTextLeft *)sourceCell;
                [cell setupModel:model];
            }];
            
        }
        return height;
      
    }
    return 44.0f;
}

#pragma mark - @protocol CellChatTextLeftDelegate


#pragma mark - @protocol CellChatTextRightDelegate


#pragma mark - @protocol UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_v endEditing];
}

#pragma mark - @protocol YHExpressionKeyboardDelegate
//发送
- (void)didTapSendBtn:(NSString *)text{
    
    if (text.length) {
        //发送消息
        
        YHChatModel *model  = [YHChatModel new];
        model.speakerId     = @"1";
        model.speakerAvatar = nil;
        model.speakerName   = @"samuelandkevin";
        model.direction     = 0;
        model.msgType       = 1;
        model.audienceId    = @"2";
        model.chatType      = 0;
        model.chatId        = [NSString stringWithFormat:@"%ld",1000 + random()%1000];//本地消息记录ID是手动设置，等消息发送成功后将此替换。
        model.msgContent     = text;
        NSString *dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:dateFormat];
        NSString *createTime = [formatter stringFromDate:[NSDate date]];
        model.createTime  = createTime;
        
        [self.dataArray addObject:model];
        [self.tableView reloadData];
        [_v aboveViewScollToBottom];
    }
    
}

- (void)didSelectExtraItem:(NSString *)itemName{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:itemName message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didStartRecordingVoice{
   
}

- (void)didStopRecordingVoice{
   
}

- (void)didDragInside:(BOOL)inside{
    if (inside) {
        
    }else{
   
    }
}

- (void)didCancelRecordingVoice{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
