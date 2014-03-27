//
//  LZTextViewCanHideKb.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-27.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZTextViewCanHideKb.h"

@implementation LZTextViewCanHideKb

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.keyboardToolbar = [LZKeyboardToolBarToHideKB newOne_withDoneButtonTitle:@"关闭" andTextCtrl:self];
    self.inputAccessoryView = self.keyboardToolbar;
}







@end
