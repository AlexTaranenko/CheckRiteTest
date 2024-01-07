//
//  CatModel.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "CatModel.h"

@implementation CatModel

+ (CatModel *)initWithDictionary:(NSDictionary *)dictionary {
    CatModel *obj = [[CatModel alloc] init];
    
    obj.id = (NSString *)[dictionary objectForKey:@"id"];
    obj.url = (NSString *)[dictionary objectForKey:@"url"];
    obj.width = [(NSNumber *)[dictionary objectForKey:@"width"] intValue];
    obj.height = [(NSNumber *)[dictionary objectForKey:@"height"] intValue];
        
    obj.categories = [self parseCategories:dictionary];
    obj.breeds = [self parseBreeds:dictionary];
    
    return obj;
}

+ (NSArray *)parseCategories:(NSDictionary *)dictionary {
    NSArray *categories = (NSArray *)[dictionary objectForKey:@"categories"];
    NSMutableArray *temp = [NSMutableArray new];
    
    if (categories.count > 0) {
        for (NSDictionary *categoryDict in categories) {
            [temp addObject:[CatCategory initWithDictionary:categoryDict]];
        }
    }
    
    return [temp mutableCopy];
}

+ (NSArray *)parseBreeds:(NSDictionary *)dictionary {
    NSArray *breeds = (NSArray *)[dictionary objectForKey:@"breeds"];
    NSMutableArray *temp = [NSMutableArray new];
    
    if (breeds.count > 0) {
        for (NSDictionary *breedDict in breeds) {
            [temp addObject:[CatBreed initWithDictionary:breedDict]];
        }
    }

    return [temp mutableCopy];
}

@end
