//
//  NSString+GXAddition.m
//  

#import "NSString+GXAddition.h"

@implementation NSString (GXAddition)

//- (NSString *)append:(NSString *)str, ... {
////    va_list args;
////    va_start(args, str);
////
////    NSString * obj = va_arg(args, NSString *);
////
////    va_end(args);
////
////    return [str stringByAppendingString:obj];
//}

- (BOOL)isEmpty {
    if ([self isEqualToString:@""] || self.length == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)contains:(NSString *)str {
    return [self containsString:str];
}

- (BOOL)equals:(NSString *)str {
    return [self isEqualToString:str];
}

//- (NSString *)cutStringWithSeparator:(NSString *)separator {
//    [self ]
//}


#pragma mark -  switch   Hanzi <==> Pinyin

///private
- (NSString *)switch2PinYinMeta {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:self];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //    //转化为大写拼音
    //    NSString *pinYin = [str capitalizedString];
    return str;
}


- (NSString *)switch2PinYinUpper {
    return [[self switch2PinYinMeta] stringByReplacingOccurrencesOfString:@" " withString:@""].uppercaseString;
}


- (NSString *)switch2PinYinLower {
    return [[self switch2PinYinMeta] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *_Nonnull)switch2PinYinCapitalized
{
    //转化为大写拼音 汉字的拼音之间有一个空格
    return [[self switch2PinYinMeta] capitalizedString];
}

- (NSString *)switch2PinYinFirstCapitalized
{
    //转化为大写拼音
    NSString *pinYin = [[self switch2PinYinMeta] capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}




#pragma mark - indexOf(@"")

- (int)indexOf:(NSString *)key {
    if (![self contains:key]) {
        return -1;
    }
    
    NSRange range = [self rangeOfString:key];
    return (int)range.location;
}

- (int)lastIndexOf:(NSString *)key {
    if (![self contains:key]) {
        return -1;
    }
//    NSString *path = nil;
//    NSString *lastChar = [self substringFromIndex:self.length - 1];
//    if ([lastChar isEqualToString:@"/"]) {
//        path = [self substringToIndex:path.length - 1];
//    }
    
    NSRange range = [self rangeOfString:key options:NSBackwardsSearch];
    return (int)range.location;
}



#pragma mark - subString

- (NSString *)subStringFrontOfLastIndex:(NSInteger)index {
    NSInteger lastIndex = self.length - index;
    NSString * str = [self substringToIndex:lastIndex];
    return str;
}

- (NSString *)subStringBackOfLastIndex:(NSInteger)index {
    NSInteger lastIndex = self.length - index;
    NSString * str = [self substringFromIndex:lastIndex];
    return str;
}

- (NSString *)subStringFrontOfKey:(NSString *)key {
    NSRange range = [self rangeOfString:key];
    if (range.location == NSNotFound) {
        return @"";
    }
    return [self substringToIndex:range.location];
}

- (NSString *)subStringBackOfKey:(NSString *)key {
    NSRange range = [self rangeOfString:key];
    return [self substringFromIndex:(range.location + range.length)];
}


- (NSString *)subStringFrontOfLastKey:(NSString *)lastKey {
    NSRange range = [self rangeOfString:lastKey options:NSBackwardsSearch];
    return [self substringToIndex:range.location];
}

- (NSString *)subStringBackOfLastKey:(NSString *)lastKey {
    NSRange range = [self rangeOfString:lastKey options:NSBackwardsSearch];
    return [self substringFromIndex:range.location + range.length];
}

- (NSString *)subStringFrontOfLastKeyContains:(NSString *)lastKey {
    NSRange range = [self rangeOfString:lastKey options:NSBackwardsSearch];
    return [self substringToIndex:range.location + range.length];
}

- (NSString *)subStringBackOfLastKeyContains:(NSString *)lastKey {
    NSRange range = [self rangeOfString:lastKey options:NSBackwardsSearch];
    return [self substringFromIndex:range.location];
}

// by gbs
/**
 截取字符串 从下标from到下标to
 
 @param from 起始下标
 @param to 结束下标
 @return 返回截取的字符串结果
 */
- (NSString *)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to{
    NSRange range = NSMakeRange(from, to - from); //@"aldhg" //length = to - from .
    return [self substringWithRange:range];
}

- (NSString *)substringFromIndex:(NSUInteger)from length:(NSUInteger)length {
    NSRange range = NSMakeRange(from, length);
    return [self substringWithRange:range];
}

- (NSString *)subStringMatchPattern:(NSString *)pattern
{
    NSError *error;
    // 创建NSRegularExpression对象并指定正则表达式
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:pattern
                                  options:0
                                  error:&error];
    if (!error) { // 如果没有错误
        // 获取特特定字符串的范围
        NSTextCheckingResult *match = [regex firstMatchInString:self
                                                        options:0
                                                          range:NSMakeRange(0, [self length])];
        if (match) {
            // 截获特定的字符串
            NSRange range = NSMakeRange(match.range.length, self.length - match.range.length);
            NSString *result = [self substringWithRange:range];
            return result;
        } else {
            NSLog(@"没有找到匹配的字符串，请检查正则表达式");
            return nil;
        }
    } else { // 如果有错误，则把错误打印出来
        NSLog(@"error - %@", error);
        return nil;
        
    }

}

#pragma mark - replace

- (NSString *)replace:(NSString *)key withStr:(NSString *)replacement {
    return [self stringByReplacingOccurrencesOfString:key withString:replacement];
}

// 使用正则表达式替换字符串 - 全部替换
- (NSString *_Nullable)replaceUseRegex:(NSString *_Nonnull)key withStr:(NSString *_Nonnull)replacement
{
    NSString *valueTemp = self.copy;
    NSString *valueTempReturn = self.copy;
    
    NSError *error = nil;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:key options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        return self;
    }
    NSArray *matches = [reg matchesInString:valueTemp options:0 range:NSMakeRange(0, valueTemp.length)];
    for (NSTextCheckingResult *match in matches) {
        NSString *str = [valueTemp substringWithRange:[match range]];
        valueTempReturn = [valueTempReturn replace:str withStr:replacement];
    }
    return valueTempReturn;
}

- (NSString *)replaceForward:(NSString *)key withStr:(NSString *)replacement {
    if (![self containsString:key]) {
        return @"";
    }
    NSRange ra = [self rangeOfString:key options:NSLiteralSearch];
    return [self stringByReplacingCharactersInRange:ra withString:replacement];
}

- (NSString *)replaceBackward:(NSString *)key withStr:(NSString *)replacement {
    if (![self containsString:key]) {
        return @"";
    }
    NSRange ra = [self rangeOfString:key options:NSBackwardsSearch];
    return [self stringByReplacingCharactersInRange:ra withString:replacement];
}

#pragma mark - trim

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)trimAll {
    //1. 去掉首尾空格和换行符
    NSString *string;
    string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //2. 去掉所有空格和换行符
    string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
}

#pragma mark - split

- (NSArray<NSString *> *)split:(NSString *)key {
    return [self componentsSeparatedByString:key];
}

- (NSArray<NSString *> *)split:(NSString *)key index:(int)index {
    if (index == -1) {
        return [self componentsSeparatedByString:key];
    }
    return nil; //暂时返回nil
}

#pragma mark - append

- (NSString *)append:(NSString *)str {
    return [self stringByAppendingString:str];
}


#pragma mark format length

/**
 把一个字符串格式化成至少 ‘length’ 位的字符串，不够的在前面补足空格。
 
 @param length 给定的length长度
 @return 返回新串
 */
- (nonnull NSString *)formatLength:(int)length {
    if (length <= 0) {
        NSLog(@"length 必须为正整数! ");
        return self;
    }
    NSString *temp = self;
    int diff = length - (int)self.length;
    if (diff > 0) {
        for (int i = 0; i < diff; i++) {
            temp = [@" " stringByAppendingString:temp];
        }
    }
    return temp;
}








#pragma mark - toPlainString































@end




/**
 category URL
 */
@implementation NSString (URL)

- (NSString *)urlEncode {
//    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    NSCharacterSet *c = [NSCharacterSet characterSetWithCharactersInString:@"'();:@&=+$,/?%#[]"];
    [self stringByAddingPercentEncodingWithAllowedCharacters:c];
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

@end




/**
 category filePath
 */
@implementation NSString (FilePath)

#pragma mark - file path

- (NSString *)fileNameExtension {
    NSString *str = [[self substringFromIndex:self.length - 1] isEqualToString:@"/"] ? [self substringToIndex:self.length - 1] : self;
    return [str lastPathComponent];
}

- (NSString *)fileName {
    return [[self fileNameExtension] stringByDeletingPathExtension];
}

- (NSString *)fileExtension {
//    NSArray *arr = [[self fileName] componentsSeparatedByString:@"."];
//    if (!arr || arr.count == 0) {
//        return @"";
//    }
//    return [arr lastObject];
    
    return [self pathExtension];
}

// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径
- (NSString *)filePath {
    NSString *str = [[self substringFromIndex:self.length - 1] isEqualToString:@"/"] ? [self substringToIndex:self.length - 1] : self;
//    NSMutableArray *marr = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"/"]];
//    [marr removeLastObject];
//    return [marr componentsJoinedByString:@"/"];
    
    NSRange range = [str rangeOfString:@"/" options:NSBackwardsSearch];
    return [str substringWithRange:NSMakeRange(0, range.location)];
}


@end



/**
 category SandBox
 */
@implementation NSString (SandBox)

- (NSString *)appendDocumentFilePath {
    NSString * doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [doc stringByAppendingPathComponent:self];
}


@end










/**
 NSMutableString + GXAddition
 */
@implementation NSMutableString (GXAddition)

- (void)appendm:(NSString *)str {
    [self appendString:str];
}











@end




