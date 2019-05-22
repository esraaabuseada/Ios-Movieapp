//
//  FavouritsCollectionViewController.m
//  cocoa
//
//  Created by Lost Star on 4/14/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import "FavouritsCollectionViewController.h"

@interface FavouritsCollectionViewController ()

@end

@implementation FavouritsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    _favMovie=[Movies allObjects];
    [self.collectionView reloadData];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewController *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
    vc.myFav=[_favMovie objectAtIndex:indexPath.row];
    
    
   
    
    
    
    
    
    [self.navigationController pushViewController:vc animated:YES ];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return _favMovie.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    if (_favMovie) {
        //NSDictionary *dic = movies[indexPath.row];
        NSString * imageUrl = [[NSString alloc] initWithString:[@"https://image.tmdb.org/t/p/" stringByAppendingString:@"w185"]];
        NSString *str=[[_favMovie objectAtIndex:indexPath.row] posterPath];
        NSString* url = [imageUrl stringByAppendingString:str  ] ;
        
        
        UIImageView* movie = (UIImageView*)[cell viewWithTag:2];
        [movie sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"m.png"]];
        
        
        
        
        
        
    }
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


@end
