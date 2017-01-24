//
//  Chess.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "Chess.h"
#import "Chessboard.h"


@implementation Chess

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index
{
    if (self = [super init])
    {
        
        _isInAir = NO;
        
        _index = index;
        
        _rowWidth = rowWidth;
        
        self.backgroundColor = [UIColor clearColor];
        
        //行
        NSInteger row = index.row;
        
        //列
        NSInteger line = index.section;
        
        if (row > 4)
        {
            self.frame = CGRectMake(line * rowWidth - rowWidth/2.0, row * rowWidth - rowWidth/2.0, rowWidth, rowWidth);
            _isRed = YES;
        }
        else
        {
            self.frame = CGRectMake(line * rowWidth - rowWidth/2.0, row * rowWidth - rowWidth/2.0, rowWidth, rowWidth);
            _isRed = NO;
        }
        
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
    Chessboard *board = [Chessboard sharedChessboard];
    
    self.isInAir = !self.isInAir;
    
    if (self.isInAir) {
        if (board.selectedChess) {
            board.selectedChess.isInAir = NO;
        }
        board.selectedChess = self;
    }else {
        board.selectedChess = nil;
    }
}

- (void)setIsInAir:(BOOL)isInAir {

    _isInAir = isInAir;
    
    if (isInAir)
    {
        self.categoryLabel.backgroundColor = [UIColor blackColor];
    }
    else
    {
        self.categoryLabel.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setIsRed:(BOOL)isRed
{
    _isRed = isRed;
    _categoryLabel.textColor = _isRed == YES ? [UIColor redColor] : [UIColor blackColor];
}

// 由子类实现 而且子类必须实现(怎么提示?)
- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    return NO;
}



- (NSString *)description {

    return [NSString stringWithFormat:@"%@", self.categoryLabel.text];
}
@end
