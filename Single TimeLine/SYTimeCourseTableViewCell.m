//
//  SYTimeCourseTableViewCell.m
//  Single TimeLine
//
//  Created by mac1 on 16/8/14.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "SYTimeCourseTableViewCell.h"

@implementation SYTimeCourseTableViewCell

- (void) awakeFromNib {
    
}

//去掉默认日期
- (void) deleteDate {
    
    _lbDate.hidden = YES;
    CGRect timeTemp = _lbTime.frame;
    timeTemp.origin = CGPointMake(timeTemp.origin.x, 8);
    _lbTime.frame = timeTemp;
    
    CGRect infoViewTemp = _infoView.frame;
    infoViewTemp.origin = CGPointMake(infoViewTemp.origin.x, 8);
    _infoView.frame = infoViewTemp;
    
}

//显示文本高度的设置，以确定整个tableViewCell的高度，最后返回cel的高度
- (CGFloat) setCellHeight:(NSString *)strInfo isSameDay:(BOOL)isSame {
    
    //如果是同一天，就抹去日期
    if (isSame) {
        [self deleteDate];
    }
    
    [_lbInfoContent setNumberOfLines:0];  //0行，则表示根据文本长度，自动增加行数
    NSString *labelText = strInfo;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0f];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    _lbInfoContent.attributedText = attributedString;
    [_lbInfoContent sizeToFit];  //填充
    //NSLog(@"%@",lbInfoContent);
    NSLog(@"%@", _lbInfoContent);
    
    CGRect infoContentViewTemp = _infoContentView.frame;
    infoContentViewTemp.size = CGSizeMake(212, _lbInfoContent.frame.size.height);
    _infoContentView.frame = infoContentViewTemp;
    
    //设置手势点击位置
    CGRect btTemp = _receiveView.frame;
    btTemp.origin = CGPointMake(0, _infoContentView.frame.origin.y + _infoContentView.frame.size.height + 8);
    _receiveView.frame = btTemp;
    NSLog(@"%@", _receiveView);
    
    //设置整个infoView的高度
    CGRect viewTemp = _infoView.frame;
    viewTemp.size = CGSizeMake(viewTemp.size.width, _receiveView.frame.origin.y + _receiveView.frame.size.height);
    _infoView.frame = viewTemp;
    NSLog(@"%@", _infoView);
    
    _lbSegment.frame = CGRectMake(_lbSegment.frame.origin.x, 0, 3,  _infoView.frame.origin.y + _infoView.frame.size.height + 8);
    NSLog(@"Height %f", _infoView.frame.origin.y + _infoView.frame.size.height+8);
    
    return _infoView.frame.origin.y + _infoView.frame.size.height+8;
}


//设置圆形
- (void) setRidues {
    
    _lbTime.layer.cornerRadius = _lbTime.frame.size.width / 2;
    [_lbTime.layer setMasksToBounds:YES];
}

//设置点击阅读样式
- (void) setClick {
    
    CGFloat R = (CGFloat) 128/255.0;
    CGFloat G = (CGFloat) 128/255.0;
    CGFloat B = (CGFloat) 128/255.0;
    CGFloat alpha = (CGFloat) 1.0;
    UIColor *colorRGB = [UIColor colorWithRed:R green:G blue:B alpha:alpha];
    _receiveView.backgroundColor = colorRGB;
//    _receiveView.backgroundColor = [UIColor greenColor];
    _lbReceive.text = @"我已经收到通知了";
}

//设置未点击阅读样式
- (void) setNotClick {
    
    CGFloat R  = (CGFloat) 255/255.0;
    CGFloat G = (CGFloat) 83/255.0;
    CGFloat B = (CGFloat) 83/255.0;
    CGFloat alpha = (CGFloat) 1.0;
    
    UIColor *ColorRGB = [ UIColor colorWithRed: R
                                         green: G
                                          blue: B
                                         alpha: alpha
                         ];
//    _receiveView.backgroundColor = ColorRGB;
     _receiveView.backgroundColor = [UIColor greenColor];
    _lbReceive.text = @"轻触收到通知";
    
}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    //Configure the view for the selected state
}

@end
