//
//  GXBaseNavigationController.m
//  GX_Base_OC
//

#import "GXBaseNavigationController.h"

@interface GXBaseNavigationController ()

@end

@implementation GXBaseNavigationController

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

#pragma markl - setupUI
-(void) setupUI {
    //
    
}

@end
