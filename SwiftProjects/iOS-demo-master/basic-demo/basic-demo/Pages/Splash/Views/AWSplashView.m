//
//  AWSplashView.m
//  basic-demo
//
//  Created by wutong on 2019/9/14.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWSplashView.h"

@interface AWSplashView ()

@property (nonatomic, strong, readwrite) UIButton *button;

@end

@implementation AWSplashView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void) _removeSplashView {
    [self removeFromSuperview];
}

@end
