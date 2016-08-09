//
//  MainViewController.m
//  YX_DropDownView
//
//  Created by yang on 16/8/8.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainViewController.h"
#import "DropDownView.h"
@interface MainViewController ()
@property (nonatomic, strong) DropDownView *dropDownView;
@property (nonatomic, strong) NSArray *comArr;
@property (nonatomic, strong) NSArray *yearArr;
@property (nonatomic, strong) NSArray *monthArr;
@property (nonatomic, strong) NSArray *dayArr;

@property (nonatomic, strong) NSMutableArray *indexArr;

@end

@implementation MainViewController

-(NSArray *)comArr{
    if (_comArr == nil) {
        _comArr = @[@[@"1990",@"1991",@"1992",@"1993"],
                    @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"],
@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"]
                    ];
    }
    return _comArr;
}
-(NSMutableArray *)indexArr{
    if (_indexArr == nil) {
        _indexArr = [[NSMutableArray alloc]initWithObjects:@"0",@"0",@"0", nil];
    }
    return _indexArr;
}
-(NSArray *)yearArr{
    if (_yearArr == nil) {
        _yearArr = @[@"1990",@"1991",@"1992",@"1993"];
    }
    return _yearArr;
}
-(NSArray *)monthArr{
    if (_monthArr == nil) {
        _monthArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    }
    return _monthArr;
}

-(NSArray *)dayArr{
    if (_dayArr == nil) {
        _dayArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
    }
    return _dayArr;
}
- (DropDownView *)dropDownView{
    if (_dropDownView == nil) {
        _dropDownView = [[DropDownView alloc]initWithFrame:CGRectMake(0, 0, 100, 300)];
        _dropDownView.center = self.view.center;
    }
    return _dropDownView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dropDownView.dataArr = self.yearArr;
    [self.view addSubview:self.dropDownView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
