//
//  DropDownView.m
//  YX_DropDownView
//
//  Created by yang on 16/8/9.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "DropDownView.h"
@interface DropDownView()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
    UIButton *resBtn;
}

@end
@implementation DropDownView

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
- (void)setDataArr:(NSArray *)dataArr{

    _dataArr = dataArr;
    [self createTableView];
}
-(void)createTableView{

    resBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    resBtn.backgroundColor = [UIColor greenColor];
    [resBtn setTitle:@"2013" forState:UIControlStateNormal];
    resBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    [resBtn setImage:[UIImage imageNamed:@"drop.png"] forState:UIControlStateNormal];
    resBtn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
    resBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 20);
    [resBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 190) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.hidden = YES;
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.01f)];
    [self addSubview:tableView];
    
    [self addSubview:resBtn];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [_dataArr objectAtIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
-(void)click{
    
    if (tableView.hidden) {
        tableView.hidden = NO;
        resBtn.imageView.transform =  CGAffineTransformMakeRotation(0);
        
    }else{
        tableView.hidden = YES;
        resBtn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [resBtn setTitle:[_dataArr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    self->tableView.hidden = YES;
    resBtn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
