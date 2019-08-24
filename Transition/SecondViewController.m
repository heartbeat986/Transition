//
//  SecondViewController.m
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildSubviews];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)buildSubviews{
    UIButton *modal = [[UIButton alloc] init];
    [modal setTitle:@"Dismiss" forState:UIControlStateNormal];
    modal.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
    modal.bounds = CGRectMake(0, 0, 100, 50);
    [self.view addSubview:modal];
    [modal addTarget:self action:@selector(toDismiss) forControlEvents:UIControlEventTouchUpInside];
}

- (void)toDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
