//
//  WDImagesBrowseTableViewCell.h
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/14.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "WDHorizontalTableViewCell.h"
#import "ImageScrollView.h"

@interface WDImagesBrowseTableViewCell : WDHorizontalTableViewCell
@property(nonatomic,strong) ImageScrollView *imageScrollView;
//设置image
-(void)setImage:(UIImage*)image;

@end
