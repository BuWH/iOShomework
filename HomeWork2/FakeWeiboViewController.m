//
//  FakeWeiboViewController.m
//  HomeWork2
//
//  Created by 温和 on 2020/7/10.
//  Copyright © 2020 温和. All rights reserved.
//

#import "FakeWeiboViewController.h"


@interface FakeWeiboViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) WeiboTimeline *model;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FakeWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [WeiboTimeline new];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.view = self.tableView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self fetchTimeline];
}

- (void)fetchTimeline {
    WeiboTimelineFetcher *fetcher = [WeiboTimelineFetcher new];
    [fetcher startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"fetch success");
        self.model = [MTLJSONAdapter modelOfClass:WeiboTimeline.class fromJSONDictionary:request.responseObject error:nil];
        //NSLog(@"%@\n", request.responseObject);
        [self.tableView reloadData];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"fetch fail");
        NSLog(@"%@", request.description);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_model.statuses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const ID = @"cell";
    StatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[StatusViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.model.statuses[indexPath.row];
    
    return cell;
}

@end
