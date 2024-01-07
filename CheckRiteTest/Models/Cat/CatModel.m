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
    
    NSArray *categories = (NSArray *)[dictionary objectForKey:@"categories"];
    if (categories.count > 0) {
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *categoryDict in categories) {
            [temp addObject:[CatCategory initWithDictionary:categoryDict]];
        }
        obj.categories = [temp mutableCopy];
    }
    
    return obj;
}

@end
