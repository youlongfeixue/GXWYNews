#import "NSMutableArray+Helper.h"


/**
 *
 *实现私有类实现
 */
@interface NSMutableArrayIterator:NSObject<Iterator>
/**
 *自定义初始化方法
 * @param array 目标数组，NSMutableArray 类型
 */
-(instancetype) initWidthMutableArray:(NSMutableArray *) array;
/**
 * 持有的目标数组
 */
@property (nonatomic,strong) NSMutableArray * array;

@property (nonatomic,assign) int nextIndex;
@property (nonatomic,assign) int currentIndex;


@end

@implementation NSMutableArrayIterator

-(instancetype) initWidthMutableArray:(NSMutableArray *) array
{
    if(self=[super init])
    {
        _array = array;
        _nextIndex = 0;
        _currentIndex = -1;
    }
    return self;
}

-(BOOL) hasNext
{
    _currentIndex ++;
    return _array!=nil && _array.count>_currentIndex;
}
-(NSObject *) next
{
    _nextIndex ++ ;
    //    _currentIndex =  _nextIndex - 1;
    
    if(_currentIndex>(_array.count-1))
    {
        NSException *e = [NSException
                          exceptionWithName: @"索引越界"
                          reason: @"迭代索引错误，不能大于元素数量"
                          userInfo: nil];
        @throw e;
    }
    
    return  [_array objectAtIndex:(_currentIndex)];
}
-(void) remove
{
    
    if(_currentIndex<0)
    {
        NSException *e = [NSException
                          exceptionWithName: @"状态异常"
                          reason: @"迭代索引错误，不能小于0"
                          userInfo: nil];
        @throw e;
    }
    
    [_array removeObjectAtIndex:(_currentIndex)];
    if (_currentIndex< _nextIndex )
    {
        _nextIndex--;
        _nextIndex = _nextIndex>0?_nextIndex:0;
    }
    _currentIndex = _currentIndex - 1;
}
@end

@implementation NSMutableArray(Helper)

-(id<Iterator>) iterator{
    
    NSMutableArrayIterator * iteratorArray = [[NSMutableArrayIterator alloc] initWidthMutableArray:self];
    
    return iteratorArray;
}

@end
