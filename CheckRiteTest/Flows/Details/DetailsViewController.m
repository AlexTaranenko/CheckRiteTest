//
//  DetailsViewController.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "DetailsViewController.h"
#import "UIViewController+Storyboard.h"
#import <SDWebImage/SDWebImage.h>

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation DetailsViewController

+ (id)instantiate {
    return [DetailsViewController instantiate:@"Details" withIdentifier:@"DetailsViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPhotoImage];
    [self loadCategoryName];
}

#pragma mark - Photo Image

- (void)loadPhotoImage {
    self.photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLargeIndicator;
    [self.photoImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.photoImageView.layer setCornerRadius:8];
    
    __weak __typeof(self) weakSelf = self;
    [self.photoImageView sd_setImageWithURL:self.detailsViewModel.imageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [strongSelf.photoImageView setImage:image];
        });
    }];
}

#pragma mark - Category

- (void)loadCategoryName {
    [self.categoryLabel setHidden:self.detailsViewModel.categoryName == nil];
    self.categoryLabel.text = [NSString stringWithFormat:@"Category: %@", self.detailsViewModel.categoryName];
}

@end
