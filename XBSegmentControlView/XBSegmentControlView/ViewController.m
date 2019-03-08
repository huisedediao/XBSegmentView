//
//  ViewController.m
//  XBSegmentView
//
//  Created by xxb on 2019/3/8.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XBSegmentView *view = [[XBSegmentView alloc] initWithTitleArr:@[@"png",@"avi",@"gif",@"rmvb"]];
    view.frame = CGRectMake(50, 100, 300, 40);
    [self.view addSubview:view];
    view.bl_selected = ^(XBSegmentView *segmentView, NSInteger index) {
        NSLog(@"%ld",index);
    };
    view.color_btnBgNormal = [UIColor orangeColor];
    view.color_btnBgSelected = [UIColor grayColor];
    view.color_btnTitleNormal = [UIColor purpleColor];
    view.color_btnTitleSelected = [UIColor yellowColor];
    view.color_border = [UIColor greenColor];
}

@end
