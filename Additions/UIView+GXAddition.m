//
//  UIView+GXAddition.m
//  

#import "UIView+GXAddition.h"

@implementation UIView (GXAddition)

#pragma mark - setter & getter (Properties)






#pragma mark - Methods

// 截图 snapshot(快照)
- (UIImage *)gx_snapshot:(BOOL)opaque {
    //
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, opaque, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]; // ['haɪərɑrki] 层级
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [self.layer renderInContext:ctx];
    
    UIImage * resultImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImg;
}



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
- (CGSize)gx_nineBoxAlgorithm:(NSArray<UIView *> *)itemArr panelSize:(CGSize)panelSize itemSize:(CGSize)itemSize margin:(CGFloat)margin marginTop:(CGFloat)marginTop columCount:(NSInteger)columCount isAutoHeight:(BOOL)isAutoHeight {
    //
    CGFloat x, y; //坐标
    CGFloat width, height;
    CGRect itemFrame = CGRectZero;
    
//    NSLog(@"=itemSize-In: %@", NSStringFromCGSize(itemSize));
    
    CGFloat rowCount = (itemArr.count - 1) / columCount + 1;
    if (itemSize.width == 0 || itemSize.height == 0) {
        //根据宽度计算item的宽度
        width = (panelSize.width - (columCount + 1) * margin) / columCount;
        
        if (isAutoHeight) {
            //自动计算height
            height = (panelSize.height - (rowCount + 1) * margin) / rowCount;
        } else {
            //height 与计算出的 width 相等
            height = width;
        }// isAutoHeight  end
        
    }else {
        width = itemSize.width;
        height = itemSize.height;
    }
//    NSLog(@"---- width: %.2f, height: %.2f", width, height);
    
    int rowIndex, colIndex;
    for (int i = 0; i < itemArr.count; i++) {
        //
        rowIndex = i / columCount;
        colIndex = i % columCount;
        
        x = margin + colIndex * (width + margin);
        y = margin + rowIndex * (height + margin) + marginTop;
        
        itemFrame = CGRectMake(x, y, width, height);
        itemArr[i].frame = itemFrame;
    }// for end

//    NSLog(@"panelSize: %@", NSStringFromCGSize(panelSize));
//    NSLog(@"itemSize: %@", NSStringFromCGSize(itemFrame.size));
    return itemFrame.size;
}

// 阴影颜色、阴影半径、阴影不透明度
- (void)gx_shadowWithColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity {
    //
//    UIBezierPath * shadowPath = [UIBezierPath bezierPath];
//    [shadowPath moveToPoint:CGPointMake(self.gx_X - 2, self.gx_Y - 2)];
//    [shadowPath addLineToPoint:CGPointMake(self.gx_X - 2, self.gx_Height + 2)];
//    [shadowPath addLineToPoint:CGPointMake(self.gx_Width + 2, self.gx_Height + 2)];
//    [shadowPath addLineToPoint:CGPointMake(self.gx_Width + 2, self.gx_Y - 2)];
//    [shadowPath closePath];
    
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = 0.6f;
    self.layer.shadowRadius = 10;
    self.layer.shadowOffset = CGSizeMake(2, 2);
//    self.layer.shadowPath = shadowPath.CGPath;
}


- (void)gxKeyboardShow {
    
}


- (UIViewController *)getTargetVc {
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
}


- (void)removeAllViews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}









@end
