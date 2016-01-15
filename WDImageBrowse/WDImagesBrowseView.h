//
//  WDImagesBrowseView.h
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/14.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "WDHorizontalTableView.h"

@interface WDImagesBrowseView : WDHorizontalTableView

@property(nonatomic,strong) NSMutableArray *imageUrlArray;
@property(nonatomic,strong) NSMutableArray *imageFilePathArray;

@end
