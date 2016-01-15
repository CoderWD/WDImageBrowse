//
//  ImageScrollView.m
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/15.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 5;
        _contentImageView = [[UIImageView alloc] init];
        [self addSubview:_contentImageView];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTapFrom:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
    }
    return self;
}
//双击
static int scale = 1;
-(void)handleDoubleTapFrom:(UITapGestureRecognizer *)tap{
    scale = scale == 1 ? 5 : 1;
    CGRect zoomRect = [self zoomRectForScale:scale withCenter:[tap locationInView:self]];
    [self zoomToRect:zoomRect animated:YES];
}
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}


#pragma mark -
#pragma mark - scroll delegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _contentImageView;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize boundsSize = scrollView.bounds.size;
    CGRect imgFrame = _contentImageView.frame;
    CGSize contentSize = scrollView.contentSize;
    
    CGPoint centerPoint = CGPointMake(contentSize.width/2, contentSize.height/2);
    
    // center horizontally
    if (imgFrame.size.width <= boundsSize.width){
        centerPoint.x = boundsSize.width/2;
    }
    // center vertically
    if (imgFrame.size.height <= boundsSize.height){
        centerPoint.y = boundsSize.height/2;
    }
    _contentImageView.center = centerPoint;
}


-(void)layoutSubviews{
    [super layoutSubviews];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
