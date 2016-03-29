# swipeDismiss
swipe down to dismiss present view controller 

Need iOS 7+

基于Apple于iOS7一同推出的新的试图控制器切换API，切换动画使用了代理UIViewControllerAnimatedTransitioning，而���手势交互部分则重写了UIPercentDrivenInteractiveTransition。
我们可以在新的Music app上看到这种下滑关闭页面的效果。

注：使用该动画后，页面dismiss后不会走dealloc，目前还没有找到原因。因此如果你要销毁Timer或者通知的话，可以在viewdiddisappeardisappear中进行。
WARN:Dealloc will not run when the view conttoller is dismissed! The reason has not be founded!
