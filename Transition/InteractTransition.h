//
//  InteractTransition.h
//  Transition
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InteractTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)bindInteractViewController:(UIViewController *)bindViewController;
@end

NS_ASSUME_NONNULL_END
