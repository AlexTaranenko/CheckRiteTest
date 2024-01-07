//
//  DetailsViewModel.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "DetailsViewModel.h"
#import "CatCategory.h"

@interface DetailsViewModel ()

@property (strong, nonatomic) CatModel* catModel;

@end

@implementation DetailsViewModel

- (instancetype)initWithCatModel:(CatModel *)catModel {
    self = [super init];
    if (self) {
        self.catModel = catModel;
    }
    return  self;
}

- (NSURL *)imageUrl {
    return [NSURL URLWithString:self.catModel.url];
}

- (NSString *)categoryName {
    if (self.catModel.categories.count > 0) {
        return [(CatCategory *)[self.catModel.categories firstObject] name];
    }
    return nil;
}

@end
