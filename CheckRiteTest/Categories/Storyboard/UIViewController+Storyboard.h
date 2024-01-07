//
//  Storyboard.h
//  CheckRiteTest
//
//  Created by Alex on 05.01.2024.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

+ (id)instantiate: (NSString *)storyboardName withIdentifier: (NSString *)identifier;

@end

