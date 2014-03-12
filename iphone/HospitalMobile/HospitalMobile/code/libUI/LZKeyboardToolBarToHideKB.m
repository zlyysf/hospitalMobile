//
//  LZKeyboardToolBar.m
//  nutrition
//
//  Created by liu miao on 6/5/13.
//  Copyright (c) 2013 lingzhi mobile. All rights reserved.
//

#import "LZKeyboardToolBarToHideKB.h"

#define kKeyBoardToolBarRect CGRectMake(0,0,320,44)

@interface LZKeyboardToolBarToHideKB ()
//@property (assign,nonatomic)id<LZKeyboardToolBarDelegate>donedelegate;
@property (assign,nonatomic)UIResponder *textCtrl;
@end



@implementation LZKeyboardToolBarToHideKB
//@synthesize donedelegate;
@synthesize textCtrl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//- (id)initWithFrame:(CGRect)frame doneButtonTitle:(NSString *)buttonTitle delegate:(id<LZKeyboardToolBarDelegate>)toolbarDelegate andTextCtrl:(UIResponder*)textCtrl
- (id)initWithFrame:(CGRect)frame doneButtonTitle:(NSString *)buttonTitle andTextCtrl:(UIResponder*)textCtrl
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.donedelegate = toolbarDelegate;
        self.textCtrl = textCtrl;
        UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc]initWithTitle:buttonTitle style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClicked)];
        NSArray *items = [[NSArray alloc]initWithObjects:spaceBarItem,doneButtonItem, nil];
        self.items = items;
        self.barStyle = UIBarStyleDefault;
        self.translucent = YES;
    }
    return self;
}

//+(LZKeyboardToolBar *)newOne_withDoneButtonTitle:(NSString *)buttonTitle delegate:(id<LZKeyboardToolBarDelegate>)toolbarDelegate andTextCtrl:(UIResponder*)textCtrl
+(id)newOne_withDoneButtonTitle:(NSString *)buttonTitle andTextCtrl:(UIResponder*)textCtrl
{
    id obj = [[LZKeyboardToolBarToHideKB alloc] initWithFrame:kKeyBoardToolBarRect doneButtonTitle:buttonTitle andTextCtrl:textCtrl];
    return obj;
}



- (void)doneButtonClicked
{
//    if (self.donedelegate && [self.donedelegate respondsToSelector:@selector(KeyboardToolBarDoneButtonClicked)])
//    {
//        [self.donedelegate KeyboardToolBarDoneButtonClicked];
//    }
    if(textCtrl!=nil){
        [textCtrl resignFirstResponder];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
