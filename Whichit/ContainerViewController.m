//
//  ContainerViewController.m
//  Whichit
//
//  Created by Ana Nogal on 13/05/2015.
//  Copyright (c) 2015 Ana Nogal. All rights reserved.
//

#import "ContainerViewController.h"
#import "ImagesCollectionViewController.h"
#import "ImagesTableViewController.h"

#define SegueForTableView @"segueForTableView"
#define SegueForCollectionView @"segueForCollectionView"

@interface ContainerViewController ()

@property (strong, nonatomic) ImagesCollectionViewController *collectionViewController;
@property (strong, nonatomic) ImagesTableViewController *tableViewController;
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController
{
    NSArray* _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueForTableView;
    self.images = [NSArray array];
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    if([self.currentSegueIdentifier isEqualToString:SegueForTableView])
    {
        [self.tableViewController setImages:self.images];
    }
    else
    {
        [self.collectionViewController setImages:self.images];
    }
}

- (NSArray*)images
{
    return _images;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:SegueForTableView]) {
        self.tableViewController = segue.destinationViewController;
        [self.tableViewController setImages:self.images];
        
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.tableViewController];
        }
        else
        {
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }

    }
    
    if ([segue.identifier isEqualToString:SegueForCollectionView]) {
        self.collectionViewController = segue.destinationViewController;
        [self.collectionViewController setImages:self.images],
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.collectionViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:SegueForTableView]) ? SegueForCollectionView : SegueForTableView;
    
    if (([self.currentSegueIdentifier isEqualToString:SegueForTableView]) && self.tableViewController) {
        [self swapFromViewController:self.collectionViewController toViewController:self.tableViewController];
        return;
    }
    
    if (([self.currentSegueIdentifier isEqualToString:SegueForCollectionView]) && self.collectionViewController) {
        [self swapFromViewController:self.tableViewController toViewController:self.collectionViewController];
        return;
    }
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}


@end
