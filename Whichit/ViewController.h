

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UITabBarItem *collectionItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *tableItem;

@end

