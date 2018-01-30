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
    
    // add subControl 2 scrollView
    for (WYChannelModel *channel in _channelList) {
        WYChannelLabel *lb = [WYChannelLabel channelLabelWithTitle:channel.tname];
        [_scrollView addSubview:lb];
    }
}


@end
