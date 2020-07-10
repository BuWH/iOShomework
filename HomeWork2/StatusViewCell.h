//
//  StatusViewCell.h
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "WeiboModel.h"
#import <SDWebImage/SDWebImage.h>
NS_ASSUME_NONNULL_BEGIN

@interface StatusViewCell : UITableViewCell
@property (nonatomic, strong) WeiboStatus *model;
@end

NS_ASSUME_NONNULL_END
