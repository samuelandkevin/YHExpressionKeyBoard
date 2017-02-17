# YHExpressionKeyBoard
仿微信表情键盘
## 效果图
[img](http://)
## 初始化方式 
//表情键盘 <br>
 在控制器中 <br>
 YHExpressionKeyboard *v = [[YHExpressionKeyboard alloc] initWithViewController:self];<br>
 [self.view addSubview:v]<br>
 ## 表情键盘代理 <br>
#pragma mark - @protocol YHExpressionKeyboardDelegate <br>
// - (void)didSelectExtraItem:(NSString *)itemName{ <br>
    //在这处理点击某个item的事件<br>
   <br>
}<br>
表情键盘主要是用了UICollectionView实现，如果实现UICollectionView表情横排横滚动，可以参考我的另外一篇文章：<br>
[iOS- UICollectionView实现表情数据横排横滚动](http://blog.csdn.net/samuelandkevin/article/details/54963719)<br>
输入框最多显示4行，框高的变化动画是Masonry的约束动画实现。
