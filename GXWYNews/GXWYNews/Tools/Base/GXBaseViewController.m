//
//  GXBaseViewController.m
//  GX_Base_OC
//

#import "GXBaseViewController.h"

@interface GXBaseViewController ()

#pragma mark  --------  设置导航栏rightItems使用  begin  --------

@property (nonatomic, strong) NSArray<NSString *> *rightTitles;
@property (nonatomic, strong) NSArray<NSString *> *rightActions;

@property (nonatomic, strong) NSMutableArray<UIBarButtonItem *> *gxRightItems;

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, UIBarButtonItem *> *gxRightItemsDict;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, UIBarButtonItem *> *gxRightItemsDictTemp;
#pragma mark  --------  setup rightItems  end  -------- 

@end

@implementation GXBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self private_initVariables_controller];
        [self init_variables_controller];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI]; //将设置视图的步骤放到vieDidLoad中
}


#pragma mark - methods

- (void)setRightItemTitles:(NSArray *)titles actions:(NSArray<NSString *> *)actions 
{
    if (!titles || titles.count <= 0) {
        return;
    }
    _rightTitles = titles.copy;
    _rightActions = actions.copy;
    
    int titleCount = (int)_rightTitles.count;
    int actionCount = (int)_rightActions.count;
    for (int i = 0; i < titleCount; i++) {
        NSString *action = nil;
        if (i < actionCount) {
            action = _rightActions[i];
        }
        id obj = _rightTitles[i];
        UIBarButtonItem *item = nil;
        if ([obj isKindOfClass:[NSString class]]) {
            item = [self getBarButtonItemWithTitle:(NSString *)obj action:action];
        } else if ([obj isKindOfClass:[UIImage class]]) {
            item = [self getBarButtonItemWithImage:(UIImage *)obj action:action];
        } else {
            @throw [NSException exceptionWithName:@"数组元素类型错误" reason:@"数组元素类型错误！请传入title字符串（NSString *）类型或者（UIImage *）图片类型！" userInfo:nil];
        }
        
        if (item) {
            [_gxRightItems addObject:item];
            _gxRightItemsDict[@(i)] = item;
        }
    }
    self.navigationItem.rightBarButtonItems = _gxRightItems;
}

// private
- (UIBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title action:(NSString *)action 
{
    UIFont *font = [UIFont boldSystemFontOfSize:14];
    CGFloat width = [title sizeWithAttributes:@{NSFontAttributeName: font}].width;
    UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    
    [item gx_setTitle:title boldFont:font normalColor:[UIColor whiteColor] highLightColor:[UIColor grayColor]];
    if (action) {
        [item addTarget:self action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

// private
- (UIBarButtonItem *)getBarButtonItemWithImage:(UIImage *)image action:(NSString *)action 
{
    UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 30)];
    [item setImage:image forState:UIControlStateNormal];
//    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    if (action) {
        [item addTarget:self action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

- (void)setRightItemVisible:(BOOL)visible byIndex:(NSUInteger)index {
    if (index >= _rightTitles.count) {
        NSLog(@"index不合法，可能造成数组越界！");
        return;
    }
    
    if (!visible) {
        [self setRightItemHIddenByIndex:index];
    } else {
        [self setRightItemVisibleByIndex:index];
    }
}

/// hidden
- (void)setRightItemHIddenByIndex:(NSUInteger)index {
    UIBarButtonItem *item = _gxRightItemsDict[@(index)];
    if (!item) {
        return;
    }
    
    _gxRightItemsDictTemp[@(index)] = item; 
    [_gxRightItemsDict removeObjectForKey:@(index)];
    
    NSArray *itemsArr = [self getRightItemsArr];
    self.navigationItem.rightBarButtonItems = itemsArr;
//    self.isLoadRightItemsOk = YES;
}

/// visible
- (void)setRightItemVisibleByIndex:(NSUInteger)index {
    UIBarButtonItem *item = _gxRightItemsDictTemp[@(index)];
    if (!item) {
        return;
    }
    
    _gxRightItemsDict[@(index)] = item;
    [_gxRightItemsDictTemp removeObjectForKey:@(index)];
    
    NSArray *itemsArr = [self getRightItemsArr];
    self.navigationItem.rightBarButtonItems = itemsArr;
//    self.isLoadRightItemsOk = YES;
}


/// private 设置item隐藏或者显示之后，重新获取items数组集合
- (NSArray<UIBarButtonItem *> *)getRightItemsArr {
    NSArray<NSNumber *> *keys = _gxRightItemsDict.allKeys;
    NSArray<NSNumber *> *keysAsc = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        int key1 = [obj1 intValue];
        int key2 = [obj2 intValue];
        
        if (key1 < key2) {
            return NSOrderedAscending;
        } else if (key1 == key2) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    [_gxRightItems removeAllObjects];
    for (int i = 0; i < keysAsc.count; i++) {
        [_gxRightItems addObject:_gxRightItemsDict[keysAsc[i]]];
    }
    
    return _gxRightItems;
}




#pragma markl - setupUI

- (void)setupUI {
    //
    
}



#pragma mark - setter & getter

- (void)private_initVariables_controller {
    _gxRightItems = [NSMutableArray<UIBarButtonItem *> array];
    _gxRightItemsDict = [NSMutableDictionary<NSNumber *, UIBarButtonItem *> dictionary];
    _gxRightItemsDictTemp = [NSMutableDictionary<NSNumber *, UIBarButtonItem *> dictionary];
}


- (void)init_variables_controller {  }


@end
