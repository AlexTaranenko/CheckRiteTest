//
//  MainViewModel.h
//  CheckRiteTest
//
//  Created by Alex on 05.01.2024.
//

#import <Foundation/Foundation.h>

@interface MainViewModel : NSObject

@property (strong, nonatomic) NSArray *cats;

- (instancetype)init;

- (void)getImagesWithCompletionBlock:(void (^)(BOOL succeeded, NSString* errorMsg))completionBlock;

@end

