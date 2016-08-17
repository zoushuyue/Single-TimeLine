//
//  ViewController.m
//  Single TimeLine
//
//  Created by mac1 on 16/8/14.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "ViewController.h"
#import "SYTimeCourseTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *messageTableView;

@property int messagrSum; //cell的个数
@property NSArray *infoArray; //保存信息内容
@property NSMutableArray *clickArray; //记录是否已经阅读了信息 1 未接收 0 接收

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.

    //tableView
    [self setTableViewStyle];
    _messagrSum = 10;
    self.infoArray = [[NSArray alloc] initWithObjects:@"老夫聊发少年狂，治肾亏，不含糖。",
                      @"锦帽貂裘，千骑用康王。",
                      @"",
                      @"为报倾城随太守",
                      @"持节云中",
                      @"十年生死两茫茫",
                      @"千里孤坟",
                      @"纵使相逢应不识",
                      @"夜来幽梦忽还乡,相顾无言,得年年断肠处",
                      @"",nil];
    self.clickArray = [[NSMutableArray alloc] initWithObjects:@"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",
                       @"1",nil];
}

#pragma mark - 设置meddageTableView的背景色和去掉分割线
- (void) setTableViewStyle {
    
    self.messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;  //去掉tabelView分割线
    
    CGFloat R  = (CGFloat) 237/255.0;
    CGFloat G = (CGFloat) 237/255.0;
    CGFloat B = (CGFloat) 237/255.0;
    CGFloat alpha = (CGFloat) 1.0;
    UIColor *ColorRGB = [ UIColor colorWithRed: R
                                         green: G
                                          blue: B
                                         alpha: alpha
                         ];
    
    [self.messageTableView setBackgroundColor:ColorRGB];
}

#pragma mark - TableView数据源协议
//指定表格的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _messagrSum;
}

//设置每行高度
- (CGFloat)tableView:(UITableView *) tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //按照时间的分组，假设这里[0，2],[3，5],[6，9]是同一天
    //加载cell
    SYTimeCourseTableViewCell *nib = [[[NSBundle mainBundle] loadNibNamed:@"SYTimeCourseViewCell" owner:self options:nil] lastObject];
    
    if ([indexPath row] == 0) {
        NSLog(@"0");
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }
    else if ([indexPath row]<3) {
        NSLog(@"0 - 3");
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }else if ([indexPath row] == 3){
        NSLog(@"3");
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }else if ([indexPath row] < 6){
        NSLog(@"3 - 6");
        NSLog(@"%f",[nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES]);
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }else if ([indexPath row] == 6){
        NSLog(@"6");
        NSLog(@"%f",[nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO]);
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }else if ([indexPath row] > 6){
        NSLog(@"6- 9");
        NSLog(@"%f",[nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES]);
        return [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }else
        return 145;

}

//设置单元格内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //短工tableView
    static NSString *simpleIdentify = @"TimeCourse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentify];
    SYTimeCourseTableViewCell *nib = [[[NSBundle mainBundle] loadNibNamed:@"SYTimeCourseViewCell" owner:self options:nil] lastObject];
    [nib setTag:[indexPath row]];
    if ([[self.clickArray objectAtIndex:[indexPath row]] isEqualToString:@"1"]) {
        [nib setNotClick];
    }else
        [nib setClick];
    
    [nib setRidues];
    UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    nib.receiveView.userInteractionEnabled = YES;
    [nib.receiveView addGestureRecognizer:Tap];
    
    if ([indexPath row] == 0) {
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }
    else if ([indexPath row]<3) {
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }else if ([indexPath row] == 3){
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }else if ([indexPath row] < 6){
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }else if ([indexPath row] == 6){
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:NO];
    }else if ([indexPath row] > 6){
        [nib setCellHeight:[self.infoArray objectAtIndex:[indexPath row]] isSameDay:YES];
    }
    
    cell = nib;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;   //去掉提供的选中无颜色
    
    return  cell;
    
}


#pragma mark - TableView代理协议
//选中事件
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"44");
    
}

- (void) tapGesture:(UITapGestureRecognizer *) sender {
    
    NSLog(@"接收通知");
    UIView *view = sender.self.view;
    
    SYTimeCourseTableViewCell *cell = (SYTimeCourseTableViewCell *) view.superview.superview.superview;
    
    UILabel *lb = view.subviews[0];
    NSString *str = @"轻触受到通知";
    
    if ([lb.text isEqualToString:str]) {
        
        [cell setClick];
        [self.clickArray setObject:@"0" atIndexedSubscript:cell.tag];
    }
}

























@end
