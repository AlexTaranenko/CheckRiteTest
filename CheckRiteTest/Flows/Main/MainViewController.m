//
//  ViewController.m
//  CheckRiteTest
//
//  Created by Alex on 05.01.2024.
//

#import "MainViewController.h"
#import "UIViewController+Storyboard.h"
#import "MainViewModel.h"
#import "DetailsViewController.h"
#import "DetailsViewModel.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "MainTableViewCell.h"
#import "CatModel.h"
#import "UIViewController+Alert.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MainViewModel *mainViewModel;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

+ (id)instantiate {
    MainViewController *vc = [MainViewController instantiate:@"Main" withIdentifier:@"MainViewController"];
    vc.mainViewModel = [[MainViewModel alloc] init];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cats";
    
    [self setupTableView];
    [self loadCats];
}

#pragma mark - Private

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = self.refreshControl;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MainTableViewCell class])];
}

- (void)loadCats {
    [SVProgressHUD show];
    
    __weak __typeof(self) weakSelf = self;
    [self.mainViewModel getImagesWithCompletionBlock:^(BOOL succeeded, NSString *errorMsg) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        if (succeeded) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf.tableView reloadData];
                [strongSelf.refreshControl endRefreshing];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf showAlertWithTitle:@"Error" withMessage:errorMsg];
                [strongSelf.refreshControl endRefreshing];
            });
        }
        
        [SVProgressHUD dismiss];
    }];
}

- (void)refreshTable {
    [self.refreshControl beginRefreshing];
    [self loadCats];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainViewModel.cats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainTableViewCell class])];
    CatModel *model = [self.mainViewModel.cats objectAtIndex:indexPath.row];
    [cell populateMainCell:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewController *detailsVC = [DetailsViewController instantiate];
    CatModel *model = [self.mainViewModel.cats objectAtIndex:indexPath.row];
    detailsVC.detailsViewModel = [[DetailsViewModel alloc] initWithCatModel:model];
    [self.navigationController pushViewController:detailsVC animated:true];
}

@end
