//
//  WYChannelView.h
//  GXWYNews
//
//  Created by Tony on 2018/1/29.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"

@interface WYChannelView : UIView

+ (instancetype)channelView;

@property (nonatomic, strong) NSArray<WYChannelModel *> *channelList;

@end
