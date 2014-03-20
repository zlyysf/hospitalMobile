//
//  UIScrollView+Zoom.h
//
//  Created by Chenglei Shen on 3/20/14
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Zoom)

- (BOOL)isZoomed;
- (CGRect)zoomRectAtCenter:(CGPoint)center scale:(float)scale;
- (void)zoomAtPoint:(CGPoint)point animated:(BOOL)animated;
- (void)zoomAtPoint:(CGPoint)point scale:(float)scale animated:(BOOL)animated;

@end
