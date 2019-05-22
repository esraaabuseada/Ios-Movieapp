//
//  VideosTableViewController.h
//  cocoa
//
//  Created by Lost Star on 4/14/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFNetworking.h"
#import "YTPlayerView.h"



NS_ASSUME_NONNULL_BEGIN

@interface VideosTableViewController : UITableViewController
@property NSString *mid;
@property NSDictionary *dicTrailors;
@property NSArray* trailors;


@end

NS_ASSUME_NONNULL_END
