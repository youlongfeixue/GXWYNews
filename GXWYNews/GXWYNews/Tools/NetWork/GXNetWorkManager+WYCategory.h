//
//  GXNetWorkManager+WYCategory.h
//  GXWYNews
//
//  Created by Tony on 2018/1/27.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "GXNetWorkManager.h"

@interface GXNetWorkManager (WYCategory)

- (void)newsListWithChannel:(NSString *)channel start:(NSInteger)start completion:(void (^)(NSArray *list, NSError *error))completion;












@end











