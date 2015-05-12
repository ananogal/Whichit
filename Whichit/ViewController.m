
#import "ViewController.h"
#import "JSONReader.h"
#import "ImageRepository.h"
#import "ImagesTableViewController.h"
#import "ImagesCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    JSONReader* reader;
    ImageRepository* repository;
    ImagesTableViewController* tableViewController;
    NSMutableArray* images;
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
    [self.tabBar setSelectedItem:self.tableItem];
    self.cv_tableView.hidden = NO;
    self.cv_collectionView.hidden = YES;
    
    reader = [[JSONReader alloc] init];
    repository = [[ImageRepository alloc] initWithReader:reader];
    
    images = [NSMutableArray array];
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.enablesReturnKeyAutomatically = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    [images addObject:searchBar.text];
    [tableViewController setImages:images];
}

- (void)searchBarSearchButtonClicked
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //images = [repository getAllByTag:searchText];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToTableView"]) {
        tableViewController = (ImagesTableViewController*)segue.destinationViewController;
    }
}


@end
