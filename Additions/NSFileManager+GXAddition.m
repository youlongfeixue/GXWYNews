//
//  NSFileManager+GXAddition.m
//  FenxiaoMS
//
//  Created by Tony on 2017/6/18.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSFileManager+GXAddition.h"

@implementation NSFileManager (GXAddition)

// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径
- (NSString *)getParent:(NSString *)path 
{
    NSString *str = [[path substringFromIndex:path.length - 1] isEqualToString:@"/"] ? [path substringToIndex:path.length - 1] : path;
    NSRange range = [str rangeOfString:@"/" options:NSBackwardsSearch];
    return [str substringWithRange:NSMakeRange(0, range.location)];
}

// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径，并且末尾追加一个'/'后缀（类似 stringByAppendingPathComponent: 方法使用）
- (NSString *)getParentComponents:(NSString *)path {
    return [[self getParent:path] stringByAppendingString:@"/"];
} 

- (BOOL)exists:(NSString *)path {
    return [self fileExistsAtPath:path];
}

// 判断给定路径是否是文件夹路径
- (bool)isDirectory:(NSString *)path {
    BOOL isDir = NO;
    [self fileExistsAtPath:path isDirectory:&isDir];
    if (isDir) {
        return true;
    } else {
        return false;
    }
}


// 创建路径Directory，如果存在直接返回true；如果不存在就创建，返回创建结果。
- (BOOL)gx_createDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    BOOL creSucc = YES;
    if (![self exists:path]) {
        creSucc = [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    }
    return creSucc;
}








// 获取文件名-带后缀
+ (NSString *)getFileNameComponent:(NSString *)path {
    return [path lastPathComponent];
}

// 获取文件名-不带后缀
+ (NSString *)getFileName:(NSString *)path {
    return [[self getFileNameComponent:path] stringByDeletingPathExtension];
}

// 获取文件的后缀扩展名-不带 '.' 号
+ (NSString *)getFileExtension:(NSString *)path {
    return [path pathExtension];
}

- (BOOL)gx_deleteItem:(NSString *)path error:(NSError **)error {
    BOOL isSucc = NO;
    BOOL exists = [self fileExistsAtPath:path];
    if (exists) {
        isSucc = [self removeItemAtPath:path error:error];
    }
    return isSucc;
}




@end










