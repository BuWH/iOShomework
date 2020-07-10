//
//  StatusViewCell.m
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import "StatusViewCell.h"

#define PADDING 10
#define IMAGE_SIDE_LENGTH 64

@interface StatusViewCell ()
@property (nonatomic, strong) UIImageView* profileImageView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* dateLabel;
@property (nonatomic, strong) UILabel* statusLabel;
@property (nonatomic, strong) NSDateFormatter *formatter;
@end

@implementation StatusViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setup];
    }
    return self;
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.model = [WeiboStatus new];
    
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateFormat:@"yyyy-MM-dd"];
    
    self.profileImageView = [UIImageView new];
    self.nameLabel = [UILabel new];
    self.dateLabel = [UILabel new];
    self.statusLabel = [UILabel new];
    
    self.nameLabel.numberOfLines = 1;
    self.dateLabel.numberOfLines = 1;
    self.statusLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.profileImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.statusLabel];
    
    [self.profileImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(PADDING);
        make.left.equalTo(self.contentView).offset(PADDING);
        make.height.width.mas_equalTo(IMAGE_SIDE_LENGTH);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(PADDING);
        make.left.equalTo(self.profileImageView.mas_right).offset(PADDING);
        make.right.equalTo(self.contentView).offset(-PADDING);
        make.height.mas_equalTo((IMAGE_SIDE_LENGTH - PADDING)/2);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.nameLabel);
        make.height.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(PADDING);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.profileImageView.mas_bottom).offset(PADDING);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-PADDING);
        make.left.equalTo(self.contentView).offset(PADDING);
        make.right.equalTo(self.contentView).offset(-PADDING);
    }];
    [self setNeedsUpdateConstraints];
}

- (void)setModel:(WeiboStatus *)model {
    [self.profileImageView sd_setImageWithURL:model.user.profileImageURL];
    self.nameLabel.text = model.user.screenName;
    self.dateLabel.text = [self.formatter stringFromDate:model.createdAt];
    self.statusLabel.text = model.text;
    [self.statusLabel sizeToFit];
    [self updateConstraints];
}

- (void)updateConstraints {
    [super updateConstraints];
}
@end
