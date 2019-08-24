//
//  PresentTransition.m
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "PresentTransition.h"

@implementation PresentTransition


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    toVc.view.center = CGPointMake(finalFrame.size.width * 0.5, finalFrame.size.height * 0.5);
    toVc.view.bounds = CGRectZero;
    
    NSLog(@"最后的frame:%@",NSStringFromCGRect(finalFrame));
    toVc.view.alpha = 0;
    
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    
    [UIView animateWithDuration:0.5 animations:^{
        toVc.view.alpha = 1;
        toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
         [transitionContext completeTransition:YES];
    }];
}

@end
