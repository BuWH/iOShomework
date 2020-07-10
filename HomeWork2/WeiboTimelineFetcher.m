//
//  WeiboTimelineFetcher.m
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import "WeiboTimelineFetcher.h"

#define ACCESS_TOKEN @"2.00WbHZhGzmBiFC01dc4190ee6zBPJD"

@implementation WeiboTimelineFetcher

- (NSString*)baseUrl {
    return @"https://api.weibo.com";
}

- (NSString*)requestUrl {
    return @"/2/statuses/public_timeline.json";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{
        @"access_token" : ACCESS_TOKEN
    };
}

@end
