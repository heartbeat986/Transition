//
//  ViewController.m
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "PresentTransition.h"
#import "DismissTransition.h"
#import "InteractTransition.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) PresentTransition * present;
@property (nonatomic, strong) DismissTransition  * dissmiss;
@property (nonatomic, strong) InteractTransition * interact;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildSubviews];
    self.present = [[PresentTransition alloc] init];
    self.dissmiss = [[DismissTransition alloc] init];
    self.interact = [[InteractTransition alloc] init];
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)buildSubviews{
    UIButton *modal = [[UIButton alloc] init];
    [modal setTitle:@"Present" forState:UIControlStateNormal];
    modal.center = self.view.center;
    modal.bounds = CGRectMake(0, 0, 100, 50);
    [self.view addSubview:modal];
    [modal addTarget:self action:@selector(toModal) forControlEvents:UIControlEventTouchUpInside];
}

- (void)toModal{
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.transitioningDelegate = self;
    [self.interact bindInteractViewController:secondVc];
    [self presentViewController:secondVc animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.present;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.dissmiss;
}

-  (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.interact.interacting ? self.interact:nil;
}


@end
