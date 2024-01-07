//
//  ConnectionManager.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <Foundation/Foundation.h>

#define API_KEY @"live_sjupe9dFm3mFNZRefzpapU5a3VGHegQtjmmEJl5uEICkoMB7j01BmNMQC0MatLM4"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectionManager : NSObject

+ (void)callGetMethod:(NSString *)webserviceUrl completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock;

+ (void)callPostMethod:(NSString *)webserviceUrl withDelegate:(id)delegate parameters:(NSString *)parameters completionBlock:(void (^)(BOOL succeeded, id  responseData ,NSString* errorMsg))completionBlock;

@end

NS_ASSUME_NONNULL_END
