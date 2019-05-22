//
//  FavouritsCollectionViewController.h
//  cocoa
//
//  Created by Lost Star on 4/14/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFNetworking/AFNetworking.h"
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavouritsCollectionViewController : UICollectionViewController<NSURLConnectionDelegate , NSURLConnectionDataDelegate>
@property RLMResults *favMovie;
@property  NSMutableData *recievedData;


@end

NS_ASSUME_NONNULL_END
