//
//  Storyboard.m
//  CheckRiteTest
//
//  Created by Alex on 05.01.2024.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (id)instantiate:(NSString *)storyboardName withIdentifier:(NSString *)identifier {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

@end
