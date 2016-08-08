//
//  DropDownTView.h
//  YX_DropDownView
//
//  Created by yang on 16/8/8.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownTView : UITableView

@property (nonatomic, strong) NSArray *comArr;
@property (nonatomic, strong) NSArray *yearArr;
@property (nonatomic, strong) NSArray *monthArr;
@property (nonatomic, strong) NSArray *dayArr;
@property (nonatomic, strong) NSMutableArray *indexArr;
@end
