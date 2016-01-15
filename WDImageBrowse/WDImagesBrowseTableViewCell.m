//
//  WDImagesBrowseTableViewCell.m
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/14.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "WDImagesBrowseTableViewCell.h"

@interface WDImagesBrowseTableViewCell (){
    UIScrollView *contentScrollView;
}

@end


@implementation WDImagesBrowseTableViewCell
-(instancetype)initWithReuseIdentifier:(NSString *)identifier{
    self = [super initWithReuseIdentifier:identifier];
    if (self) {
        _imageScrollView = [[ImageScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self addSubview:_imageScrollView];
    }
    return self;
}

//设置image
-(void)setImage:(UIImage*)image{
    [_imageScrollView.contentImageView setImage:image];
    //以控件的宽度为单位，获取图片的高度
    CGFloat width = self.frame.size.width;
    CGFloat heigth = width*image.size.height/image.size.width;
    //如果图片的高度大于控件的高度，则以控件的高度为准，计算屏幕的宽度
    if (heigth > self.frame.size.height) {
        heigth = self.frame.size.height;
        width = heigth*image.size.width/image.size.height;
    }
    [_imageScrollView setZoomScale:1];
    [_imageScrollView.contentImageView setFrame:CGRectMake((self.frame.size.width-width)/2, (self.frame.size.height-heigth)/2, width, heigth)];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
