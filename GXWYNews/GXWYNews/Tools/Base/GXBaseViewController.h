//
//  GXBaseViewController.h
//  GX_Base_OC
//

#import <UIKit/UIKit.h>
#import "UIViewController+GXAddition.h"
#import "GXAdditions.h"


@interface GXBaseViewController : UIViewController

///初始化变量
- (void)init_variables_controller;

/// 设置视图
- (void)setupUI;


/// 设置rightItems的标题和对应的相应事件名称
- (void)setRightItemTitles:(NSArray *)titles actions:(NSArray<NSString *> *)actions;

/// 根据索引设置rightItem显示与否（这个方法比较耗时，可以考虑使用 【 dispatch_async(dispatch_get_main_queue(), ^{ coding... } 】 延迟处理）
- (void)setRightItemVisible:(BOOL)visible byIndex:(NSUInteger)index;

/// 加载rightItems完毕，可以设置诸如titleView等其他东西了
@property (nonatomic, assign) BOOL isLoadRightItemsOk;



@end
