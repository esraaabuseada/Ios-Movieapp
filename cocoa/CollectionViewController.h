//
//  CollectionViewController.h
//  cocoa
//
//  Created by Lost Star on 4/5/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFNetworking/AFNetworking.h"
#import "Pojo/Movies.h"
#import <MKDropdownMenu/MKDropdownMenu.h>
NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UICollectionViewController<NSURLConnectionDelegate , NSURLConnectionDataDelegate,UICollectionViewDelegateFlowLayout,MKDropdownMenuDataSource, MKDropdownMenuDelegate>
@property (strong, nonatomic) MKDropdownMenu *navBarMenu;

@end

NS_ASSUME_NONNULL_END

