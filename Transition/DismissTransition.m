//
//  DismissTransition.m
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "DismissTransition.h"

@implementation DismissTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect initFram = [transitionContext initialFrameForViewController:fromVc];
    NSLog(@"初始化frame:%@",NSStringFromCGRect(initFram));
    fromVc.view.center = CGPointMake(initFram.size.width * 0.5, initFram.size.height * 0.5);
    fromVc.view.bounds = CGRectMake(0, 0, initFram.size.width, initFram.size.height);
    fromVc.view.alpha = 1;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [containerView sendSubviewToBack:toVc.view];
    
    [UIView animateWithDuration:0.5 animations:^{
        fromVc.view.alpha = 0;
        fromVc.view.frame = CGRectMake(initFram.size.width * 0.5, initFram.size.height * 0.5, 0, 0);
    } completion:^(BOOL finished) {
       [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
