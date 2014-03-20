//
//  PhotoShowView.m
//
//  Created by Chenglei Shen on 3/20/14
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "PhotoShowView.h"

@implementation PhotoShowView

- (id)initWithImage:(UIImage*)image
{
    if(self == [self initWithFrame:CGRectZero]){
        self.image = image;
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _tapZoomStep = 1.0;
    
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    _imageView = imageView;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:nil action:nil];
    
    oneTap.numberOfTapsRequired = 1;
    doubleTap.numberOfTapsRequired = 2;
    [oneTap requireGestureRecognizerToFail:doubleTap];
    
    [self addGestureRecognizer:oneTap];
    [self addGestureRecognizer:doubleTap];
    
    _doubleTap = doubleTap;
    _oneTap = oneTap;
    
    [self.imageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setFrame:(CGRect)frame
{
    if(!CGRectEqualToRect(self.frame, frame)){
        [super setFrame:frame];
        [self setMaxMinZoomScalesForCurrentBounds];
    }
}

- (void)dealloc
{
    [self.imageView removeObserver:self forKeyPath:@"image"];
}

#pragma mark -
#pragma mark Image method

- (void)setImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    [self setImage:image];
}


- (void)setImage:(UIImage *)newImage
{
    self.imageView.image = newImage;
}

- (UIImage*)image
{
    return self.imageView.image;
}

#pragma mark -
#pragma mark Scale Methods

- (void)setMaxMinZoomScalesForCurrentBounds
{
    [self setScaleDefault];
    [self.imageView setFrame:[self imageViewFrameForCurrentimage]];
    if(!self.imageView.image || CGSizeEqualToSize(self.bounds.size, CGSizeZero)) return;
    
    CGSize boundsSize = self.bounds.size;
    CGSize imageSize = _imageView.image.size;
    
    // calculate min/max zoomscale
    CGFloat xScale = boundsSize.width / imageSize.width;
    CGFloat yScale = boundsSize.height  / imageSize.height;
    CGFloat minScale = MIN(xScale, yScale);
    
    // If image is smaller than the screen then ensure we show it at
	// min scale of 1
    //minScale = xScale > 1 && yScale > 1 ? 1.0 : minScale;

    CGFloat maxScale = minScale < 1.0 ? 1.5 : 2.0;
    minScale = MIN(minScale, maxScale);

    self.minimumZoomScale = minScale;
    self.maximumZoomScale = maxScale;
    self.zoomScale = minScale;
    
    [self adjustImageViewOriginForCurrentScale];
}

- (void)setScaleDefault
{
    self.minimumZoomScale = 1;
    self.maximumZoomScale = 1;
    self.zoomScale = 1;
}

- (void)adjustImageViewOriginForCurrentScale
{
    CGRect imageViewfrmae = self.imageView.frame;
    CGRect bounds = self.bounds;
    
    CGFloat diffX = CGRectGetWidth(bounds) - CGRectGetWidth(imageViewfrmae);
    CGFloat diffY = CGRectGetHeight(bounds) - CGRectGetHeight(imageViewfrmae);
    
    imageViewfrmae.origin.x = diffX > 0 ? diffX / 2.0 : 0;
    imageViewfrmae.origin.y = diffY > 0 ? diffY / 2.0 : 0;
    self.imageView.frame = imageViewfrmae;
}

- (void)resetDefaultScale
{
    self.zoomScale = self.minimumZoomScale;
}

- (CGRect)imageViewFrameForCurrentimage
{
    CGRect imageViewFrameForCurrentimage = CGRectZero;
    imageViewFrameForCurrentimage.size = self.imageView.image.size;
    return imageViewFrameForCurrentimage;
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self adjustImageViewOriginForCurrentScale];
}

- (void)doubleTap:(UITapGestureRecognizer*)sender
{  
    if([self isZoomed]){
        [self setZoomScale:self.minimumZoomScale animated:YES];
    }else if (self.minimumZoomScale != self.maximumZoomScale){
        CGPoint point = [sender locationInView:self.imageView];
        [self zoomAtPoint:point scale:self.tapZoomStep * self.maximumZoomScale  animated:YES];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self.imageView && [keyPath isEqualToString:@"image"]){
        [self setMaxMinZoomScalesForCurrentBounds];
    }
}


@end
