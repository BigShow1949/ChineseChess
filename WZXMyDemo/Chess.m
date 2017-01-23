//
//  Chess.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "Chess.h"

@implementation Chess

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index
{
    if (self = [super init])
    {
        _isRed = YES;
        
        _isInAir = NO;
        
        _index = index;
        
        _rowWidth = rowWidth;
        
        self.backgroundColor = [UIColor clearColor];
        
        //行
        NSInteger row = index.row;
        
        //列
        NSInteger line = index.section;
        
        if (row > 5)
        {
            self.frame = CGRectMake(row * rowWidth - rowWidth/2.0 , line * rowWidth - rowWidth/2.0 + rowWidth, rowWidth, rowWidth);
        }
        else
        {
            self.frame = CGRectMake(row * rowWidth - rowWidth/2.0, line * rowWidth - rowWidth/2.0,rowWidth, rowWidth);
        }
        
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        self.categoryLabel = ({
        
            UILabel * categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, rowWidth, rowWidth)];
            
            categoryLabel.textColor = _isRed == YES ? [UIColor redColor] : [UIColor blackColor];
            
            categoryLabel.textAlignment = NSTextAlignmentCenter;
            
            categoryLabel.adjustsFontSizeToFitWidth = YES;
            
            categoryLabel.backgroundColor = [UIColor whiteColor];
            
            categoryLabel.layer.cornerRadius = rowWidth/2.0;
            
            categoryLabel.clipsToBounds = YES;
            
            categoryLabel.layer.borderColor = [UIColor grayColor].CGColor;
            categoryLabel.layer.borderWidth = 2;
            
            categoryLabel;
        });
        [self addSubview:_categoryLabel];
        
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnClick:(UIButton *)sender
{
    self.isInAir = !self.isInAir;
    
    
    if (self.isInAir == YES)
    {
        self.categoryLabel.backgroundColor = [UIColor blackColor];
    }
    else
    {
        self.categoryLabel.backgroundColor = [UIColor whiteColor];
    }
    
    NSLog(@"%@",_isInAir == YES?@"拿起":@"放下");
}

- (void)setIsRed:(BOOL)isRed
{
    _isRed = isRed;
    _categoryLabel.textColor = _isRed == YES ? [UIColor redColor] : [UIColor blackColor];
}


@end
