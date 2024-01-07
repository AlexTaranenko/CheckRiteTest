//
//  MainTableViewCell.m
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import "MainTableViewCell.h"
#import "UIImageView+LoadImage.h"
#import "CatBreed.h"

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
    
    [self.containerCategoryView setHidden:model.breeds.count == 0];
    if (model.breeds.count > 0) {
        self.categoryLabel.text = [[(CatBreed *)model.breeds.firstObject name] capitalizedString];
    }
    
    [self.photoImageView loadImage:model.url];
}

@end
