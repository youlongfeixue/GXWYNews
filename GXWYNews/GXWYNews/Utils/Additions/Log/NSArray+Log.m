#import "NSArray+Log.h"

@implementation NSArray (Log)

// stringWithFormat 的时候会走
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    if ([strM hasSuffix:@",\n"]) {
        [strM deleteCharactersInRange:NSMakeRange(strM.length - 2, 1)];
    }
    
    [strM appendString:@")"];
    
    return strM.copy;
}

// NSLog 的时候会走 、调试时鼠标放到变量上点击后面的’!‘打印时会走
- (NSString *)description 
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    if ([strM hasSuffix:@",\n"]) {
        [strM deleteCharactersInRange:NSMakeRange(strM.length - 2, 1)];
    }
    
    [strM appendString:@")"];
    
    return strM.copy;
}


@end

@implementation NSDictionary (Log)

// stringWithFormat 的时候会走
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM.copy;
}

// NSLog 的时候会走 、调试时鼠标放到变量上点击后面的’!‘打印时会走
- (NSString *)description 
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM.copy;
}

@end
