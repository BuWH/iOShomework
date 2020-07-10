//
//  WeiboModel.h
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeiboTimeline : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSArray *statuses;

@end

@interface WeiboUser : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *profileImageURL;

@end

@interface WeiboStatus : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) WeiboUser *user;
@property (nonatomic, strong) NSDate *createdAt;

@end

NS_ASSUME_NONNULL_END
