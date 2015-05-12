

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UIView *cv_collectionView;
@property (weak, nonatomic) IBOutlet UIView *cv_tableView;

@end

