//
//  DetailsViewController.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <UIKit/UIKit.h>
#import "DetailsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong, nonnull) DetailsViewModel *detailsViewModel;

+ (id)instantiate;

@end

NS_ASSUME_NONNULL_END
