//
//  SharonViewCell.m
//  TestDemo
//
//  Created by bocai on 16/7/8.
//  Copyright © 2016年 bocai. All rights reserved.
//

#import "SharonViewCell.h"
#import "SharonModel.h"
@interface SharonViewCell()

@end

@implementation SharonViewCell



- (void)awakeFromNib {
    self.dateLabel.numberOfLines = 0;
//    NSLog(@"==%@",self.dateLabel.text);
}

- (void)setSharonModel:(SharonModel *)sharonModel {
    _sharonModel = sharonModel;
    NSString * date = sharonModel.date;
    NSArray * array = [date componentsSeparatedByString:@"."];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@  %@.%@",array[2],array[0],array[1]]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:28] range:NSMakeRange(0, 5)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(5, 7)];
   self.dateLabel.attributedText=attributedString;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    self.oneView.backgroundColor = [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1];
    self.twoView.backgroundColor = [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.oneView.backgroundColor = [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1];
    self.twoView.backgroundColor = [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1];
    
    // Configure the view for the selected state
}

@end
