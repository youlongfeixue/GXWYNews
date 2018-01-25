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





- (void)initData_cell {
    
}


#pragma mark - setupUI
- (void)setupUI {
    
}

@end



















