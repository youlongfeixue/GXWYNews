//
//  NSFileHandle+Addition.h
//  UI进阶Lesson1_文件对接器
//
//  Created by liankai on 2017/6/30.
//  Copyright © 2017年 liankai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSFileHandle (Addition)

@property (nonatomic, copy, readonly) NSString *fileName;

@end
