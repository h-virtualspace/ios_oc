//
//  ViewController.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/7/29.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "ViewController.h"
#import "HStoryEditorView.h"
#import "InitSql.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect srect=[[UIScreen mainScreen] bounds];
    CGSize ssize=srect.size;
    CGFloat height=ssize.height;
    CGFloat width=ssize.width;
    CGRect frame=CGRectMake(0, 0, width, height);
    HStoryEditorView * storyView=[[HStoryEditorView alloc] initWithFrame:frame];
    [storyView initView];
    [self view].backgroundColor=[UIColor whiteColor];
    [[self view] addSubview:storyView];
    
    [InitSql initStoryTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
