//
//  LoadImage.m
//  CheckRiteTest
//
//  Created by Alex on 07.01.2024.
//

#import "UIImageView+LoadImage.h"
#import <SDWebImage/SDWebImage.h>

@implementation UIImageView (LoadImage)

- (void)loadImage:(NSString *)url {
    self.sd_imageIndicator = SDWebImageActivityIndicator.grayLargeIndicator;
    
    __weak __typeof(self) weakSelf = self;
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf setImage:image];
        });
    }];
}

@end
