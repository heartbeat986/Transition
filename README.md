# Transition
转场动画学习
## 概念
### 转场代理

* 协议: 遵守`UIViewControllerTransitioningDelegate`协议的对象
* 作用:告诉系统，我们需要使用自定义的转场，不需要系统的
* 关键方法:
```
// 为展示控制器提供动画对象
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
// 为隐藏控制器提供动画对象
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
// 为手势驱动展示控制器提供交互对象
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;
// 为手势驱动隐藏控制器提供交互对象
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0);
```


### 动画对象
* 协议:
遵守`UIViewControllerAnimatedTransitioning`协议的对象

* 作用:
告诉系统应该怎么动画。
* 关键方法
```
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
}
```
### 交互控制
* 协议: 遵守`UIViewControllerInteractiveTransitioning`协议的对象
* 作用: 转场以交互驱动
* 关键方法
```
// 更新交互状态(percentComplete的值在0.0-1.0)
- (void)updateInteractiveTransition:(CGFloat)percentComplete;
// 取消交互转场，返回到初始状态
- (void)cancelInteractiveTransition;
// 完成交互转场
- (void)finishInteractiveTransition;
```

### 转场上下文
* 作用: 拿到转场所需要的内容，提供转场环境；
* 协议: `UIViewControllerContextTransitioning`遵守这个协议的对象
* 关键方法
```
// 获取控制器,key有以下两种:
//   UITransitionContextToViewControllerKey
//   UITransitionContextFromViewControllerKey
- (nullable __kindof UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key;
// 获取视图,key有以下两种:
//   UITransitionContextToViewKey
//   UITransitionContextFromViewKey
- (nullable __kindof UIView *)viewForKey:(UITransitionContextViewKey)key;
// 拿到转场的容器，需要把显现的视图添加进来。
- (UIView *)containerView;
```
