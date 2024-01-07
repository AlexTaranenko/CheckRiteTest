//
//  MainTableViewCell.h
//  CheckRiteTest
//
//  Created by Alex on 06.01.2024.
//

#import <UIKit/UIKit.h>
#import "CatModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

- (void)populateMainCell:(CatModel *)model;

@end

NS_ASSUME_NONNULL_END
