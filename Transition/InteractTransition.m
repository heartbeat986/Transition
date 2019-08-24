//
//  InteractTransition.m
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "InteractTransition.h"

@interface InteractTransition ()
@property (nonatomic, strong) UIViewController * bindViewController;
@property (nonatomic, assign) CGFloat shouldComplate;
@end

@implementation InteractTransition
- (void)bindInteractViewController:(UIViewController *)bindViewController{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
    [bindViewController.view addGestureRecognizer:gesture];
    self.bindViewController = bindViewController;
}


- (void)panHandle:(UIPanGestureRecognizer *)gesture{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            self.interacting = true;
            [self.bindViewController dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGFloat y = translation.y;
            CGFloat ratio = fabs(y) / [UIScreen mainScreen].bounds.size.height;
            ratio = fminf(fmaxf(ratio, 0.0), 1.0);
            self.shouldComplate = (ratio > 0.5);
            NSLog(@"%f",ratio);
            [self updateInteractiveTransition:ratio];
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"UIGestureRecognizerStateCancelled");
            if(!self.shouldComplate){
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            break;
        }
        case UIGestureRecognizerStateEnded:{
             NSLog(@"UIGestureRecognizerStateEnded");
            self.interacting = NO;
            if (!self.shouldComplate) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}
@end
