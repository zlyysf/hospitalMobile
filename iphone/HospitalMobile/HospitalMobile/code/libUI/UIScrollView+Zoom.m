//
//  UIScrollView+Zoom.m
//
//  Created by Chenglei Shen on 3/20/14
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "UIScrollView+Zoom.h"

@implementation UIScrollView (Zoom)

- (BOOL)isZoomed
{
    return self.zoomScale != self.minimumZoomScale;
}

- (CGRect)zoomRectAtCenter:(CGPoint)center scale:(float)scale
{
    CGRect zoomRect;
    zoomRect.size.height = [self frame].size.height / scale;
    zoomRect.size.width  = [self frame].size.width  / scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);

    return zoomRect;
}

- (void)zoomAtPoint:(CGPoint)point animated:(BOOL)animated
{
    CGRect zoomRect = [self zoomRectAtCenter:point scale:self.maximumZoomScale];
    [self zoomToRect:zoomRect animated:animated];
}

- (void)zoomAtPoint:(CGPoint)point scale:(float)scale animated:(BOOL)animated
{
    CGRect zoomRect = [self zoomRectAtCenter:point scale:scale];
    [self zoomToRect:zoomRect animated:animated];
}

@end
