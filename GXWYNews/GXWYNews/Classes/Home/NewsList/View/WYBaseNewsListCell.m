//
//  WYBaseNewsListCell.m
//  GXWYNews
//
//  Created by Tony on 2018/1/28.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYBaseNewsListCell.h"
#import "WYNewsListItem.h"
#import <UIImageView+WebCache.h>

@interface WYBaseNewsListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSource;
@property (weak, nonatomic) IBOutlet UILabel *lblReply;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extralIcon;

@end

@implementation WYBaseNewsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}






- (void)setModel:(WYNewsListItem *)model {
    _model = model;
    
    _lblTitle.text = _model.title;
    _lblSource.text = _model.source;
    _lblReply.text = @(_model.replyCount).description;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]]; 
    
    int idx = 0;
    for (NSDictionary *dict in _model.imgextra) {
        [_extralIcon[idx++] gx_setImageWithURLString:dict[@"imgsrc"]];
    }
}



@end











