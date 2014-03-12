//
//  LZKeyboardToolBar.h
//  nutrition
//
//  Created by liu miao on 6/5/13.
//  Copyright (c) 2013 lingzhi mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol LZKeyboardToolBarDelegate<NSObject>
//    -(void)KeyboardToolBarDoneButtonClicked;
//@end

@interface LZKeyboardToolBarToHideKB : UIToolbar
    
//    - (id)initWithFrame:(CGRect)frame doneButtonTitle:(NSString *)buttonTitle delegate:(id<LZKeyboardToolBarDelegate>)toolbarDelegate;
//    +(LZKeyboardToolBar *)newOne_withDoneButtonTitle:(NSString *)buttonTitle delegate:(id<LZKeyboardToolBarDelegate>)toolbarDelegate;

- (id)initWithFrame:(CGRect)frame doneButtonTitle:(NSString *)buttonTitle andTextCtrl:(UIResponder*)textCtrl;
+(LZKeyboardToolBarToHideKB *)newOne_withDoneButtonTitle:(NSString *)buttonTitle andTextCtrl:(UIResponder*)textCtrl;


@end


