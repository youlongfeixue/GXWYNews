//
//  WYNewsListController.m
//  GXWYNews
//
//  Created by Tony on 2018/1/26.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYNewsListController.h"


static NSString *const cellID = @"cellID";

@interface WYNewsListController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

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
    [[GXNetWorkManager sharedManager] newListWithChannel:@"T1348649079062" start:0 completion:^(NSArray *list, NSError *error) {
        NSLog(@"%@", list);

    }];
}



#pragma mark -  tableView dataSource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
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
