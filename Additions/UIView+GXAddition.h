//
//  UIView+GXAddition.h
//  

#import <UIKit/UIKit.h>


//@protocol UIView_OnClickListener <NSObject>
//
//- (void)onClick;
//
//@end

@interface UIView (GXAddition)

#pragma mark - Properties







#pragma mark - Methods

/**
 截图 snapshot(快照)

 @param opaque 不透明度
 @return 返回截图后的图片
 */
- (UIImage *)gx_snapshot:(BOOL)opaque;



/**
 九宫格算法 Nine Box Algorithm
 
 -（根据列数确定 item 大小）
 @param itemArr 待排列元素views数组
 @param panelSize 九宫格面板的大小size
 @param itemSize item的大小（itemSize不为零，那么根据itemSize设置；否则自动计算宽度）
 @param margin item之间的间隔
 @param marginTop 九宫格整体的top距离其superView上方的长度
 @param columCount 列数
 @param isAutoHeight 是否自动高度(根据panel的height自动计算高度；否则高度与宽度相等)
 @return 返回每个布局好之后每个item的size
 */
- (CGSize)gx_nineBoxAlgorithm:(NSArray<UIView *> *)itemArr panelSize:(CGSize)panelSize itemSize:(CGSize)itemSize margin:(CGFloat)margin marginTop:(CGFloat)marginTop columCount:(NSInteger)columCount isAutoHeight:(BOOL)isAutoHeight;

/**
 设置阴影

 @param color 阴影颜色
 @param shadowRadius 阴影半径
 @param shadowOpacity 阴影不透明度
 */
- (void)gx_shadowWithColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity;

/**
 键盘弹出/收回，改变view的frame
 */
- (void)gxKeyboardShow;


/**
 获取view所在的控制器

 @return 返回view所在的控制器
 */
- (UIViewController *)getTargetVc;

- (void)removeAllViews;




@end
