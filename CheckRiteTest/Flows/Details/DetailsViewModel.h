//
//  DetailsViewModel.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <Foundation/Foundation.h>
#import "CatModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewModel : NSObject

- (instancetype)initWithCatModel:(CatModel *)catModel;

- (NSURL *)imageUrl;

- (NSString *)categoryName;

@end

NS_ASSUME_NONNULL_END
