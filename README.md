
# YHExpressionKeyBoard
仿微信表情键盘
## 效果图
<img src="https://github.com/samuelandkevin/YHExpressionKeyBoard/blob/master/Pics/pic1.png" width="40%" alt="还在路上，稍等..."/>
<img src="https://github.com/samuelandkevin/YHExpressionKeyBoard/blob/master/Pics/pic2.png" width="40%" alt="还在路上，稍等..."/>
<img src="https://github.com/samuelandkevin/YHExpressionKeyBoard/blob/master/Pics/pic3.png" width="40%" alt="还在路上，稍等..."/>


## 表情键盘初始化方式 
```
 YHExpressionKeyboard *v = [[YHExpressionKeyboard alloc] initWithViewController:self aboveView:scrV];
```

 ## 表情键盘代理 YHExpressionKeyboardDelegate 
 //点击某个item的事件
```
 -(void)didSelectExtraItem:(NSString *)itemName{ 

 }
```

//收起键盘
```
/**
 键盘上方视图内容滚动到键盘顶部(Note: 键盘上方视图是scrollView才有效)
 */
- (void)aboveViewScollToBottom;
```
 
<br>
表情键盘主要是用了UICollectionView实现，如果实现UICollectionView表情横排横滚动，可以参考我的另外一篇文章：</br>
[iOS- UICollectionView实现表情数据横排横滚动](http://blog.csdn.net/samuelandkevin/article/details/54963719)
<p>输入框最多显示4行，框高的变化动画是Masonry的约束动画实现。</p>

## 实际应用DEMO
关于实际应用,可以参考我的另一个即时通讯DEMO:</br>
[YHChat](https://github.com/samuelandkevin/YHChat)
<p>你的支持，我的动力！</p>
