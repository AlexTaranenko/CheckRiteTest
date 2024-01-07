//
//  DetailsViewModel.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "DetailsViewModel.h"
#import "CatCategory.h"
#import "ConnectionManager.h"
#import "CatBreed.h"
#import "CatCategory.h"

#define GET_CAT_DETAIL_URL @"https://api.thecatapi.com/v1/images/"

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

- (void)loadDetailCatWithCompletionBlock:(void (^)(BOOL succeeded, NSString* errorMsg))completionBlock {
    NSString *url = [NSString stringWithFormat:@"%@%@?api_key=%@", GET_CAT_DETAIL_URL, self.catModel.id, API_KEY];
    
    __weak __typeof(self) weakSelf = self;
    [ConnectionManager callGetMethod:url completionBlock:^(BOOL succeeded, id  _Nonnull responseData, NSString * _Nonnull errorMsg) {
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        if (succeeded) {
            strongSelf.catModel = [CatModel initWithDictionary:(NSDictionary *)responseData];
            completionBlock(succeeded, nil);
        } else {
            completionBlock(succeeded, errorMsg);
        }
    }];
}

- (NSString *)imageUrl {
    return self.catModel.url;
}

- (NSAttributedString *)infoCat {
    NSMutableAttributedString *mutString = [NSMutableAttributedString new];
    
    CatCategory *catCategory = (CatCategory *)[self.catModel.categories firstObject];
    if (catCategory != nil) {
        [mutString appendAttributedString:[self attributeInfo:@"Category" withInfo:[catCategory.name capitalizedString]]];
        [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    }
    
    CatBreed *catBreed = (CatBreed *)[self.catModel.breeds firstObject];
    if (catBreed != nil) {
        if (catBreed.name != nil) {
            [mutString appendAttributedString:[self attributeInfo:@"Name" withInfo:catBreed.name]];
            [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        }
        
        if (catBreed.temperament != nil) {
            [mutString appendAttributedString:[self attributeInfo:@"Temperament" withInfo:catBreed.temperament]];
            [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        }
        
        if (catBreed.origin != nil) {
            [mutString appendAttributedString:[self attributeInfo:@"Origin" withInfo:catBreed.origin]];
            [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        }
        
        if (catBreed.descriptionCat != nil) {
            [mutString appendAttributedString:[self attributeInfo:@"Description" withInfo:catBreed.descriptionCat]];
            [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        }
        
        if (catBreed.lifeSpan != nil) {
            [mutString appendAttributedString:[self attributeInfo:@"Lifespan" withInfo:catBreed.lifeSpan]];
        }
    }
    
    return mutString;
}

- (NSAttributedString *)attributeInfo:(NSString *)title withInfo:(NSString *)info {
    NSMutableAttributedString *mutString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: ", title] attributes:@{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:17]
    }];
    
    [mutString appendAttributedString:[[NSAttributedString alloc] initWithString:info attributes:@{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont systemFontOfSize:17]
    }]];
    
    return mutString;
}

@end
