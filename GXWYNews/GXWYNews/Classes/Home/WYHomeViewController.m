//
//  WYHomeViewController.m
//  WYNews
//
//  Created by Tony on 2018/1/24.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYChannelView.h"
#import "WYChannelModel.h"

@interface WYHomeViewController ()

@property (nonatomic, strong) NSArray<WYChannelModel *> *channelList;

@property (nonatomic, weak) WYChannelView *channelView; 

@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    _channelList = [WYChannelModel channelList];
//    NSLog(@"chennelList = %@", _channelList);
    
    _channelView.channelList = _channelList;
}



#pragma mark - Actions



#pragma mark - delegates




#pragma mark - methods




#pragma mark - setupUI

- (void)setupUI {
    
    WYChannelView *cv = [WYChannelView channelView];
    [self.view addSubview:cv];
    self.channelView = cv;
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(38);
    }];
    
}






#pragma mark - setter & getter







@end
