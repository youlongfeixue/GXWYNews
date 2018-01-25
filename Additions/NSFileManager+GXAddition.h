//
//  NSFileManager+GXAddition.h
//  FenxiaoMS
//
//  Created by Tony on 2017/6/18.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (GXAddition)


//- (NSString *)getParentFile:(NSString *)path;

/// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径
- (NSString *)getParent:(NSString *)path;

/// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径，并且末尾追加一个'/'后缀（类似 stringByAppendingPathComponent: 方法使用）
- (NSString *)getParentComponents:(NSString *)path;


- (BOOL)exists:(NSString *)path;

/// 判断给定路径是否是文件夹路径
- (bool)isDirectory:(NSString *)path;

/// 创建路径Directory，如果存在直接返回true；如果不存在就创建，返回创建结果。
- (BOOL)gx_createDirectoryAtPath:(NSString *)path error:(NSError **)error;





/// 获取文件名-带后缀
+ (NSString *)getFileNameComponent:(NSString *)path;
/// 获取文件名-不带后缀
+ (NSString *)getFileName:(NSString *)path;
/// 获取文件的后缀扩展名-不带 '.' 号
+ (NSString *)getFileExtension:(NSString *)path;

- (BOOL)gx_deleteItem:(NSString *)path error:(NSError **)error;






@end











