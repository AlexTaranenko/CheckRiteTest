//
//  MainTableViewCell.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "MainTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "CatCategory.h"

@interface MainTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *containerCategoryView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setSeparatorInset:UIEdgeInsetsZero];
    [self.photoImageView setContentMode:UIViewContentModeScaleAspectFill];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.photoImageView.image = nil;
    self.categoryLabel.text = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.photoImageView.layer setCornerRadius:8];
    [self.containerCategoryView.layer setCornerRadius:4];
}

- (void)populateMainCell:(CatModel *)model {
    
    [self.containerCategoryView setHidden:model.categories.count == 0];
    if (model.categories.count > 0) {
        self.categoryLabel.text = [(CatCategory *)model.categories.firstObject name];
    }
    
    self.photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayIndicator;
    
    __weak __typeof(self) weakSelf = self;
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf.photoImageView setImage:image];
        });
    }];
}

@end
