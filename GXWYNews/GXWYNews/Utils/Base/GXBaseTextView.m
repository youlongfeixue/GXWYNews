//
//  GXBaseTextView.m
//  FenxiaoMS
//
//  Created by Ssky on 2017/5/24.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "GXBaseTextView.h"
#import "Masonry.h"


static NSString *const txtViewKeyPath = @"text";

@interface GXBaseTextView () <UITextViewDelegate>

@property (nonatomic, strong) UILabel *lblPlaceHoler;

@end

@implementation GXBaseTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addObserver:self forKeyPath:txtViewKeyPath options:0 context:nil];
        
        [self initPlaceHoler];
        [self setupUI];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"GXBaseTextView dealloc! ");
    [self removeObserver:self forKeyPath:txtViewKeyPath];
}


#pragma mark - Actions

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([self.text isEqualToString:@""]) {
        self.lblPlaceHoler.hidden = false;
    }else {
        self.lblPlaceHoler.hidden = true;
    }
}


#pragma mark - delegates

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.lblPlaceHoler.hidden = true;
    }else {
        self.lblPlaceHoler.hidden = false;
    }
}


#pragma mark - methods




#pragma mark - setupUI

- (void)initPlaceHoler {
    self.lblPlaceHoler = [[UILabel alloc] init];
    [self addSubview:self.lblPlaceHoler];
    
    [self.lblPlaceHoler mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(7);
        make.left.equalTo(self).mas_offset(5);
    }];
    //    self.lblPlaceHoler.backgroundColor = [UIColor orangeColor]; //test
    self.lblPlaceHoler.textColor = [UIColor grayColor];
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.delegate = self;
}

- (void)setupUI {
    //子类重新实现此方法设置UI
}



#pragma mark - setter & getter

- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    
    self.lblPlaceHoler.text = _placeHolder;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.lblPlaceHoler.font = font;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    if (text) {
        self.lblPlaceHoler.hidden = true;
    }else {
        self.lblPlaceHoler.hidden = false;
    }
}



@end
