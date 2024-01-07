//
//  CatCategory.m
//  CheckRiteTest
//
//  Created by Alex on 07.01.2024.
//

#import "CatCategory.h"

@implementation CatCategory

+ (CatCategory *)initWithDictionary: (NSDictionary *)dictionary {
    CatCategory *obj = [[CatCategory alloc] init];
    
    obj.id = [(NSNumber *)[dictionary objectForKey:@"id"] intValue];
    obj.name = (NSString *)[dictionary objectForKey:@"name"];
    
    return obj;
}

@end
