//
//  ViewController.m
//  TestDemo
//
//  Created by bocai on 16/7/8.
//  Copyright © 2016年 bocai. All rights reserved.
//
#define kUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#define kNavigationBarHeight 64

#import "ViewController.h"
#import "SharonModel.h"
#import "SharonViewCell.h"
static NSString *const reuseIdentifier = @"SharonViewCell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,weak) UILabel *dateLabel;

@property (nonatomic,assign) NSInteger section;
@end

@implementation ViewController
- (NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource=[NSMutableArray array];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.section = 0;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.navigationBar.translucent = NO;
    //构建数据源
    [self setUpData];
    
    [self setUpTableView];
}

- (void)setUpData {
    
    for (int i = 0; i < 5; i++) {
        SharonModel * model = [[SharonModel alloc]init];
        model.date = [NSString stringWithFormat:@"2016.05.%zd",18-i];
        model.imageArray = @[@"3.png",@"3.png",@"3.png",@"3.png",@"3.png"];
        [self.dataSource addObject: model];
    }
    
}

- (void)setUpTableView {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kUIScreenWidth, kUIScreenHeight - kNavigationBarHeight) style:(UITableViewStylePlain)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [tableView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    [tableView setContentInset: UIEdgeInsetsMake(20, 0, 0, 0)];
//    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView = tableView;
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, kNavigationBarHeight + 20, 100, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"2015.06.12";
    label.hidden = YES;
    [self.view addSubview: label];
    self.dateLabel = label;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SharonModel * model = self.dataSource[section];
    return model.imageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView setContentInset: UIEdgeInsetsMake(20, 0, 0, 0)];
    SharonViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
    CGRect rectInSuperview = [tableView convertRect:rectInTableView toView:[tableView superview]];
//    NSLog(@"===%zd",indexPath.section);
//    if (indexPath.section != self.section) {
//        self.dateLabel.hidden = NO;
//        SharonModel * model = self.dataSource[indexPath.section];
//        self.dateLabel.text = [NSString stringWithFormat:@"%@",model.date];
//        self.section = indexPath.section;
//    }
    
//    NSLog(@"%f",rectInSuperview.origin.y);
    
    if (indexPath.row == 0) {
        cell.sharonModel = self.dataSource[indexPath.section];
        cell.dateLabel.hidden = NO;
        cell.twoView.hidden = YES;
    } else {
        cell.dateLabel.hidden = YES;
        cell.twoView.hidden = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"===%zd",indexPath.section);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
//        CGRect rect = [self.tableView rectForSection:1];
//        NSLog(@"===%f",rect.size.height);
        NSArray * arr = [self.tableView visibleCells];
        SharonViewCell * cell = [arr firstObject];
        
        NSArray * array = [self.tableView indexPathsForVisibleRows];
        NSIndexPath * p = [array firstObject];
        CGRect rect = [self.tableView rectForRowAtIndexPath:p];
        NSLog(@"===%f",rect.origin.y);
        if (p.section == 0) {
            if (p.row != 0) {
                self.dateLabel.hidden = NO;
                SharonModel * model = self.dataSource[p.section];
                self.dateLabel.text = model.date;
            }
        } else {
            self.dateLabel.hidden = NO;
            SharonModel * model = self.dataSource[p.section];
            self.dateLabel.text = model.date;
        }
        
        NSLog(@"***%zd",p.section);
//          NSMutableArray * dataArr = [NSMutableArray array];
//        for (NSIndexPath * indexPath in array) {
//            [dataArr addObject:[NSString stringWithFormat:@"%zd",indexPath.section]];
//        }
        //数组排序
//         NSInteger min = (long)[[dataArr valueForKeyPath:@"@min.intValue"] integerValue] ;
//        NSLog(@"---%zd",min);
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"===%zd",indexPath.section);
    
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
//     NSLog(@"===%zd",indexPath.section);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
