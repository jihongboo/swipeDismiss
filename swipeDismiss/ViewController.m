//
//  ViewController.m
//  swipeDismiss
//
//  Created by 纪洪波 on 16/3/29.
//  Copyright © 2016年 Zac. All rights reserved.
//

#import "ViewController.h"
#import "DismissAnimation.h"
#import "PresentedAnimation.h"
#import "SwipeUpInteractiveTransition.h"

@interface ViewController ()
@property (nonatomic, strong) SwipeUpInteractiveTransition *interactiveTransition;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)presentAction:(id)sender {
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor redColor];
    _interactiveTransition = [[SwipeUpInteractiveTransition alloc]init:VC];
    VC.transitioningDelegate = self;
    [self presentViewController:VC animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[PresentedAnimation alloc]init];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[DismissAnimation alloc]init];
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return (self.interactiveTransition.isInteracting ? self.interactiveTransition : nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"deallloc");
}

@end
