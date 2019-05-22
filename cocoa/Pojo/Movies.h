//
//  Movies.h
//  cocoa
//
//  Created by Lost Star on 4/7/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import <Realm/RLMObjectBase.h>
#import <Realm/RLMThreadSafeReference.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movies :RLMObject
@property NSString *title,*release_date,*posterPath;
@property NSNumber<RLMFloat> *voteAverage;
@property NSNumber<RLMInt> *movieId;

@end

NS_ASSUME_NONNULL_END
