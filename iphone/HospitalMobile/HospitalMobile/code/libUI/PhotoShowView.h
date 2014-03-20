//
//  PhotoShowView.h
//
//  Created by Chenglei Shen on 3/20/14
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+Zoom.h"

@interface PhotoShowView : UIScrollView <UIScrollViewDelegate>
@property (nonatomic,readonly,strong) UIImageView *imageView;
@property (nonatomic,assign)          UIImage *image;

@property(nonatomic,assign)           float tapZoomStep;

@property (nonatomic,readonly,strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic,readonly,strong) UITapGestureRecognizer *oneTap;

- (id)initWithImage:(UIImage*)image;
- (void)setImageName:(NSString *)imageName;
- (void)setMaxMinZoomScalesForCurrentBounds;
- (void)resetDefaultScale;

@end
