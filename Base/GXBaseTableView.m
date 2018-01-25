//
//  GXBaseTableView.m
//  CarSalesMS_GCX
//
//  Created by Ssky on 2016/11/29.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "GXBaseTableView.h"

@implementation GXBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        //
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
        
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        
        self.tableFooterView = [[UIView alloc] init];
        
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI {
    
}




















@end
