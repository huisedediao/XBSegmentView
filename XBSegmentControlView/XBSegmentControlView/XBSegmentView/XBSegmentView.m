//
//  XBSegmentView.m
//  D11Module
//
//  Created by xxb on 2017/7/13.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBSegmentView.h"
#import "Masonry.h"
#import "XBSegmentViewConfig.h"
#import "XBButton+CompatibleUIButton.h"

#define BtnTagBase (111111)

@interface XBSegmentView ()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) NSArray *arr_title;
@property (nonatomic,strong) NSMutableArray *arrM_btn;
@property (nonatomic,weak) XBButton *btn_selected;
@end

@implementation XBSegmentView

- (instancetype)initWithTitleArr:(NSArray *)titleArr
{
    if (self = [super init])
    {
        self.arr_title = titleArr;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XBSegmentView销毁");
}

- (void)drawRect:(CGRect)rect
{
    if (self.arrM_btn.count)
    {
        return;
    }
    
    [super drawRect:rect];
    
    [self createSubviews];
    
    CGFloat multiplie = 1.0 / self.arr_title.count;
    
    UIView *lastView = nil;
    for (NSString *title in self.arr_title)
    {
        NSInteger index = [self.arr_title indexOfObject:title];
        XBButton *btn = [self createButtonWithTitle:title tag:BtnTagBase + index];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView)
            {
                make.left.equalTo(lastView.mas_right);
            }
            make.top.bottom.equalTo(self.contentView);
            make.width.equalTo(self.contentView).multipliedBy(multiplie);
        }];
        [self.arrM_btn addObject:btn];
        if (index == 0)
        {
            [self setBtnSelected:btn];
        }
        
        if (index != self.arr_title.count - 1)
        {
            UIView *lineV = [UIView new];
            [self.contentView addSubview:lineV];
            lineV.backgroundColor = self.color_border;
            [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self);
                make.left.equalTo(btn.mas_right);
                make.width.mas_equalTo(self.f_borderWidth);
            }];
            
            lastView = lineV;
        }
    }
}

#pragma mark - 方法重写
- (NSInteger)selectedIndex
{
    return self.btn_selected.tag - BtnTagBase;
}

#pragma mark - 点击事件
- (void)selectedBtnClick:(XBButton *)button
{
    if (self.btn_selected == button)
    {
        return;
    }
    
    for (XBButton *btn in self.arrM_btn)
    {
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }
    [self setBtnSelected:button];
    
    NSInteger index = button.tag - BtnTagBase;
    typeof(self) __weak weakSelf = self;
    
    if (self.bl_selected)
    {
        self.bl_selected(weakSelf, index);
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(chooseView:clickAtIndex:)])
    {
        [self.delegate chooseView:weakSelf clickAtIndex:index];
    }
}

#pragma mark - 被调用方法
- (void)createSubviews
{
    //边框
    self.contentView = ({
        UIView *borderView = [UIView new];
        [self addSubview:borderView];
        
        [borderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        borderView.layer.cornerRadius = self.f_cornerRadius;
        borderView.layer.borderWidth = self.f_borderWidth;
        borderView.layer.borderColor = self.color_border.CGColor;
        borderView.clipsToBounds = YES;
        borderView;
    });
}


- (XBButton *)createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    XBButton *button = [XBButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    
    [button setTitleColor:self.color_btnTitleNormal forState:UIControlStateNormal];
    [button setTitleColor:self.color_btnTitleSelected forState:UIControlStateSelected];
    
    button.backgroundColor = self.color_btnBgNormal;
    button.color_backgroundselected = self.color_btnBgSelected;
    button.titleLabel.font = XBSegmentView_Font_btn(16);
    button.tag = tag;
    
    [button addTarget:self action:@selector(selectedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)setBtnSelected:(XBButton *)btn
{
    btn.selected = YES;
    self.btn_selected = btn;
    self.btn_selected.userInteractionEnabled = NO;
}

#pragma mark - 懒加载
- (NSMutableArray *)arrM_btn
{
    if (_arrM_btn == nil)
    {
        _arrM_btn = [NSMutableArray new];
    }
    return _arrM_btn;
}
- (UIColor *)color_btnTitleNormal
{
    if (_color_btnTitleNormal == nil)
    {
        _color_btnTitleNormal = XBSegmentView_Color_blue;
    }
    return _color_btnTitleNormal;
}
- (UIColor *)color_btnTitleSelected
{
    if (_color_btnTitleSelected == nil)
    {
        _color_btnTitleSelected = XBSegmentView_Color_white;
    }
    return _color_btnTitleSelected;
}
- (UIColor *)color_btnBgSelected
{
    if (_color_btnBgSelected == nil)
    {
        _color_btnBgSelected = XBSegmentView_Color_blue;
    }
    return _color_btnBgSelected;
}
- (UIColor *)color_btnBgNormal
{
    if (_color_btnBgNormal == nil)
    {
        _color_btnBgNormal = XBSegmentView_Color_white;
    }
    return _color_btnBgNormal;
}
- (UIColor *)color_border
{
    if (_color_border == nil)
    {
        _color_border = XBSegmentView_Color_blue;
    }
    return _color_border;
}
- (CGFloat)f_borderWidth
{
    if (_f_borderWidth == 0)
    {
        return SINGLE_LINE_WIDTH;
    }
    return _f_borderWidth;
}
- (CGFloat)f_cornerRadius
{
    if (_f_cornerRadius == 0)
    {
        return 6;
    }
    return _f_cornerRadius;
}
@end

