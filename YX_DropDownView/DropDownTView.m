//
//  DropDownTView.m
//  YX_DropDownView
//
//  Created by yang on 16/8/8.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "DropDownTView.h"
@interface DropDownTView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@end
@implementation DropDownTView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.01)];
    }
    return self;
}
- (void)setComArr:(NSArray *)comArr{
    _comArr = comArr;
}
-(void)setYearArr:(NSArray *)yearArr{
    _yearArr = yearArr;
}
-(void)setMonthArr:(NSArray *)monthArr{
    _monthArr = monthArr;
}
-(void)setDayArr:(NSArray *)dayArr{
    _dayArr = dayArr;
}
-(void)setIndexArr:(NSMutableArray *)indexArr{
    _indexArr = indexArr;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    
    if ([[_indexArr objectAtIndex:section] isEqualToString:@"1"]) {
        
        return [[_comArr objectAtIndex:section] count];
    }else{
        return 0;
    }

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
     UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
            cell.textLabel.text = [[_comArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        
//            }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *dropBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    dropBtn.backgroundColor = [UIColor greenColor];
    [dropBtn setTag:section];
    [dropBtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    return dropBtn;
}
-(void)didClick:(UIButton *)sender{
   
    if ([[_indexArr objectAtIndex:sender.tag] isEqualToString:@"0"]) {
        [_indexArr replaceObjectAtIndex:sender.tag withObject:@"1"];
    }
    else if ([[_indexArr objectAtIndex:sender.tag] isEqualToString:@"1"]){
        [_indexArr replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    
    [self reloadData];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
