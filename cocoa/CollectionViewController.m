//
//  CollectionViewController.m
//  cocoa
//
//  Created by Lost Star on 4/5/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import "CollectionViewController.h"
#import "ViewController.h"



@interface CollectionViewController (){
    
    NSMutableData *recievedData;
    NSArray *movies;
    NSDictionary *dicMovies;
    NSArray *dropdownArray;
   
    
}

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    if (!movies) {
        NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=658680e409a5e9e11988f3e49361edae&language=en-US&page=1&fbclid=IwAR2LK8EjQONcNbMZE_woaGEAyA5AlhkqfAg9epogWuci7XbR2sBm1VW5eCQ"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
       
        AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer=[AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation, id  responseObject){
            dicMovies =(NSDictionary*)responseObject;
            movies=[dicMovies objectForKey:@"results"];
        
            
            
             [self.collectionView reloadData];
            NSLog(@"%@",movies);
            
            printf("request success");
         
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             printf("request failed");
        }];
        [operation start];
        
        }
    
    //////dropdown
   
    
    
   
    
}
         



#pragma mark <UICollectionViewDataSource>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
ViewController *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
   // Movies *temp=[Movies new];
   
    
//
//    [temp setTitle:movies[indexPath.row][@"title"]];
//    [temp setRelease_date:movies[indexPath.row][@"release_date"]];
//    [temp setMovieId: movies[indexPath.row][@"id"]];
    
    [vc setStrTitle:movies[indexPath.row][@"title"]];
    [vc setStrReleaseDate:movies[indexPath.row][@"release_date"]];
    [vc setMovieIddd: movies[indexPath.row][@"id"]];
    
    
    
    NSNumber* result =  movies[indexPath.row][@"vote_average"] ;
    int v=[result intValue];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2]; //2 decimal places, change this as required.
    NSString *movieVote = [numberFormatter stringFromNumber:result];
    //[temp setVoteAverage:movieVote];
   
     [vc setPosterPath:movies[indexPath.row][@"poster_path"]];
    [vc setVo:v];
    
    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
    
    
    
   
   // vc.myFav=temp;
    
    
     [self.navigationController pushViewController:vc animated:YES ];
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = self.collectionView.frame.size.width/2;
    return CGSizeMake(width, width);
    CGFloat height = self.collectionView.frame.size.height;
    return CGSizeMake(height, height);
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsZero;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}






- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return movies.count;
}


         
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   // UICollectionViewCell *cell =  [UICollectionViewCell new];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (cell.selected) {
        cell.backgroundColor = [UIColor blueColor]; // highlight selection
    }
    else
    {
        cell.backgroundColor = [UIColor redColor]; // Default color
    }
   
    
   if (movies) {
        //NSDictionary *dic = movies[indexPath.row];
       NSString * imageUrl = [[NSString alloc] initWithString:[@"https://image.tmdb.org/t/p/" stringByAppendingString:@"w185"]];
      
   NSString* url = [imageUrl stringByAppendingString:movies[indexPath.row][@"poster_path"]] ;
       
       NSLog(@"%@",url );
         NSLog(@"%@",[imageUrl stringByAppendingString:movies[indexPath.row][@"poster_path"]] );
        UIImageView* movie = (UIImageView*)[cell viewWithTag:2];
        [movie sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"m.png"]];
       
       
       
       
      
       
    }
    
    return cell;
}








@end
