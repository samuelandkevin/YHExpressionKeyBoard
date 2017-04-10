# YHExpressionKeyBoard
仿微信表情键盘
## 效果图
<img src="http://img.blog.csdn.net/20170214170540043?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvc2FtdWVsYW5ka2V2aW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" width = "320" height = "568" alt="pic5" 
align=center /> <img src="http://img.blog.csdn.net/20170401084424393?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvc2FtdWVsYW5ka2V2aW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" width = "320" height = "568" alt="pic5" 
align=center /></br>


## 初始化方式 
//表情键盘 <br>
```
 YHExpressionKeyboard *v = [[YHExpressionKeyboard alloc] initWithViewController:self aboveView:scrV];
```

 ## 表情键盘代理 
<br>
 ## pragma mark - @protocol YHExpressionKeyboardDelegate 
 <br>
 ```
 - (void)didSelectExtraItem:(NSString *)itemName{ 
    //在这处理点击某个item的事件<br>
 }
 ```

表情键盘主要是用了UICollectionView实现，如果实现UICollectionView表情横排横滚动，可以参考我的另外一篇文章：<br>
[iOS- UICollectionView实现表情数据横排横滚动](http://blog.csdn.net/samuelandkevin/article/details/54963719)<br>
输入框最多显示4行，框高的变化动画是Masonry的约束动画实现。<br>
<p>你的支持，我的动力！</p>
