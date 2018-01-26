//
//  GXBaseTextField.h
//  FenxiaoMS
//
//  Created by Tony on 2017/11/2.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GXBaseTextField;


/**
 protocol GXBaseTextFieldDelegate
 */
@protocol GXBaseTextFieldDelegate <NSObject>

/// 当 textF 自身的 enable 属性的值为 NO 时点击 textF 才会触发此方法回调。
- (void)gxTextField:(GXBaseTextField *)textF touchWithEnabled:(BOOL)isEnabled;

@end


/**
 class GXBaseTextField
 */
@interface GXBaseTextField : UITextField

@property (nonatomic, weak) id<GXBaseTextFieldDelegate> gxBaseDelegate;


- (void)setupUI;

@end
