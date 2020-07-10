//
//  FakeWeiboViewController.m
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import "FakeWeiboViewController.h"


@interface FakeWeiboViewController ()
@property (nonatomic, strong) WeiboTimeline *model;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FakeWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchTimeline];
    
    self.tableView = [UITableView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)fetchTimeline {
    WeiboTimelineFetcher *fetcher = [WeiboTimelineFetcher new];
    [fetcher startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"fetch success");
        WeiboTimeline *responseModel = [MTLJSONAdapter modelOfClass:WeiboTimeline.class fromJSONDictionary:request.responseObject error:nil];
        //NSLog(@"%@\n", request.responseObject);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"fetch fail");
        NSLog(@"%@", request.description);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_model.statuses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
