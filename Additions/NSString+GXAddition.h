//
//  NSString+GXAddition.h
//  

#import <Foundation/Foundation.h>

@interface NSString (GXAddition)

//- (NSString *)append:(NSString *)str, ...;

/// 判断一个字符串是否为 @"" 空字符串
- (BOOL)isEmpty;

- (BOOL)contains:(NSString *_Nonnull)str;

/**
 Returns a Boolean value that indicates whether a given string is equal to the receiver using a literal Unicode-based comparison.
 The comparison uses the canonical representation of strings, which for a particular string is the length of the string plus the UTF-16 code units that make up the string. When this method compares two strings, if the individual Unicodes are the same, then the strings are equal, regardless of the backing store. “Literal” when applied to string comparison means that various Unicode decomposition rules are not applied and UTF-16 code units are individually compared. So, for instance, “Ö” represented as the composed character sequence “O” (U+004F LATIN CAPITAL LETTER O) and a combining diaeresis “¨” (U+0308 COMBINING DIAERESIS) would not compare equal to “Ö” represented as a single Unicode character (U+00D6 LATIN CAPITAL LETTER O WITH DIAERESIS).

 @param str aString
 The string with which to compare the receiver.

 @return YES if aString is equivalent to the receiver (if they have the same id or if they are NSOrderedSame in a literal comparison), otherwise NO.
 */
- (BOOL)equals:(NSString *_Nonnull)str;



#pragma mark -  switch   Hanzi <==> Pinyin

///传入汉字字符串,获取连续大写拼音字符串
- (NSString *_Nonnull)switch2PinYinUpper;

///传入汉字字符串,获取连续小写拼音字符串
- (NSString *_Nonnull)switch2PinYinLower;

///传入汉子字符串，返回首字母大写的拼音字符串，每个汉字的拼音之间有一个空格。
- (NSString *_Nonnull)switch2PinYinCapitalized;

///传入汉子字符串，获取大写拼音字符串的首字母
- (NSString *_Nonnull)switch2PinYinFirstCapitalized;


#pragma mark - indexOf(@"")

- (int)indexOf:(NSString *_Nonnull)key;
- (int)lastIndexOf:(NSString *_Nonnull)key;





#pragma mark - subString

/**
 get a array based separator.
 
 @param separator separator for cut string
 @return new array
 */
//- (NSString *)cutStringWithSeparator:(NSString *)separator;



/**
 由后向前从索引为index处截取【前半段】组成新字符串
 
 @param index 倒序索引数
 @return 返回索引处开始前半段字符串
 */
- (NSString *_Nullable)subStringFrontOfLastIndex:(NSInteger)index;


/**
 由后向前从索引为index处截取【后半段】组成新字符串
 
 @param index 倒序索引数
 @return 返回索引处开始后半段字符串
 */
- (NSString *_Nullable)subStringBackOfLastIndex:(NSInteger)index;


/**
 截取关键字前面的字符串（关键词 从前向后查找）
 - 不包含关键字
 
 @param key 给定关键字
 @return 返回从开始到关键字之前的字符串
 */
- (NSString *_Nullable)subStringFrontOfKey:(NSString *_Nonnull)key;


/**
 截取关键字后面的字符串（关键词 从前向后查找）
 - 不包含关键字
 
 @param key 给定关键字
 @return 返回从关键字之后到结束的字符串
 */
- (NSString *_Nullable)subStringBackOfKey:(NSString *_Nonnull)key;



/**
 截取关键字前面的字符串（关键词 从后向前查找到）
 - 不包含关键字
 
 @param lastKey 从后向前搜索到的第一个关键字
 @return 返回关键字前面的字符串
 */
- (NSString *_Nullable)subStringFrontOfLastKey:(NSString *_Nonnull)lastKey;

/**
 截取关键字后面的字符串（关键词 从后向前查找）
 - 不包含关键字
 
 @param lastKey 从后向前搜索到的第一个关键字
 @return 返回关键字后面的字符串
 */
- (NSString *_Nullable)subStringBackOfLastKey:(NSString *_Nonnull)lastKey;

/**
 截取关键字前面的字符串（关键词 从后向前查找到）
 - 包含关键字
 
 @param lastKey 从后向前搜索到的第一个关键字
 @return 返回关键字前面的字符串
 */
- (NSString *_Nullable)subStringFrontOfLastKeyContains:(NSString *_Nonnull)lastKey;

/**
 截取关键字后面的字符串（关键词 从后向前查找）
 - 包含关键字
 
 @param lastKey 从后向前搜索到的第一个关键字
 @return 返回关键字后面的字符串
 */
- (NSString *_Nullable)subStringBackOfLastKeyContains:(NSString *_Nonnull)lastKey;

// by gbs
/**
 截取字符串 从下标from到下标to
 
 @param from 起始下标
 @param to 结束下标
 @return 返回截取的字符串结果
 */
- (NSString *_Nullable)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

/**
 截取字符串，从开始下标起，length长度止。

 @param from 起始下标
 @param length 要截取的长度
 @return 返回截取的字符串
 */
- (NSString *_Nullable)substringFromIndex:(NSUInteger)from length:(NSUInteger)length;


/**
 根据正则表达式截取出指定的字符串，然后将字符串从原string中截取掉(剔除)。

 @param pattern  正则表达式
 @return 返回截取的字符串（返回剔除指定字符串之后的字符串）
 */
- (NSString *_Nullable)subStringMatchPattern:(NSString *_Nonnull)pattern;


#pragma mark - replace


/**
 替换字符串 - 全部替换
 
 @param key 将被替换的目标字符串key
 @param replacement 将被替换成的字符串
 @return 返回新字符串
 */
- (NSString *_Nullable)replace:(NSString *_Nonnull)key withStr:(NSString *_Nonnull)replacement;

/**
 使用正则表达式替换字符串 - 全部替换
 
 @param key 将被替换的目标字符串key
 @param replacement 将被替换成的字符串
 @return 返回新字符串
 */
- (NSString *_Nullable)replaceUseRegex:(NSString *_Nonnull)key withStr:(NSString *_Nonnull)replacement;


/**
 替换字符串 - 从前向后替换第一个找到的key
 
 @param key 将被替换的字符串
 @param replacement 将被替换成的字符串
 @return 返回新字符串
 */
- (NSString *_Nullable)replaceForward:(NSString *_Nonnull)key withStr:(NSString *_Nonnull)replacement;


/**
 替换字符串 - 从后向前替换第一个找到的key
 
 @param key 将被替换的字符串
 @param replacement 将被替换成的字符串
 @return 返回新字符串
 */
- (NSString *_Nullable)replaceBackward:(NSString *_Nonnull)key withStr:(NSString *_Nonnull)replacement;

#pragma mark - trim

/**
 去掉首尾的空格
 
 @return 返回去掉首尾空格的新字符串
 */
- (NSString *_Nullable)trim;

/**
 去掉一个字符串中的换行符
 
 @return 返回去掉首尾空格和换行符的新字符串
 */
- (NSString *_Nullable)trimAll;

#pragma mark - split

/**
 根据指定key分割成数组
 
 @param key key
 @return 返回数组
 */
- (NSArray<NSString *> *_Nonnull)split:(NSString *_Nonnull)key;

/**
 根据指定key分割成数组

 @param key key
 @param index index
 @return 返回数组
 */
- (NSArray<NSString *> *_Nonnull)split:(NSString *_Nonnull)key index:(int)index;

#pragma mark - append

- (NSString *_Nonnull)append:(nonnull NSString *)str;


#pragma mark format with length

/**
 把一个字符串格式化成至少 ‘length’ 位的字符串，不够的在前面补足空格。

 @param length 给定的length长度 (length 必须为正整数! )
 @return 返回新串
 */
- (nonnull NSString *)formatLength:(int)length;






























@end





/**
 category URL
 */
@interface NSString (URL)

- (NSString * _Nonnull)urlEncode;


@end




/**
 category FilePath
 */
@interface NSString (FilePath)

/// 获取一个路径的最后一个目录名称；如果是文件，则获取文件名-带扩展名"test.doc"
- (NSString *_Nonnull)fileNameExtension;

/// 获取一个路径的最后一个目录名称； 如果是文件，则获取文件名-不带扩展名
- (NSString *_Nonnull)fileName;


/**
 获取一个文件路径所对应的文件扩展名 (如果文件没有扩展名，则返回空字符串，如果文件不存在，也将返回空串。)
 - "user/AA/BB/test.doc" => "doc"
 
 @return return 文件扩展名
 */
- (NSString *_Nonnull)fileExtension;

/// 获取一个文件所在的路径(所在文件夹) 或 一个路径所在的上级路径
- (NSString *_Nonnull)filePath;









@end


/**
 category SandBox
 */
@interface NSString (SandBox)

/// 获取沙盒 Document 路径并拼接文件名
- (NSString * _Nonnull)appendDocumentFilePath;


@end




/**
 NSMutableString + GXAddition
 */
@interface NSMutableString (GXAddition)

- (void)appendm:(nonnull NSString *)str;









@end















