//
//  GXBaseTableViewCell.h
//  CarSalesMS_GCX
//
//  Created by Ssky on 2016/11/29.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+TouchEvent.h" //点击tableView触发


@interface GXBaseTableViewCell : UITableViewCell

- (void)initData_cell;

- (void)setupUI;

- (void)bindData:(id)obj rowId:(int)rowId;

@end


















