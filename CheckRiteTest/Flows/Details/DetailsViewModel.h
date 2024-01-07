//
//  DetailsViewModel.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CatModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewModel : NSObject

- (instancetype)initWithCatModel:(CatModel *)catModel;

- (void)loadDetailCatWithCompletionBlock:(void (^)(BOOL succeeded, NSString* errorMsg))completionBlock;

- (NSString *)imageUrl;

- (NSAttributedString *)infoCat;

@end

NS_ASSUME_NONNULL_END
