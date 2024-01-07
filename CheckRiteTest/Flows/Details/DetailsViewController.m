//
//  DetailsViewController.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "DetailsViewController.h"
#import "UIViewController+Storyboard.h"
#import "UIImageView+LoadImage.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIViewController+Alert.h"

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
    
    self.categoryLabel.text = @"";
    [self loadDetailCat];
}

- (void)loadDetailCat {
    [SVProgressHUD show];
    
    __weak __typeof(self) weakSelf = self;
    [self.detailsViewModel loadDetailCatWithCompletionBlock:^(BOOL succeeded, NSString * _Nonnull errorMsg) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        if (succeeded) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf loadPhotoImage];
                [strongSelf loadInfoCat];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf showAlertWithTitle:@"Error" withMessage:errorMsg];
            });
        }
        
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - Photo Image

- (void)loadPhotoImage {
    
    [self.photoImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.photoImageView.layer setCornerRadius:8];
    [self.photoImageView loadImage:self.detailsViewModel.imageUrl];
}

#pragma mark - Category

- (void)loadInfoCat {
    self.categoryLabel.attributedText = [self.detailsViewModel infoCat];
}

@end
