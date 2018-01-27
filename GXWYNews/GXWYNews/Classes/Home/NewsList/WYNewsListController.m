//
//  WYNewsListController.m
//  GXWYNews
//
//  Created by Tony on 2018/1/26.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYNewsListController.h"
#import "WYNewsListItem.h"


static NSString *const cellID = @"cellID";

@interface WYNewsListController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

/// 新闻列表数据源 使用 mArr 是为了方便上拉刷新与下拉加载更多
@property (nonatomic, strong) NSMutableArray<WYNewsListItem *> *newsList;

@end

@implementation WYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    [self loadData];
}

#pragma mark -  loadData

- (void)loadData {
    // T1348649079062  体育频道
    [[GXNetWorkManager sharedManager] newsListWithChannel:@"T1348649079062" start:0 completion:^(NSArray *list, NSError *error) {
        NSLog(@"%@", list);
        
        _newsList = [NSMutableArray arrayWithArray:[NSArray yy_modelArrayWithClass:[WYNewsListItem class] json:list]];

        // 刷新列表
        [self.tableView reloadData];
    }];
}



#pragma mark -  tableView dataSource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = _newsList[indexPath.row].title;
    
    return cell;
}


#pragma mark - setupUI

- (void)setupUI {
    //
    UITableView *tv = [UITableView new];
    [self.view addSubview:tv];
    self.tableView = tv;
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    tv.dataSource = self;
    tv.delegate = self;
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}


@end
