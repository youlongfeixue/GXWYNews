//
//  WYChannelView.m
//  GXWYNews
//
//  Created by Tony on 2018/1/29.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYChannelView.h"
#import "WYChannelLabel.h"

@interface WYChannelView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end


@implementation WYChannelView

+ (instancetype)channelView {
    UINib *nib = [UINib nibWithNibName:@"WYChannelView" bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].lastObject;
}




- (void)setChannelList:(NSArray<WYChannelModel *> *)channelList {
    _channelList = channelList;
    
    CGFloat x = 20;
    CGFloat margin = 8;
    CGFloat height = _scrollView.bounds.size.height;
    // width 已经 sizeToFit 计算好了 - 撑开了。
    
    // add subControl 2 scrollView
    for (WYChannelModel *channel in _channelList) {
        WYChannelLabel *lb = [WYChannelLabel channelLabelWithTitle:channel.tname];
        
        CGFloat width = lb.bounds.size.width;
        lb.frame = CGRectMake(x, 0, width, height);
        
        x += width + margin;
        
        [_scrollView addSubview:lb];
    }
    
    _scrollView.contentSize = CGSizeMake(x, 0);
    
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
}


@end
