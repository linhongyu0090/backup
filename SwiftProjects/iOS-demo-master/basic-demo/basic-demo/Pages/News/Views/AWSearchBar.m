//
//  AWSearchBar.m
//  basic-demo
//
//  Created by wutong on 2019/9/21.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWSearchBar.h"
#import "AWScreen.h"

@interface AWSearchBar ()<UITextFieldDelegate>

@property(nonatomic, strong, readwrite) UITextField *textField;

@end

@implementation AWSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(UI(10), UI(7), frame.size.width - UI(10) *2, frame.size.height - UI(7) *2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeUnlessEditing;
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";
            _textField;
        })];
    }
    return self;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //常用业务逻辑 - 字数判断 可以在此函数中实现
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}

@end
