//
//  XBSegmentViewConfig.h
//  XBSegmentView
//
//  Created by xxb on 2019/3/8.
//  Copyright © 2019年 xxb. All rights reserved.
//

#ifndef XBSegmentViewConfig_h
#define XBSegmentViewConfig_h

#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0)

#define GWidthAdjust_ip6(x)                                 (1 * x)
#define GHeightAdjust_ip6(x)                                (1 * x)


#define XBSegmentView_float_leadingSpace (15)


#define XBSegmentView_Color_bg                                        RGB(36,42,62)
#define XBSegmentView_Color_blue                                      [UIColor colorWithRed:80/255.0 green:115/255.0 blue:208/255.0 alpha:1]
#define XBSegmentView_Color_white                                     [UIColor whiteColor]
#define XBSegmentView_Color_clear                                     [UIColor clearColor]
#define XBSegmentView_Image_clearColor                                [UIImage imageWithColor:[UIColor clearColor]]


#define XBSegmentView_Text_List                                       NSLocalizedString(@"List", nil)
#define XBSegmentView_Text_Room                                       NSLocalizedString(@"Room", nil)


#define XBSegmentView_Font_btn(x)                                     [UIFont systemFontOfSize:x]

//1像素线宽
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)


#endif /* XBSegmentViewConfig_h */
