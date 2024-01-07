//
//  CatBreed.m
//  CheckRiteTest
//
//  Created by Alex on 07.01.2024.
//

#import "CatBreed.h"

@implementation CatBreed

+ (CatBreed *)initWithDictionary:(NSDictionary *)dictionary {
    
    CatBreed *obj = [[CatBreed alloc] init];
    
    obj.id = (NSString *)[dictionary objectForKey:@"id"];
    obj.name = (NSString *)[dictionary objectForKey:@"name"];
    obj.temperament = (NSString *)[dictionary objectForKey:@"temperament"];
    obj.origin = (NSString *)[dictionary objectForKey:@"origin"];
    obj.descriptionCat = (NSString *)[dictionary objectForKey:@"description"];
    obj.lifeSpan = (NSString *)[dictionary objectForKey:@"life_span"];
    
    return obj;
}

@end
