//
//  ViewController.h
//  cocoa
//
//  Created by Lost Star on 4/4/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFNetworking.h"
#import "VideosTableViewController.h"
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "Pojo/Movies.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *voteLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;

@property NSString* strTitle,*strOverview,*strReleaseDate,*vote,*posterPath;
@property NSNumber* movieIddd;
@property NSDictionary *dicReviews;
@property NSArray *reviews;
@property int vo;
@property Movies *myFav;
@property Boolean fav;


@property NSString* myNewString;

@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)sendId:(id)sender;

//@property (weak, nonatomic) IBOutlet HCSStarRatingView *myvote;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starView;

- (IBAction)favAction:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *favbtn;
@end

