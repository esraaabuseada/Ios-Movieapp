//
//  ViewController.m
//  cocoa
//
//  Created by Lost Star on 4/4/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>




@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_scrollview setContentSize:CGSizeMake(0,1200)];
    [_myTableview setDelegate:self];
    [_myTableview setDataSource:self];

    [_titleLabel setText:_strTitle];
    [_overviewLabel setText:_strOverview];
    [_releaseLabel setText:_strReleaseDate];
    _myFav=[Movies new];

  
    [_myFav setTitle:_strTitle];
    [_myFav setMovieId:_movieIddd];
    [_myFav setRelease_date:_strReleaseDate];
    [_myFav setPosterPath:_posterPath];
    
    
    _fav=false;
    
   // [self isFav:_movieId];
    NSLog(@"%@",_movieIddd);
    int i=[_movieIddd intValue];
    
    
   _myNewString = [NSString stringWithFormat:@"%d", i];
    NSLog(@"%@",_myNewString);

    
    NSString * reviewsUrl = [[NSString alloc] initWithString:[@"https://api.themoviedb.org/3/movie/" stringByAppendingString:_myNewString]];
    NSLog(@"%@",reviewsUrl);
    
    NSURL *url = [NSURL URLWithString: [reviewsUrl stringByAppendingString:@"/reviews?api_key=658680e409a5e9e11988f3e49361edae"] ];
    
    NSLog(@"%@",url);
    
NSURLRequest *request1 = [NSURLRequest requestWithURL:url];
   
    NSLog(@"%@",request1);
AFHTTPRequestOperation *operation1=[[AFHTTPRequestOperation alloc] initWithRequest:request1];
    operation1.responseSerializer=[AFJSONResponseSerializer serializer];
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation1, id  responseObject){
        
        _dicReviews =(NSDictionary*)responseObject;
        _reviews=[_dicReviews objectForKey:@"results"];
        
        
           [self.myTableview reloadData];
        
        NSLog(@"%@",_reviews);
        
        printf("request success");
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        printf("request failed");
    }];
    [operation1 start];
    
    
   
 
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    NSString *nameOfSection = @"Reviews";
    
    
    
    return nameOfSection;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    
    
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _reviews.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    UILabel *authorLabel=[cell viewWithTag:1];
    UITextView *contentTextview=[cell viewWithTag:2];
   
    
    [authorLabel setText:_reviews[indexPath.row][@"author"]];
    [contentTextview setText:_reviews[indexPath.row][@"content"]];
    
    NSString * imageUrl = [[NSString alloc] initWithString:[@"https://image.tmdb.org/t/p/" stringByAppendingString:@"w185"]];
    
    NSString* url = [imageUrl stringByAppendingString:_posterPath] ;
    
   
   
    [_poster sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"m.png"]];
    
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 150;
    
}
- (IBAction)sendId:(id)sender {
     VideosTableViewController  *videoc= [self.storyboard instantiateViewControllerWithIdentifier:@"videoc"];
    [videoc setMid:_myNewString];
    
    
    [self.navigationController pushViewController:videoc animated:YES ];
    
}


- (IBAction)favAction:(id)sender {
    if(!_fav){
        _fav = true;
        UIButton *btn = (UIButton *)sender;
        [btn setImage:[UIImage imageNamed:@"redheart"] forState:UIControlStateNormal];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        printf("ASdasdasdasdasd");
        NSLog(@"%@",_myFav);
        
        [realm addObject: _myFav];
        
        [realm commitWriteTransaction];
    }
    else{
        _fav = false;
        [self deleteMov:_myFav.movieId];
        
    }
    
    
}





    



-(void)isFav:(NSNumber*)movId{
    RLMResults<Movies *> *myFavmovies ;
    // Query using an NSPredicate
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"movie_id = %@",movId];
    myFavmovies = [Movies objectsWithPredicate:pred];
    if(myFavmovies.count!=0){
        _fav=true;
        [_favbtn setImage:[UIImage imageNamed:@"redheart"] forState:UIControlStateNormal];
    }
}
-(void)deleteMov:(NSNumber*)movId{
    RLMResults<Movies *> *myFavmovies ;
    // Query using an NSPredicate
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"movie_id = %@",
                         movId];
    myFavmovies = [Movies objectsWithPredicate:pred];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    if(myFavmovies.count!=0){
        [realm beginWriteTransaction];
        [realm deleteObject:[myFavmovies firstObject]];
        [realm commitWriteTransaction];
        [_favbtn setImage:[UIImage imageNamed:@"emptyheart"] forState:UIControlStateNormal];
    }
}
@end
