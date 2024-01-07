//
//  MainViewModel.m
//  CheckRiteTest
//
//  Created by Alex on 05.01.2024.
//

#import "MainViewModel.h"
#import "ConnectionManager.h"
#import "CatModel.h"

#define GET_CATS_URL @"https://api.thecatapi.com/v1/images/search?limit=10"
#define API_KEY @"live_sjupe9dFm3mFNZRefzpapU5a3VGHegQtjmmEJl5uEICkoMB7j01BmNMQC0MatLM4"

@implementation MainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)getImagesWithCompletionBlock:(void (^)(BOOL succeeded, NSString* errorMsg))completionBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@&api_key=%@", GET_CATS_URL, API_KEY];
    
    __weak __typeof(self) weakSelf = self;
    [ConnectionManager callGetMethod:url completionBlock:^(BOOL succeeded, id  responseData, NSString * _Nonnull errorMsg) {
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        if (succeeded) {
            [strongSelf parseCatsToModels:(NSArray *) responseData];
            completionBlock(succeeded, nil);
        } else {
            completionBlock(succeeded, errorMsg);
        }
    }];
}

- (void)parseCatsToModels: (NSArray *)responseData {
    NSMutableArray *tempArray = [NSMutableArray new];
    for (NSDictionary *dict in responseData) {
        [tempArray addObject:[CatModel initWithDictionary:dict]];
    }
    
    self.cats = tempArray;
}

@end
