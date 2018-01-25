//
//  NSFileHandle+Addition.m
//  UI进阶Lesson1_文件对接器
//
//  Created by liankai on 2017/6/30.
//  Copyright © 2017年 liankai. All rights reserved.
//

#import "NSFileHandle+Addition.h"



@interface NSFileHandle ()

@property (nonatomic, copy) NSString *path;

@end


@implementation NSFileHandle (Addition)

static char *fxPath = "fxPath";

- (void)setPath:(NSString *)path {
    objc_setAssociatedObject(self, fxPath, path, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)path {
    return objc_getAssociatedObject(self, fxPath);
}




- (NSString *)fileName {
    
    return [self.path lastPathComponent];
    
}


+ (void)load{
    
    Method originalUpdateM = class_getClassMethod([self class], @selector(fileHandleForUpdatingAtPath:));
    
    Method exchangeUpdateM = class_getClassMethod([self class], @selector(swizzling_fileHandleForUpdatingAtPath:));
    
    method_exchangeImplementations(originalUpdateM, exchangeUpdateM);
    
    
    Method originalReadM = class_getClassMethod([self class], @selector(fileHandleForReadingAtPath:));
    
    Method exchangeReadM = class_getClassMethod([self class], @selector(swizzling_fileHandleForReadingAtPath:));
    
    method_exchangeImplementations(originalReadM, exchangeReadM);
    
    
    Method originalWriteM = class_getClassMethod([self class], @selector(fileHandleForWritingAtPath:));
    
    Method exchangeWriteM = class_getClassMethod([self class], @selector(swizzling_fileHandleForWritingAtPath:));
    
    method_exchangeImplementations(originalWriteM, exchangeWriteM);
    
}

+ (nullable instancetype)swizzling_fileHandleForReadingAtPath:(NSString *)path {
    NSFileHandle *fileHandle = [self swizzling_fileHandleForReadingAtPath:path];
    fileHandle.path = path;
    return fileHandle;
}
+ (nullable instancetype)swizzling_fileHandleForWritingAtPath:(NSString *)path {
    NSFileHandle *fileHandle = [self swizzling_fileHandleForReadingAtPath:path];
    fileHandle.path = path;
    return fileHandle;
}
+ (nullable instancetype)swizzling_fileHandleForUpdatingAtPath:(NSString *)path {
    NSFileHandle *fileHandle = [self swizzling_fileHandleForUpdatingAtPath:path];
    fileHandle.path = path;
    return fileHandle;
}


@end
