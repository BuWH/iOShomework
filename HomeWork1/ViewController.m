//
//  ViewController.m
//  HomeWork1
//
//  Created by 温和 on 2020/7/8.
//  Copyright © 2020 温和. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (nonatomic) int count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 0;
    // Do any additional setup after loading the view.
}

- (IBAction)buttonClicked:(id)sender {
    [_countLabel setText:[NSString stringWithFormat:@"Count: %d", ++_count]];
}

- (void)viewWillLayoutSubviews {
    [_stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
}

@end
