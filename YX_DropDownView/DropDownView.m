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
    UIView *firView;
}

@end
@implementation DropDownView

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        UIButton *confir = [[UIButton alloc]initWithFrame:CGRectMake(0, 260, self.frame.size.width, 40)];
        confir.backgroundColor = [UIColor whiteColor];
        [confir setTitle:@"确定" forState:UIControlStateNormal];
        [confir setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        confir.layer.cornerRadius = 3;
        [self addSubview:confir];
        UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 310, self.frame.size.width, 40)];
        cancel.backgroundColor = [UIColor whiteColor];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cancel.layer.cornerRadius = 3;
        [self addSubview:cancel];

        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 240)];
        view.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        view.layer.cornerRadius = 10;
        [self addSubview:view];
        firView = view;
        //建标题title
        UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
        title.text = @"出生年月";
        title.textAlignment = NSTextAlignmentCenter;
        [firView addSubview:title];

        
            }
    return self;
}
- (void)setDataArr:(NSArray *)dataArr{

    _dataArr = dataArr;
    [self createTableView];
}
-(void)createTableView{
    
        NSArray *arr = @[@"年",@"月",@"日"];
    NSArray *arr1 = @[@"2016",@"8",@"9"];
    for (int i = 0; i<3; i++) {
        
        UILabel *lasTit = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-50, i*10+40*i+60, 30, 40)];
        lasTit.text = [arr objectAtIndex:i];
        [firView addSubview:lasTit];
        
        resBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, i*10+40*i+60, self.frame.size.width-100, 40)];
        resBtn.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.5];
        resBtn.layer.borderColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1].CGColor;
        resBtn.layer.borderWidth = 1;
        [resBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [resBtn setTitle:[arr1 objectAtIndex:i] forState:UIControlStateNormal];
        resBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
        [resBtn setImage:[UIImage imageNamed:@"drop.png"] forState:UIControlStateNormal];
        resBtn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        resBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 130, 0, 20);
        [resBtn setTag:i+10000];
        [resBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(40, i*50+40+60, self.frame.size.width-100, 250-i*50) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.hidden = YES;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.01f)];
        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.01f)];
        [tableView setTag:i+1000];
        [self addSubview:tableView];
        
        [self addSubview:resBtn];
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 1000) {
        return [[_dataArr objectAtIndex:0] count];
    }
    else if (tableView.tag == 1001){
        return [[_dataArr objectAtIndex:1] count];
    }
    else{
        return [[_dataArr objectAtIndex:2] count];
    }
//    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.4];
    if (tableView.tag == 1000) {
        cell.textLabel.text = [[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row];
    }
    else if (tableView.tag == 1001){
        cell.textLabel.text = [[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row];
    }
    else if (tableView.tag == 1002){
        cell.textLabel.text = [[_dataArr objectAtIndex:2] objectAtIndex:indexPath.row];
    }
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 40;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
//    [btn setBackgroundColor:[UIColor greenColor]];
//    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTag:1000];
//    return btn;
//}
-(void)click:(UIButton *)sender{
    
    if (sender.tag == 10000) {
        UITableView *tableView1 = (UITableView *)[self viewWithTag:1000];
        if (tableView1.hidden) {
            [self bringSubviewToFront:tableView1];
            tableView1.hidden = NO;
            sender.imageView.transform =  CGAffineTransformMakeRotation(0);
            
            
        }else{
            
            tableView1.hidden = YES;
            sender.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        }
    }
    if (sender.tag == 10001) {
        UITableView *tableView2 = (UITableView *)[self viewWithTag:1001];
        if (tableView2.hidden) {
            [self bringSubviewToFront:tableView2];
            tableView2.hidden = NO;
            sender.imageView.transform =  CGAffineTransformMakeRotation(0);
            
            
        }else{
            
            tableView2.hidden = YES;
            sender.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        }

    }
    if (sender.tag == 10002) {
        UITableView *tableView3 = (UITableView *)[self viewWithTag:1002];
        if (tableView3.hidden) {
            [self bringSubviewToFront:tableView3];
            tableView3.hidden = NO;
            sender.imageView.transform =  CGAffineTransformMakeRotation(0);
            
            
        }else{
            
            tableView3.hidden = YES;
            sender.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        }
        
    }

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1000) {
        UIButton *btn = (UIButton *)[self viewWithTag:10000];
        [btn setTitle:[[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        btn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        UITableView *tview = (UITableView *)[self viewWithTag:1000];
        tview.hidden = YES;
    }
    if (tableView.tag == 1001) {
        UIButton *btn = (UIButton *)[self viewWithTag:10001];
        [btn setTitle:[[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        btn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        UITableView *tview = (UITableView *)[self viewWithTag:1001];
        tview.hidden = YES;
    }

    if (tableView.tag == 1002) {
        UIButton *btn = (UIButton *)[self viewWithTag:10002];
        [btn setTitle:[[_dataArr objectAtIndex:2] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        btn.imageView.transform =  CGAffineTransformMakeRotation(M_PI/2);
        UITableView *tview = (UITableView *)[self viewWithTag:1002];
        tview.hidden = YES;
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
