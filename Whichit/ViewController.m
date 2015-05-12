
#import "ViewController.h"
#import "JSONReader.h"
#import "ImageRepository.h"

@interface ViewController ()


@end

@implementation ViewController
{
    JSONReader* reader;
    ImageRepository* repository;
    NSArray* images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setup
{
    self.tabBar.selectedItem = 0;
    self.cv_tableView.hidden = YES;
    self.cv_collectionView.hidden = NO;
    
    reader = [[JSONReader alloc] init];
    repository = [[ImageRepository alloc] initWithReader:reader];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    images = [repository getAllByTag:searchText];
}

@end
