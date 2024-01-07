//
//  CatModel.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <Foundation/Foundation.h>
#import "CatCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatModel : NSObject

@property (copy, nonatomic, nullable) NSString *id;
@property (copy, nonatomic, nullable) NSString *url;
@property (assign, nonatomic) int width;
@property (assign, nonatomic) int height;
@property (copy, nonatomic, nullable) NSArray* categories;

+ (CatModel *)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
