//
//  CatBreed.h
//  CheckRiteTest
//
//  Created by Alex on 07.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatBreed : NSObject

@property (copy, nonatomic, nullable) NSString *id;
@property (copy, nonatomic, nullable) NSString *name;
@property (copy, nonatomic, nullable) NSString *temperament;
@property (copy, nonatomic, nullable) NSString *origin;
@property (copy, nonatomic, nullable) NSString *descriptionCat;
@property (copy, nonatomic, nullable) NSString *lifeSpan;

+ (CatBreed *)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
