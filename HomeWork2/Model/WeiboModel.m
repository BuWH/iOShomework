//
//  WeiboModel.m
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import "WeiboModel.h"


@implementation WeiboTimeline

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"statuses" : @"statuses"
    };
}

+ (NSValueTransformer*)statusesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:WeiboStatus.class];
}

@end

@implementation WeiboUser

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"screenName" : @"screen_name",
        @"name" : @"name",
        @"profileImageURL" : @"profile_image_url"
    };
}

+ (NSValueTransformer*)profileImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end

@implementation WeiboStatus

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    return dateFormatter;
}

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"idstr" : @"idstr",
        @"text" : @"text",
        @"user" : @"user",
        @"createdAt" : @"created_at"
    };
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:WeiboUser.class];
}

+ (NSValueTransformer*)createdAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString: date];
    }];
}

- (NSString*)description {
    return [NSString stringWithFormat:@"name: %@ date: %@\n text: %@", self.user.name, self.createdAt, self.text];
}

@end
