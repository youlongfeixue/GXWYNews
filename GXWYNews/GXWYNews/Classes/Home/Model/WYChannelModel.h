//
//  WYChannelModel.h
//  GXWYNews
//
//  Created by Tony on 2018/1/30.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYChannelModel : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;


+ (NSArray *)channelList;


@end
