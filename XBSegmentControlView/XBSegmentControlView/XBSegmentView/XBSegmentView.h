//
//  XBSegmentView.h
//  D11Module
//
//  Created by xxb on 2017/7/13.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XBSegmentView;

typedef void (^XBSegmentViewBlock)(XBSegmentView *segmentView,NSInteger index);

@protocol XBSegmentViewDelegate <NSObject>

- (void)chooseView:(XBSegmentView *)chooseView clickAtIndex:(NSInteger)index;

@end

@interface XBSegmentView : UIView
@property (nonatomic,weak) id<XBSegmentViewDelegate>delegate;
@property (nonatomic,copy) XBSegmentViewBlock bl_selected;
@property (nonatomic,assign,readonly) NSInteger selectedIndex;

@property (nonatomic,strong) UIColor *color_border;
@property (nonatomic,strong) UIColor *color_btnBgSelected;
@property (nonatomic,strong) UIColor *color_btnBgNormal;
@property (nonatomic,strong) UIColor *color_btnTitleNormal;
@property (nonatomic,strong) UIColor *color_btnTitleSelected;
@property (nonatomic,assign) CGFloat f_borderWidth;
@property (nonatomic,assign) CGFloat f_cornerRadius;

- (instancetype)initWithTitleArr:(NSArray *)titleArr;

@end
