//
//  GXBaseTableViewCell.m
//  CarSalesMS_GCX
//
//  Created by Ssky on 2016/11/29.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "GXBaseTableViewCell.h"

@implementation GXBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
        [self initData_cell];
        
        [self setupUI];
    }
    return self;
}


- (void)bindData:(id)obj rowId:(int)rowId {
//    NSLog(@"bindData:T rowId: 此方法未实现! ");
}
- (void)bindData:(DataRow *)row rowId:(int)rowId orderType:(int)orderType {
    
}




- (void)initData_cell {
    
}


#pragma mark - setupUI
- (void)setupUI {
    
}

@end



















