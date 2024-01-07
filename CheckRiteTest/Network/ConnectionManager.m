//
//  ConnectionManager.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "ConnectionManager.h"

@implementation ConnectionManager

+ (void)callGetMethod:(nonnull NSString *)webserviceUrl completionBlock:(nonnull void (^)(BOOL, id, NSString *))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:webserviceUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
        {
            
            NSString *jsonString = [[NSString alloc] initWithData:data
                                                         encoding:NSUTF8StringEncoding];
            
            NSLog(@"Response:%@ %@\n", jsonString, error);
            if (error) {
                completionBlock(NO, nil, error.localizedDescription);
            } else {
                id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                completionBlock(YES, dict, nil);
            }
        }];
        
        [dataTask resume];
}

+ (void)callPostMethod:(nonnull NSString *)webserviceUrl withDelegate:(nonnull id)delegate parameters:(nonnull NSString *)parameters completionBlock:(nonnull void (^)(BOOL, id, NSString *))completionBlock {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:webserviceUrl];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
        NSLog(@"Response:%@ %@\n", response, error);
        if (error) {
            completionBlock(NO, nil, error.localizedDescription);
        } else {
            completionBlock(YES, data, nil);
        }
    }];
    [dataTask resume];
}

@end
