//
//  ViewController.m
//  WDImageBrowse
//
//  Created by 何伟东 on 16/1/14.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "ViewController.h"
#import "WDImagesBrowseView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[[NSBundle mainBundle] pathForResource:@"25b1OOOPIC19" ofType:@"jpg"]];
    [array addObject:[[NSBundle mainBundle] pathForResource:@"1347158_132411659346_2" ofType:@"jpg"]];
    [array addObject:[[NSBundle mainBundle] pathForResource:@"200921922311483_2" ofType:@"jpg"]];
    [array addObject:[[NSBundle mainBundle] pathForResource:@"200912121754594322" ofType:@"jpg"]];
    
    WDImagesBrowseView *imagesBrowseView = [[WDImagesBrowseView alloc] initWithFrame:self.view.bounds];
    [imagesBrowseView setImageFilePathArray:array];
    [imagesBrowseView reloadData];
    [self.view addSubview:imagesBrowseView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
