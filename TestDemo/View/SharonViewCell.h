//
//  SharonViewCell.h
//  TestDemo
//
//  Created by bocai on 16/7/8.
//  Copyright © 2016年 bocai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SharonModel;
@interface SharonViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *twoViewBottomConstraint;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIView *oneView;
@property (strong, nonatomic) IBOutlet UIView *twoView;

@property (nonatomic,strong) SharonModel *sharonModel;
@end
