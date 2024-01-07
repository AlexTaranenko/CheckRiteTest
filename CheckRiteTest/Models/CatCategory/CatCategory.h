//
//  CatCategory.h
//  CheckRiteTest
//
//  Created by Alex on 07.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatCategory : NSObject

@property (assign, nonatomic) int id;
@property (copy, nonatomic, nullable) NSString *name;

+ (CatCategory *)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
