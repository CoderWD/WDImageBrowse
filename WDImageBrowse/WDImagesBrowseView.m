//
//  WDImagesBrowseView.m
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/14.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "WDImagesBrowseView.h"
#import "WDImagesBrowseTableViewCell.h"

@interface WDImagesBrowseView ()<WDHorizontalTableViewDelegate>{
    BOOL isNativeFile;//是否为本地文件
}
@property(nonatomic,strong) NSMutableArray *imageArray;
@end

@implementation WDImagesBrowseView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDelegate:self];
        [self setColumnWidth:[UIScreen mainScreen].bounds.size.width];
        [self setPagingEnabled:YES];
    }
    return self;
}

-(void)reloadData{
    if ([_imageFilePathArray count]) {
        _imageArray = _imageFilePathArray;
        isNativeFile = YES;
    }else if([_imageUrlArray count]){
        _imageArray = _imageUrlArray;
        isNativeFile = NO;
    }
    [super reloadData];
}

- (NSInteger)horizontalTableViewNumberOfColumn:(WDHorizontalTableView *)horizontalTableView{
    return [_imageArray count];
}

- (WDHorizontalTableViewCell *)horizontalTableView:(WDHorizontalTableView *)horizontalTableView cellForColumnIndex:(NSInteger)columnIndex{
    static NSString *identifer = @"WDImagesBrowseTableViewCell";
    WDImagesBrowseTableViewCell *cell = [horizontalTableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[WDImagesBrowseTableViewCell alloc] initWithReuseIdentifier:identifer];
    }
    if (columnIndex%2 == 0) {
        [cell setBackgroundColor:[UIColor orangeColor]];
    }else if (columnIndex%3 == 0){
        [cell setBackgroundColor:[UIColor blueColor]];
    }else{
        [cell setBackgroundColor:[UIColor grayColor]];
    }
    if (isNativeFile) {
        [cell setImage:[UIImage imageWithContentsOfFile:_imageArray[columnIndex]]];
    }
    NSLog(@"---->%ld",columnIndex);
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
