//
//  SYTimeCourseTableViewCell.h
//  Single TimeLine
//
//  Created by mac1 on 16/8/14.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYTimeCourseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbDate;//日期

@property (weak, nonatomic) IBOutlet UILabel *lbTime;//时间

@property (weak, nonatomic) IBOutlet UIView *infoView;//info View

@property (weak, nonatomic) IBOutlet UILabel *lbInfoTitle;//通知标题

@property (weak, nonatomic) IBOutlet UILabel *lbInfoContent;//通知内容

@property (weak, nonatomic) IBOutlet UIView *infoContentView;//通知内容父视图

@property (weak, nonatomic) IBOutlet UILabel *lbSegment;//竖着的分割线

@property (weak, nonatomic) IBOutlet UIView *receiveView;//轻触手通知的父视图

@property (weak, nonatomic) IBOutlet UILabel *lbReceive;//轻触受到通知

- (CGFloat) setCellHeight:(NSString *)strInfo isSameDay:(BOOL)isSame;

- (void) setRidues;

- (void) setClick;
- (void) setNotClick;


@end

